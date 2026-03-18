// Auto-generated. Do not edit!

// (in-package sdpo_ros_interfaces_hw.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class mot_ref {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.angular_speed_ref = null;
    }
    else {
      if (initObj.hasOwnProperty('angular_speed_ref')) {
        this.angular_speed_ref = initObj.angular_speed_ref
      }
      else {
        this.angular_speed_ref = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type mot_ref
    // Serialize message field [angular_speed_ref]
    bufferOffset = _arraySerializer.float64(obj.angular_speed_ref, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type mot_ref
    let len;
    let data = new mot_ref(null);
    // Deserialize message field [angular_speed_ref]
    data.angular_speed_ref = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.angular_speed_ref.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sdpo_ros_interfaces_hw/mot_ref';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f7b52b672703e430e773f7297473d891';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] angular_speed_ref
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new mot_ref(null);
    if (msg.angular_speed_ref !== undefined) {
      resolved.angular_speed_ref = msg.angular_speed_ref;
    }
    else {
      resolved.angular_speed_ref = []
    }

    return resolved;
    }
};

module.exports = mot_ref;
