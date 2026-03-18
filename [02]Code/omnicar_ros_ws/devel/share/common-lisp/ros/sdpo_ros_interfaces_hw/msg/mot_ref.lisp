; Auto-generated. Do not edit!


(cl:in-package sdpo_ros_interfaces_hw-msg)


;//! \htmlinclude mot_ref.msg.html

(cl:defclass <mot_ref> (roslisp-msg-protocol:ros-message)
  ((angular_speed_ref
    :reader angular_speed_ref
    :initarg :angular_speed_ref
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass mot_ref (<mot_ref>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mot_ref>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mot_ref)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sdpo_ros_interfaces_hw-msg:<mot_ref> is deprecated: use sdpo_ros_interfaces_hw-msg:mot_ref instead.")))

(cl:ensure-generic-function 'angular_speed_ref-val :lambda-list '(m))
(cl:defmethod angular_speed_ref-val ((m <mot_ref>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sdpo_ros_interfaces_hw-msg:angular_speed_ref-val is deprecated.  Use sdpo_ros_interfaces_hw-msg:angular_speed_ref instead.")
  (angular_speed_ref m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mot_ref>) ostream)
  "Serializes a message object of type '<mot_ref>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'angular_speed_ref))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'angular_speed_ref))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mot_ref>) istream)
  "Deserializes a message object of type '<mot_ref>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'angular_speed_ref) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'angular_speed_ref)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mot_ref>)))
  "Returns string type for a message object of type '<mot_ref>"
  "sdpo_ros_interfaces_hw/mot_ref")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mot_ref)))
  "Returns string type for a message object of type 'mot_ref"
  "sdpo_ros_interfaces_hw/mot_ref")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mot_ref>)))
  "Returns md5sum for a message object of type '<mot_ref>"
  "f7b52b672703e430e773f7297473d891")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mot_ref)))
  "Returns md5sum for a message object of type 'mot_ref"
  "f7b52b672703e430e773f7297473d891")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mot_ref>)))
  "Returns full string definition for message of type '<mot_ref>"
  (cl:format cl:nil "float64[] angular_speed_ref~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mot_ref)))
  "Returns full string definition for message of type 'mot_ref"
  (cl:format cl:nil "float64[] angular_speed_ref~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mot_ref>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'angular_speed_ref) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mot_ref>))
  "Converts a ROS message object to a list"
  (cl:list 'mot_ref
    (cl:cons ':angular_speed_ref (angular_speed_ref msg))
))
