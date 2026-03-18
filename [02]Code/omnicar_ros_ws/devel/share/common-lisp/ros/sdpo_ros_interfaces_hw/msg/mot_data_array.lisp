; Auto-generated. Do not edit!


(cl:in-package sdpo_ros_interfaces_hw-msg)


;//! \htmlinclude mot_data_array.msg.html

(cl:defclass <mot_data_array> (roslisp-msg-protocol:ros-message)
  ((stamp
    :reader stamp
    :initarg :stamp
    :type cl:real
    :initform 0)
   (mot_data_array
    :reader mot_data_array
    :initarg :mot_data_array
    :type (cl:vector sdpo_ros_interfaces_hw-msg:mot_data)
   :initform (cl:make-array 0 :element-type 'sdpo_ros_interfaces_hw-msg:mot_data :initial-element (cl:make-instance 'sdpo_ros_interfaces_hw-msg:mot_data))))
)

(cl:defclass mot_data_array (<mot_data_array>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mot_data_array>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mot_data_array)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sdpo_ros_interfaces_hw-msg:<mot_data_array> is deprecated: use sdpo_ros_interfaces_hw-msg:mot_data_array instead.")))

(cl:ensure-generic-function 'stamp-val :lambda-list '(m))
(cl:defmethod stamp-val ((m <mot_data_array>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sdpo_ros_interfaces_hw-msg:stamp-val is deprecated.  Use sdpo_ros_interfaces_hw-msg:stamp instead.")
  (stamp m))

(cl:ensure-generic-function 'mot_data_array-val :lambda-list '(m))
(cl:defmethod mot_data_array-val ((m <mot_data_array>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sdpo_ros_interfaces_hw-msg:mot_data_array-val is deprecated.  Use sdpo_ros_interfaces_hw-msg:mot_data_array instead.")
  (mot_data_array m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mot_data_array>) ostream)
  "Serializes a message object of type '<mot_data_array>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'stamp)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'stamp) (cl:floor (cl:slot-value msg 'stamp)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'mot_data_array))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'mot_data_array))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mot_data_array>) istream)
  "Deserializes a message object of type '<mot_data_array>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'stamp) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'mot_data_array) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'mot_data_array)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sdpo_ros_interfaces_hw-msg:mot_data))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mot_data_array>)))
  "Returns string type for a message object of type '<mot_data_array>"
  "sdpo_ros_interfaces_hw/mot_data_array")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mot_data_array)))
  "Returns string type for a message object of type 'mot_data_array"
  "sdpo_ros_interfaces_hw/mot_data_array")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mot_data_array>)))
  "Returns md5sum for a message object of type '<mot_data_array>"
  "1604e6f90e8e645db25b755372826780")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mot_data_array)))
  "Returns md5sum for a message object of type 'mot_data_array"
  "1604e6f90e8e645db25b755372826780")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mot_data_array>)))
  "Returns full string definition for message of type '<mot_data_array>"
  (cl:format cl:nil "time stamp~%sdpo_ros_interfaces_hw/mot_data[] mot_data_array~%~%================================================================================~%MSG: sdpo_ros_interfaces_hw/mot_data~%float64 sample_period~%int16 pwm~%int32 encoder_delta~%float64 ticks_per_rev~%float64 angular_speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mot_data_array)))
  "Returns full string definition for message of type 'mot_data_array"
  (cl:format cl:nil "time stamp~%sdpo_ros_interfaces_hw/mot_data[] mot_data_array~%~%================================================================================~%MSG: sdpo_ros_interfaces_hw/mot_data~%float64 sample_period~%int16 pwm~%int32 encoder_delta~%float64 ticks_per_rev~%float64 angular_speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mot_data_array>))
  (cl:+ 0
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'mot_data_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mot_data_array>))
  "Converts a ROS message object to a list"
  (cl:list 'mot_data_array
    (cl:cons ':stamp (stamp msg))
    (cl:cons ':mot_data_array (mot_data_array msg))
))
