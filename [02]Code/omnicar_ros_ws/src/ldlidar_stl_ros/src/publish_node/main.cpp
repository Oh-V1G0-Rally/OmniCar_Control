/**
 * @file main.cpp
 * @brief  Adattamento per OMNICAR: Gestione TF integrata (stile 5dpo)
 */
#include "ros_api.h"
#include <tf/transform_broadcaster.h> // Inclusione fondamentale per TF
#include "ldlidar_driver.h"

// Struttura estesa per includere i dati di posa necessari per la TF
struct LaserPose {
  double x, y, z;
  double roll, pitch, yaw;
  std::string base_frame_id;
};

void ToLaserscanMessagePublish(ldlidar::Points2D& src, double lidar_spin_freq, 
    LaserScanSetting& setting, LaserPose& pose, ros::Publisher& lidarpub);

uint64_t GetSystemTimeStamp(void);

int main(int argc, char **argv) {
  ros::init(argc, argv, "ldlidar_publisher");
  ros::NodeHandle nh;
  ros::NodeHandle nh_private("~");

  std::string product_name;
  std::string topic_name;
  std::string port_name;
  int serial_port_baudrate;
  LaserScanSetting setting;
  LaserPose pose; // Istanza per memorizzare la posizione fisica del LiDAR
  ldlidar::LDType type_name;
    
  nh_private.getParam("product_name", product_name);
  nh_private.getParam("topic_name", topic_name);
  nh_private.param("frame_id", setting.frame_id, std::string("base_laser"));
  nh_private.getParam("port_name", port_name);
  nh_private.param("port_baudrate", serial_port_baudrate, int(230400));

  // --- MODIFICA STILE 5DPO: Lettura parametri di posa per TF ---
  nh_private.param("laser_pose_x", pose.x, 0.0);
  nh_private.param("laser_pose_y", pose.y, 0.0);
  nh_private.param("laser_pose_z", pose.z, 0.0);
  nh_private.param("laser_pose_roll", pose.roll, 0.0);
  nh_private.param("laser_pose_pitch", pose.pitch, 0.0);
  nh_private.param("laser_pose_yaw", pose.yaw, 0.0);
  nh_private.param("base_frame_id", pose.base_frame_id, std::string("base_link"));
  // -------------------------------------------------------------

  nh_private.param("laser_scan_dir", setting.laser_scan_dir, bool(true));
  nh_private.param("enable_angle_crop_func", setting.enable_angle_crop_func, bool(false));
  nh_private.param("angle_crop_min", setting.angle_crop_min, double(0.0));
  nh_private.param("angle_crop_max", setting.angle_crop_max, double(0.0));

  ldlidar::LDLidarDriver* ldlidarnode = new ldlidar::LDLidarDriver();

  if (product_name == "LDLiDAR_LD06") {
    type_name = ldlidar::LDType::LD_06; 
  } else if (product_name == "LDLiDAR_LD19") {
    type_name = ldlidar::LDType::LD_19;
  } else {
    ROS_ERROR("Error, input <product_name> is illegal.");
    exit(EXIT_FAILURE);
  }

  ldlidarnode->RegisterGetTimestampFunctional(std::bind(&GetSystemTimeStamp)); 
  ldlidarnode->EnableFilterAlgorithnmProcess(true);

  if (!ldlidarnode->Start(type_name, port_name, serial_port_baudrate, ldlidar::COMM_SERIAL_MODE)) {
    ROS_ERROR("ldlidar node start is fail");
    exit(EXIT_FAILURE);
  }

  if (!ldlidarnode->WaitLidarCommConnect(3000)) {
    ROS_ERROR("ldlidar communication is abnormal.");
    exit(EXIT_FAILURE);
  }

  ros::Publisher lidar_pub = nh.advertise<sensor_msgs::LaserScan>(topic_name, 10);
  ros::Rate r(10); 
  ldlidar::Points2D laser_scan_points;
  double lidar_scan_freq;

  while (ros::ok()) {
    if (ldlidarnode->GetLaserScanData(laser_scan_points, 1500) == ldlidar::LidarStatus::NORMAL) {
        ldlidarnode->GetLidarScanFreq(lidar_scan_freq);
        // Passiamo anche la struttura pose alla funzione di pubblicazione
        ToLaserscanMessagePublish(laser_scan_points, lidar_scan_freq, setting, pose, lidar_pub);
    }
    r.sleep();
  }

  ldlidarnode->Stop();
  delete ldlidarnode;
  return 0;
}

void ToLaserscanMessagePublish(ldlidar::Points2D& src, double lidar_spin_freq, 
    LaserScanSetting& setting, LaserPose& pose, ros::Publisher& lidarpub) {
  
  // Broadcaster statico (creato una sola volta)
  static tf::TransformBroadcaster tf_broadcaster;
  
  float angle_min, angle_max, range_min, range_max, angle_increment;
  float scan_time;
  ros::Time start_scan_time = ros::Time::now();
  static ros::Time end_scan_time;
  static bool first_scan = true;

  if (first_scan) {
    first_scan = false;
    end_scan_time = start_scan_time;
    return;
  }

  scan_time = (start_scan_time - end_scan_time).toSec();

  // --- MODIFICA STILE 5DPO: Pubblicazione TF integrata ---
  tf::Transform transform;
  transform.setOrigin(tf::Vector3(pose.x, pose.y, pose.z));
  tf::Quaternion q;
  q.setRPY(pose.roll, pose.pitch, pose.yaw);
  transform.setRotation(q);
  
  // Pubblica il legame tra base_link e base_laser sincronizzato col messaggio
  tf_broadcaster.sendTransform(
      tf::StampedTransform(transform, start_scan_time, pose.base_frame_id, setting.frame_id)
  );
  // -------------------------------------------------------

  angle_min = 0;
  angle_max = (2 * M_PI);
  range_min = 0.02;
  range_max = 12;
  int beam_size = static_cast<int>(src.size());
  angle_increment = (angle_max - angle_min) / (float)(beam_size -1);

  if (lidar_spin_freq > 0) {
    sensor_msgs::LaserScan output;
    output.header.stamp = start_scan_time;
    output.header.frame_id = setting.frame_id;
    output.angle_min = angle_min;
    output.angle_max = angle_max;
    output.range_min = range_min;
    output.range_max = range_max;
    output.angle_increment = angle_increment;
    output.time_increment = (beam_size <= 1) ? 0 : scan_time / (float)(beam_size - 1);
    output.scan_time = scan_time;

    output.ranges.assign(beam_size, std::numeric_limits<float>::quiet_NaN());
    output.intensities.assign(beam_size, std::numeric_limits<float>::quiet_NaN());

    for (auto point : src) {
      float range = point.distance / 1000.f;
      float intensity = point.intensity;
      float dir_angle = point.angle;

      if (setting.enable_angle_crop_func) {
        if ((dir_angle >= setting.angle_crop_min) && (dir_angle <= setting.angle_crop_max)) {
          range = std::numeric_limits<float>::quiet_NaN();
          intensity = std::numeric_limits<float>::quiet_NaN();
        }
      }

      float angle = ANGLE_TO_RADIAN(dir_angle);
      int index = static_cast<int>(ceil((angle - angle_min) / angle_increment));
      if (index >= 0 && index < beam_size) {
        int final_index = setting.laser_scan_dir ? (beam_size - index - 1) : index;
        if (std::isnan(output.ranges[final_index]) || range < output.ranges[final_index]) {
            output.ranges[final_index] = (range == 0 && intensity == 0) ? std::numeric_limits<float>::quiet_NaN() : range;
            output.intensities[final_index] = (range == 0 && intensity == 0) ? std::numeric_limits<float>::quiet_NaN() : intensity;
        }
      }
    }
    lidarpub.publish(output);
    end_scan_time = start_scan_time;
  } 
}

uint64_t GetSystemTimeStamp(void) {
  auto tp = std::chrono::system_clock::now();
  auto tmp = std::chrono::duration_cast<std::chrono::nanoseconds>(tp.time_since_epoch());
  return ((uint64_t)tmp.count());
}
