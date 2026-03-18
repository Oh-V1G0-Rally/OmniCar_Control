;; Auto-generated. Do not edit!


(when (boundp 'sdpo_ros_interfaces_hw::mot_enc)
  (if (not (find-package "SDPO_ROS_INTERFACES_HW"))
    (make-package "SDPO_ROS_INTERFACES_HW"))
  (shadow 'mot_enc (find-package "SDPO_ROS_INTERFACES_HW")))
(unless (find-package "SDPO_ROS_INTERFACES_HW::MOT_ENC")
  (make-package "SDPO_ROS_INTERFACES_HW::MOT_ENC"))

(in-package "ROS")
;;//! \htmlinclude mot_enc.msg.html


(defclass sdpo_ros_interfaces_hw::mot_enc
  :super ros::object
  :slots (_encoder_delta _ticks_per_rev _angular_speed ))

(defmethod sdpo_ros_interfaces_hw::mot_enc
  (:init
   (&key
    ((:encoder_delta __encoder_delta) 0)
    ((:ticks_per_rev __ticks_per_rev) 0.0)
    ((:angular_speed __angular_speed) 0.0)
    )
   (send-super :init)
   (setq _encoder_delta (round __encoder_delta))
   (setq _ticks_per_rev (float __ticks_per_rev))
   (setq _angular_speed (float __angular_speed))
   self)
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
   ;; int32 _encoder_delta
     (setq _encoder_delta (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _ticks_per_rev
     (setq _ticks_per_rev (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angular_speed
     (setq _angular_speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get sdpo_ros_interfaces_hw::mot_enc :md5sum-) "97ac43cb6fb03e89b82c670503f65f5d")
(setf (get sdpo_ros_interfaces_hw::mot_enc :datatype-) "sdpo_ros_interfaces_hw/mot_enc")
(setf (get sdpo_ros_interfaces_hw::mot_enc :definition-)
      "int32 encoder_delta
float64 ticks_per_rev
float64 angular_speed

")



(provide :sdpo_ros_interfaces_hw/mot_enc "97ac43cb6fb03e89b82c670503f65f5d")


