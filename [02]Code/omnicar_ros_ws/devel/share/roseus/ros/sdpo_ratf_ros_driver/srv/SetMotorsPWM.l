;; Auto-generated. Do not edit!


(when (boundp 'sdpo_ratf_ros_driver::SetMotorsPWM)
  (if (not (find-package "SDPO_RATF_ROS_DRIVER"))
    (make-package "SDPO_RATF_ROS_DRIVER"))
  (shadow 'SetMotorsPWM (find-package "SDPO_RATF_ROS_DRIVER")))
(unless (find-package "SDPO_RATF_ROS_DRIVER::SETMOTORSPWM")
  (make-package "SDPO_RATF_ROS_DRIVER::SETMOTORSPWM"))
(unless (find-package "SDPO_RATF_ROS_DRIVER::SETMOTORSPWMREQUEST")
  (make-package "SDPO_RATF_ROS_DRIVER::SETMOTORSPWMREQUEST"))
(unless (find-package "SDPO_RATF_ROS_DRIVER::SETMOTORSPWMRESPONSE")
  (make-package "SDPO_RATF_ROS_DRIVER::SETMOTORSPWMRESPONSE"))

(in-package "ROS")





(defclass sdpo_ratf_ros_driver::SetMotorsPWMRequest
  :super ros::object
  :slots (_motors_pwm ))

(defmethod sdpo_ratf_ros_driver::SetMotorsPWMRequest
  (:init
   (&key
    ((:motors_pwm __motors_pwm) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _motors_pwm __motors_pwm)
   self)
  (:motors_pwm
   (&optional __motors_pwm)
   (if __motors_pwm (setq _motors_pwm __motors_pwm)) _motors_pwm)
  (:serialization-length
   ()
   (+
    ;; int16[] _motors_pwm
    (* 2    (length _motors_pwm)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16[] _motors_pwm
     (write-long (length _motors_pwm) s)
     (dotimes (i (length _motors_pwm))
       (write-word (elt _motors_pwm i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16[] _motors_pwm
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _motors_pwm (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _motors_pwm i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;;
   self)
  )

(defclass sdpo_ratf_ros_driver::SetMotorsPWMResponse
  :super ros::object
  :slots ())

(defmethod sdpo_ratf_ros_driver::SetMotorsPWMResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass sdpo_ratf_ros_driver::SetMotorsPWM
  :super ros::object
  :slots ())

(setf (get sdpo_ratf_ros_driver::SetMotorsPWM :md5sum-) "8d849fa8efc3b3d6d4674548331cb1a6")
(setf (get sdpo_ratf_ros_driver::SetMotorsPWM :datatype-) "sdpo_ratf_ros_driver/SetMotorsPWM")
(setf (get sdpo_ratf_ros_driver::SetMotorsPWM :request) sdpo_ratf_ros_driver::SetMotorsPWMRequest)
(setf (get sdpo_ratf_ros_driver::SetMotorsPWM :response) sdpo_ratf_ros_driver::SetMotorsPWMResponse)

(defmethod sdpo_ratf_ros_driver::SetMotorsPWMRequest
  (:response () (instance sdpo_ratf_ros_driver::SetMotorsPWMResponse :init)))

(setf (get sdpo_ratf_ros_driver::SetMotorsPWMRequest :md5sum-) "8d849fa8efc3b3d6d4674548331cb1a6")
(setf (get sdpo_ratf_ros_driver::SetMotorsPWMRequest :datatype-) "sdpo_ratf_ros_driver/SetMotorsPWMRequest")
(setf (get sdpo_ratf_ros_driver::SetMotorsPWMRequest :definition-)
      "int16[] motors_pwm
---

")

(setf (get sdpo_ratf_ros_driver::SetMotorsPWMResponse :md5sum-) "8d849fa8efc3b3d6d4674548331cb1a6")
(setf (get sdpo_ratf_ros_driver::SetMotorsPWMResponse :datatype-) "sdpo_ratf_ros_driver/SetMotorsPWMResponse")
(setf (get sdpo_ratf_ros_driver::SetMotorsPWMResponse :definition-)
      "int16[] motors_pwm
---

")



(provide :sdpo_ratf_ros_driver/SetMotorsPWM "8d849fa8efc3b3d6d4674548331cb1a6")


