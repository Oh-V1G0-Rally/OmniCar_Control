; Auto-generated. Do not edit!


(cl:in-package sdpo_ratf_ros_driver-srv)


;//! \htmlinclude SetMotorsPWM-request.msg.html

(cl:defclass <SetMotorsPWM-request> (roslisp-msg-protocol:ros-message)
  ((motors_pwm
    :reader motors_pwm
    :initarg :motors_pwm
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass SetMotorsPWM-request (<SetMotorsPWM-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetMotorsPWM-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetMotorsPWM-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sdpo_ratf_ros_driver-srv:<SetMotorsPWM-request> is deprecated: use sdpo_ratf_ros_driver-srv:SetMotorsPWM-request instead.")))

(cl:ensure-generic-function 'motors_pwm-val :lambda-list '(m))
(cl:defmethod motors_pwm-val ((m <SetMotorsPWM-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sdpo_ratf_ros_driver-srv:motors_pwm-val is deprecated.  Use sdpo_ratf_ros_driver-srv:motors_pwm instead.")
  (motors_pwm m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetMotorsPWM-request>) ostream)
  "Serializes a message object of type '<SetMotorsPWM-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'motors_pwm))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'motors_pwm))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetMotorsPWM-request>) istream)
  "Deserializes a message object of type '<SetMotorsPWM-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'motors_pwm) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'motors_pwm)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetMotorsPWM-request>)))
  "Returns string type for a service object of type '<SetMotorsPWM-request>"
  "sdpo_ratf_ros_driver/SetMotorsPWMRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetMotorsPWM-request)))
  "Returns string type for a service object of type 'SetMotorsPWM-request"
  "sdpo_ratf_ros_driver/SetMotorsPWMRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetMotorsPWM-request>)))
  "Returns md5sum for a message object of type '<SetMotorsPWM-request>"
  "8d849fa8efc3b3d6d4674548331cb1a6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetMotorsPWM-request)))
  "Returns md5sum for a message object of type 'SetMotorsPWM-request"
  "8d849fa8efc3b3d6d4674548331cb1a6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetMotorsPWM-request>)))
  "Returns full string definition for message of type '<SetMotorsPWM-request>"
  (cl:format cl:nil "int16[] motors_pwm~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetMotorsPWM-request)))
  "Returns full string definition for message of type 'SetMotorsPWM-request"
  (cl:format cl:nil "int16[] motors_pwm~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetMotorsPWM-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'motors_pwm) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetMotorsPWM-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetMotorsPWM-request
    (cl:cons ':motors_pwm (motors_pwm msg))
))
;//! \htmlinclude SetMotorsPWM-response.msg.html

(cl:defclass <SetMotorsPWM-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetMotorsPWM-response (<SetMotorsPWM-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetMotorsPWM-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetMotorsPWM-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sdpo_ratf_ros_driver-srv:<SetMotorsPWM-response> is deprecated: use sdpo_ratf_ros_driver-srv:SetMotorsPWM-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetMotorsPWM-response>) ostream)
  "Serializes a message object of type '<SetMotorsPWM-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetMotorsPWM-response>) istream)
  "Deserializes a message object of type '<SetMotorsPWM-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetMotorsPWM-response>)))
  "Returns string type for a service object of type '<SetMotorsPWM-response>"
  "sdpo_ratf_ros_driver/SetMotorsPWMResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetMotorsPWM-response)))
  "Returns string type for a service object of type 'SetMotorsPWM-response"
  "sdpo_ratf_ros_driver/SetMotorsPWMResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetMotorsPWM-response>)))
  "Returns md5sum for a message object of type '<SetMotorsPWM-response>"
  "8d849fa8efc3b3d6d4674548331cb1a6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetMotorsPWM-response)))
  "Returns md5sum for a message object of type 'SetMotorsPWM-response"
  "8d849fa8efc3b3d6d4674548331cb1a6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetMotorsPWM-response>)))
  "Returns full string definition for message of type '<SetMotorsPWM-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetMotorsPWM-response)))
  "Returns full string definition for message of type 'SetMotorsPWM-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetMotorsPWM-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetMotorsPWM-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetMotorsPWM-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetMotorsPWM)))
  'SetMotorsPWM-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetMotorsPWM)))
  'SetMotorsPWM-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetMotorsPWM)))
  "Returns string type for a service object of type '<SetMotorsPWM>"
  "sdpo_ratf_ros_driver/SetMotorsPWM")