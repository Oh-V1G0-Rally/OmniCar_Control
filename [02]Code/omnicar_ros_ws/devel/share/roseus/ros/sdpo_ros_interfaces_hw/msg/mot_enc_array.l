;; Auto-generated. Do not edit!


(when (boundp 'sdpo_ros_interfaces_hw::mot_enc_array)
  (if (not (find-package "SDPO_ROS_INTERFACES_HW"))
    (make-package "SDPO_ROS_INTERFACES_HW"))
  (shadow 'mot_enc_array (find-package "SDPO_ROS_INTERFACES_HW")))
(unless (find-package "SDPO_ROS_INTERFACES_HW::MOT_ENC_ARRAY")
  (make-package "SDPO_ROS_INTERFACES_HW::MOT_ENC_ARRAY"))

(in-package "ROS")
;;//! \htmlinclude mot_enc_array.msg.html


(defclass sdpo_ros_interfaces_hw::mot_enc_array
  :super ros::object
  :slots (_stamp _mot_enc_array_data ))

(defmethod sdpo_ros_interfaces_hw::mot_enc_array
  (:init
   (&key
    ((:stamp __stamp) (instance ros::time :init))
    ((:mot_enc_array_data __mot_enc_array_data) ())
    )
   (send-super :init)
   (setq _stamp __stamp)
   (setq _mot_enc_array_data __mot_enc_array_data)
   self)
  (:stamp
   (&optional __stamp)
   (if __stamp (setq _stamp __stamp)) _stamp)
  (:mot_enc_array_data
   (&rest __mot_enc_array_data)
   (if (keywordp (car __mot_enc_array_data))
       (send* _mot_enc_array_data __mot_enc_array_data)
     (progn
       (if __mot_enc_array_data (setq _mot_enc_array_data (car __mot_enc_array_data)))
       _mot_enc_array_data)))
  (:serialization-length
   ()
   (+
    ;; time _stamp
    8
    ;; sdpo_ros_interfaces_hw/mot_enc[] _mot_enc_array_data
    (apply #'+ (send-all _mot_enc_array_data :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _stamp
       (write-long (send _stamp :sec) s) (write-long (send _stamp :nsec) s)
     ;; sdpo_ros_interfaces_hw/mot_enc[] _mot_enc_array_data
     (write-long (length _mot_enc_array_data) s)
     (dolist (elem _mot_enc_array_data)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _stamp
     (send _stamp :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _stamp :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; sdpo_ros_interfaces_hw/mot_enc[] _mot_enc_array_data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _mot_enc_array_data (let (r) (dotimes (i n) (push (instance sdpo_ros_interfaces_hw::mot_enc :init) r)) r))
     (dolist (elem- _mot_enc_array_data)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get sdpo_ros_interfaces_hw::mot_enc_array :md5sum-) "fb57b8488f2393fd342c9aa24f555ed4")
(setf (get sdpo_ros_interfaces_hw::mot_enc_array :datatype-) "sdpo_ros_interfaces_hw/mot_enc_array")
(setf (get sdpo_ros_interfaces_hw::mot_enc_array :definition-)
      "time stamp
sdpo_ros_interfaces_hw/mot_enc[] mot_enc_array_data

================================================================================
MSG: sdpo_ros_interfaces_hw/mot_enc
int32 encoder_delta
float64 ticks_per_rev
float64 angular_speed

")



(provide :sdpo_ros_interfaces_hw/mot_enc_array "fb57b8488f2393fd342c9aa24f555ed4")


