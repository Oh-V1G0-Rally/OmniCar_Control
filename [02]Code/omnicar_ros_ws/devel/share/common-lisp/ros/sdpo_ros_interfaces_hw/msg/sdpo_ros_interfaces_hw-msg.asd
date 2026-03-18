
(cl:in-package :asdf)

(defsystem "sdpo_ros_interfaces_hw-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "mot_data" :depends-on ("_package_mot_data"))
    (:file "_package_mot_data" :depends-on ("_package"))
    (:file "mot_data_array" :depends-on ("_package_mot_data_array"))
    (:file "_package_mot_data_array" :depends-on ("_package"))
    (:file "mot_enc" :depends-on ("_package_mot_enc"))
    (:file "_package_mot_enc" :depends-on ("_package"))
    (:file "mot_enc_array" :depends-on ("_package_mot_enc_array"))
    (:file "_package_mot_enc_array" :depends-on ("_package"))
    (:file "mot_ref" :depends-on ("_package_mot_ref"))
    (:file "_package_mot_ref" :depends-on ("_package"))
  ))