; Auto-generated. Do not edit!


(cl:in-package sdpo_ros_interfaces_hw-msg)


;//! \htmlinclude mot_enc_array.msg.html

(cl:defclass <mot_enc_array> (roslisp-msg-protocol:ros-message)
  ((stamp
    :reader stamp
    :initarg :stamp
    :type cl:real
    :initform 0)
   (mot_enc_array_data
    :reader mot_enc_array_data
    :initarg :mot_enc_array_data
    :type (cl:vector sdpo_ros_interfaces_hw-msg:mot_enc)
   :initform (cl:make-array 0 :element-type 'sdpo_ros_interfaces_hw-msg:mot_enc :initial-element (cl:make-instance 'sdpo_ros_interfaces_hw-msg:mot_enc))))
)

(cl:defclass mot_enc_array (<mot_enc_array>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mot_enc_array>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mot_enc_array)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sdpo_ros_interfaces_hw-msg:<mot_enc_array> is deprecated: use sdpo_ros_interfaces_hw-msg:mot_enc_array instead.")))

(cl:ensure-generic-function 'stamp-val :lambda-list '(m))
(cl:defmethod stamp-val ((m <mot_enc_array>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sdpo_ros_interfaces_hw-msg:stamp-val is deprecated.  Use sdpo_ros_interfaces_hw-msg:stamp instead.")
  (stamp m))

(cl:ensure-generic-function 'mot_enc_array_data-val :lambda-list '(m))
(cl:defmethod mot_enc_array_data-val ((m <mot_enc_array>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sdpo_ros_interfaces_hw-msg:mot_enc_array_data-val is deprecated.  Use sdpo_ros_interfaces_hw-msg:mot_enc_array_data instead.")
  (mot_enc_array_data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mot_enc_array>) ostream)
  "Serializes a message object of type '<mot_enc_array>"
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
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'mot_enc_array_data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'mot_enc_array_data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mot_enc_array>) istream)
  "Deserializes a message object of type '<mot_enc_array>"
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
  (cl:setf (cl:slot-value msg 'mot_enc_array_data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'mot_enc_array_data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sdpo_ros_interfaces_hw-msg:mot_enc))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mot_enc_array>)))
  "Returns string type for a message object of type '<mot_enc_array>"
  "sdpo_ros_interfaces_hw/mot_enc_array")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mot_enc_array)))
  "Returns string type for a message object of type 'mot_enc_array"
  "sdpo_ros_interfaces_hw/mot_enc_array")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mot_enc_array>)))
  "Returns md5sum for a message object of type '<mot_enc_array>"
  "fb57b8488f2393fd342c9aa24f555ed4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mot_enc_array)))
  "Returns md5sum for a message object of type 'mot_enc_array"
  "fb57b8488f2393fd342c9aa24f555ed4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mot_enc_array>)))
  "Returns full string definition for message of type '<mot_enc_array>"
  (cl:format cl:nil "time stamp~%sdpo_ros_interfaces_hw/mot_enc[] mot_enc_array_data~%~%================================================================================~%MSG: sdpo_ros_interfaces_hw/mot_enc~%int32 encoder_delta~%float64 ticks_per_rev~%float64 angular_speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mot_enc_array)))
  "Returns full string definition for message of type 'mot_enc_array"
  (cl:format cl:nil "time stamp~%sdpo_ros_interfaces_hw/mot_enc[] mot_enc_array_data~%~%================================================================================~%MSG: sdpo_ros_interfaces_hw/mot_enc~%int32 encoder_delta~%float64 ticks_per_rev~%float64 angular_speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mot_enc_array>))
  (cl:+ 0
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'mot_enc_array_data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mot_enc_array>))
  "Converts a ROS message object to a list"
  (cl:list 'mot_enc_array
    (cl:cons ':stamp (stamp msg))
    (cl:cons ':mot_enc_array_data (mot_enc_array_data msg))
))
