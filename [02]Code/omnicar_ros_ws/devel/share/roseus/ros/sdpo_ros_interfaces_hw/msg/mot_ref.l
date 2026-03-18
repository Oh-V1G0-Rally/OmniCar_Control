;; Auto-generated. Do not edit!


(when (boundp 'sdpo_ros_interfaces_hw::mot_ref)
  (if (not (find-package "SDPO_ROS_INTERFACES_HW"))
    (make-package "SDPO_ROS_INTERFACES_HW"))
  (shadow 'mot_ref (find-package "SDPO_ROS_INTERFACES_HW")))
(unless (find-package "SDPO_ROS_INTERFACES_HW::MOT_REF")
  (make-package "SDPO_ROS_INTERFACES_HW::MOT_REF"))

(in-package "ROS")
;;//! \htmlinclude mot_ref.msg.html


(defclass sdpo_ros_interfaces_hw::mot_ref
  :super ros::object
  :slots (_angular_speed_ref ))

(defmethod sdpo_ros_interfaces_hw::mot_ref
  (:init
   (&key
    ((:angular_speed_ref __angular_speed_ref) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _angular_speed_ref __angular_speed_ref)
   self)
  (:angular_speed_ref
   (&optional __angular_speed_ref)
   (if __angular_speed_ref (setq _angular_speed_ref __angular_speed_ref)) _angular_speed_ref)
  (:serialization-length
   ()
   (+
    ;; float64[] _angular_speed_ref
    (* 8    (length _angular_speed_ref)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _angular_speed_ref
     (write-long (length _angular_speed_ref) s)
     (dotimes (i (length _angular_speed_ref))
       (sys::poke (elt _angular_speed_ref i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _angular_speed_ref
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _angular_speed_ref (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _angular_speed_ref i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get sdpo_ros_interfaces_hw::mot_ref :md5sum-) "f7b52b672703e430e773f7297473d891")
(setf (get sdpo_ros_interfaces_hw::mot_ref :datatype-) "sdpo_ros_interfaces_hw/mot_ref")
(setf (get sdpo_ros_interfaces_hw::mot_ref :definition-)
      "float64[] angular_speed_ref

")



(provide :sdpo_ros_interfaces_hw/mot_ref "f7b52b672703e430e773f7297473d891")


