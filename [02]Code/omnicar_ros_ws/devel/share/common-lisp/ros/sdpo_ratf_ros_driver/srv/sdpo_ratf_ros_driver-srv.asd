
(cl:in-package :asdf)

(defsystem "sdpo_ratf_ros_driver-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "SetMotorsPWM" :depends-on ("_package_SetMotorsPWM"))
    (:file "_package_SetMotorsPWM" :depends-on ("_package"))
  ))