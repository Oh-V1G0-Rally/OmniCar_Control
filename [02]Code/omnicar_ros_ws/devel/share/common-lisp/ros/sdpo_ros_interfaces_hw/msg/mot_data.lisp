; Auto-generated. Do not edit!


(cl:in-package sdpo_ros_interfaces_hw-msg)


;//! \htmlinclude mot_data.msg.html

(cl:defclass <mot_data> (roslisp-msg-protocol:ros-message)
  ((sample_period
    :reader sample_period
    :initarg :sample_period
    :type cl:float
    :initform 0.0)
   (pwm
    :reader pwm
    :initarg :pwm
    :type cl:fixnum
    :initform 0)
   (encoder_delta
    :reader encoder_delta
    :initarg :encoder_delta
    :type cl:integer
    :initform 0)
   (ticks_per_rev
    :reader ticks_per_rev
    :initarg :ticks_per_rev
    :type cl:float
    :initform 0.0)
   (angular_speed
    :reader angular_speed
    :initarg :angular_speed
    :type cl:float
    :initform 0.0))
)

(cl:defclass mot_data (<mot_data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mot_data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mot_data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sdpo_ros_interfaces_hw-msg:<mot_data> is deprecated: use sdpo_ros_interfaces_hw-msg:mot_data instead.")))

(cl:ensure-generic-function 'sample_period-val :lambda-list '(m))
(cl:defmethod sample_period-val ((m <mot_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sdpo_ros_interfaces_hw-msg:sample_period-val is deprecated.  Use sdpo_ros_interfaces_hw-msg:sample_period instead.")
  (sample_period m))

(cl:ensure-generic-function 'pwm-val :lambda-list '(m))
(cl:defmethod pwm-val ((m <mot_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sdpo_ros_interfaces_hw-msg:pwm-val is deprecated.  Use sdpo_ros_interfaces_hw-msg:pwm instead.")
  (pwm m))

(cl:ensure-generic-function 'encoder_delta-val :lambda-list '(m))
(cl:defmethod encoder_delta-val ((m <mot_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sdpo_ros_interfaces_hw-msg:encoder_delta-val is deprecated.  Use sdpo_ros_interfaces_hw-msg:encoder_delta instead.")
  (encoder_delta m))

(cl:ensure-generic-function 'ticks_per_rev-val :lambda-list '(m))
(cl:defmethod ticks_per_rev-val ((m <mot_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sdpo_ros_interfaces_hw-msg:ticks_per_rev-val is deprecated.  Use sdpo_ros_interfaces_hw-msg:ticks_per_rev instead.")
  (ticks_per_rev m))

(cl:ensure-generic-function 'angular_speed-val :lambda-list '(m))
(cl:defmethod angular_speed-val ((m <mot_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sdpo_ros_interfaces_hw-msg:angular_speed-val is deprecated.  Use sdpo_ros_interfaces_hw-msg:angular_speed instead.")
  (angular_speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mot_data>) ostream)
  "Serializes a message object of type '<mot_data>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'sample_period))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'pwm)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'encoder_delta)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'ticks_per_rev))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angular_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mot_data>) istream)
  "Deserializes a message object of type '<mot_data>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sample_period) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pwm) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'encoder_delta) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ticks_per_rev) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angular_speed) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mot_data>)))
  "Returns string type for a message object of type '<mot_data>"
  "sdpo_ros_interfaces_hw/mot_data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mot_data)))
  "Returns string type for a message object of type 'mot_data"
  "sdpo_ros_interfaces_hw/mot_data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mot_data>)))
  "Returns md5sum for a message object of type '<mot_data>"
  "9296bbf0c26da88feecdfff17cec0da1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mot_data)))
  "Returns md5sum for a message object of type 'mot_data"
  "9296bbf0c26da88feecdfff17cec0da1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mot_data>)))
  "Returns full string definition for message of type '<mot_data>"
  (cl:format cl:nil "float64 sample_period~%int16 pwm~%int32 encoder_delta~%float64 ticks_per_rev~%float64 angular_speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mot_data)))
  "Returns full string definition for message of type 'mot_data"
  (cl:format cl:nil "float64 sample_period~%int16 pwm~%int32 encoder_delta~%float64 ticks_per_rev~%float64 angular_speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mot_data>))
  (cl:+ 0
     8
     2
     4
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mot_data>))
  "Converts a ROS message object to a list"
  (cl:list 'mot_data
    (cl:cons ':sample_period (sample_period msg))
    (cl:cons ':pwm (pwm msg))
    (cl:cons ':encoder_delta (encoder_delta msg))
    (cl:cons ':ticks_per_rev (ticks_per_rev msg))
    (cl:cons ':angular_speed (angular_speed msg))
))
