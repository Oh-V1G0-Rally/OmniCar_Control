;; Auto-generated. Do not edit!


(when (boundp 'sdpo_ros_interfaces_hw::mot_data_array)
  (if (not (find-package "SDPO_ROS_INTERFACES_HW"))
    (make-package "SDPO_ROS_INTERFACES_HW"))
  (shadow 'mot_data_array (find-package "SDPO_ROS_INTERFACES_HW")))
(unless (find-package "SDPO_ROS_INTERFACES_HW::MOT_DATA_ARRAY")
  (make-package "SDPO_ROS_INTERFACES_HW::MOT_DATA_ARRAY"))

(in-package "ROS")
;;//! \htmlinclude mot_data_array.msg.html


(defclass sdpo_ros_interfaces_hw::mot_data_array
  :super ros::object
  :slots (_stamp _mot_data_array ))

(defmethod sdpo_ros_interfaces_hw::mot_data_array
  (:init
   (&key
    ((:stamp __stamp) (instance ros::time :init))
    ((:mot_data_array __mot_data_array) ())
    )
   (send-super :init)
   (setq _stamp __stamp)
   (setq _mot_data_array __mot_data_array)
   self)
  (:stamp
   (&optional __stamp)
   (if __stamp (setq _stamp __stamp)) _stamp)
  (:mot_data_array
   (&rest __mot_data_array)
   (if (keywordp (car __mot_data_array))
       (send* _mot_data_array __mot_data_array)
     (progn
       (if __mot_data_array (setq _mot_data_array (car __mot_data_array)))
       _mot_data_array)))
  (:serialization-length
   ()
   (+
    ;; time _stamp
    8
    ;; sdpo_ros_interfaces_hw/mot_data[] _mot_data_array
    (apply #'+ (send-all _mot_data_array :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _stamp
       (write-long (send _stamp :sec) s) (write-long (send _stamp :nsec) s)
     ;; sdpo_ros_interfaces_hw/mot_data[] _mot_data_array
     (write-long (length _mot_data_array) s)
     (dolist (elem _mot_data_array)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _stamp
     (send _stamp :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _stamp :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; sdpo_ros_interfaces_hw/mot_data[] _mot_data_array
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _mot_data_array (let (r) (dotimes (i n) (push (instance sdpo_ros_interfaces_hw::mot_data :init) r)) r))
     (dolist (elem- _mot_data_array)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get sdpo_ros_interfaces_hw::mot_data_array :md5sum-) "1604e6f90e8e645db25b755372826780")
(setf (get sdpo_ros_interfaces_hw::mot_data_array :datatype-) "sdpo_ros_interfaces_hw/mot_data_array")
(setf (get sdpo_ros_interfaces_hw::mot_data_array :definition-)
      "time stamp
sdpo_ros_interfaces_hw/mot_data[] mot_data_array

================================================================================
MSG: sdpo_ros_interfaces_hw/mot_data
float64 sample_period
int16 pwm
int32 encoder_delta
float64 ticks_per_rev
float64 angular_speed

")



(provide :sdpo_ros_interfaces_hw/mot_data_array "1604e6f90e8e645db25b755372826780")


