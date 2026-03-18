;; Auto-generated. Do not edit!


(when (boundp 'sdpo_ros_interfaces_hw::mot_data)
  (if (not (find-package "SDPO_ROS_INTERFACES_HW"))
    (make-package "SDPO_ROS_INTERFACES_HW"))
  (shadow 'mot_data (find-package "SDPO_ROS_INTERFACES_HW")))
(unless (find-package "SDPO_ROS_INTERFACES_HW::MOT_DATA")
  (make-package "SDPO_ROS_INTERFACES_HW::MOT_DATA"))

(in-package "ROS")
;;//! \htmlinclude mot_data.msg.html


(defclass sdpo_ros_interfaces_hw::mot_data
  :super ros::object
  :slots (_sample_period _pwm _encoder_delta _ticks_per_rev _angular_speed ))

(defmethod sdpo_ros_interfaces_hw::mot_data
  (:init
   (&key
    ((:sample_period __sample_period) 0.0)
    ((:pwm __pwm) 0)
    ((:encoder_delta __encoder_delta) 0)
    ((:ticks_per_rev __ticks_per_rev) 0.0)
    ((:angular_speed __angular_speed) 0.0)
    )
   (send-super :init)
   (setq _sample_period (float __sample_period))
   (setq _pwm (round __pwm))
   (setq _encoder_delta (round __encoder_delta))
   (setq _ticks_per_rev (float __ticks_per_rev))
   (setq _angular_speed (float __angular_speed))
   self)
  (:sample_period
   (&optional __sample_period)
   (if __sample_period (setq _sample_period __sample_period)) _sample_period)
  (:pwm
   (&optional __pwm)
   (if __pwm (setq _pwm __pwm)) _pwm)
  (:encoder_delta
   (&optional __encoder_delta)
   (if __encoder_delta (setq _encoder_delta __encoder_delta)) _encoder_delta)
  (:ticks_per_rev
   (&optional __ticks_per_rev)
   (if __ticks_per_rev (setq _ticks_per_rev __ticks_per_rev)) _ticks_per_rev)
  (:angular_speed
   (&optional __angular_speed)
   (if __angular_speed (setq _angular_speed __angular_speed)) _angular_speed)
  (:serialization-length
   ()
   (+
    ;; float64 _sample_period
    8
    ;; int16 _pwm
    2
    ;; int32 _encoder_delta
    4
    ;; float64 _ticks_per_rev
    8
    ;; float64 _angular_speed
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _sample_period
       (sys::poke _sample_period (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int16 _pwm
       (write-word _pwm s)
     ;; int32 _encoder_delta
       (write-long _encoder_delta s)
     ;; float64 _ticks_per_rev
       (sys::poke _ticks_per_rev (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angular_speed
       (sys::poke _angular_speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _sample_period
     (setq _sample_period (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int16 _pwm
     (setq _pwm (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int32 _encoder_delta
     (setq _encoder_delta (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _ticks_per_rev
     (setq _ticks_per_rev (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angular_speed
     (setq _angular_speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get sdpo_ros_interfaces_hw::mot_data :md5sum-) "9296bbf0c26da88feecdfff17cec0da1")
(setf (get sdpo_ros_interfaces_hw::mot_data :datatype-) "sdpo_ros_interfaces_hw/mot_data")
(setf (get sdpo_ros_interfaces_hw::mot_data :definition-)
      "float64 sample_period
int16 pwm
int32 encoder_delta
float64 ticks_per_rev
float64 angular_speed

")



(provide :sdpo_ros_interfaces_hw/mot_data "9296bbf0c26da88feecdfff17cec0da1")


