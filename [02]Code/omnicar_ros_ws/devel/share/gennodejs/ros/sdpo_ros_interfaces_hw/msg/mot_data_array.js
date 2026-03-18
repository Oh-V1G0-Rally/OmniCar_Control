// Auto-generated. Do not edit!

// (in-package sdpo_ros_interfaces_hw.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let mot_data = require('./mot_data.js');

//-----------------------------------------------------------

class mot_data_array {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.stamp = null;
      this.mot_data_array = null;
    }
    else {
      if (initObj.hasOwnProperty('stamp')) {
        this.stamp = initObj.stamp
      }
      else {
        this.stamp = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('mot_data_array')) {
        this.mot_data_array = initObj.mot_data_array
      }
      else {
        this.mot_data_array = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type mot_data_array
    // Serialize message field [stamp]
    bufferOffset = _serializer.time(obj.stamp, buffer, bufferOffset);
    // Serialize message field [mot_data_array]
    // Serialize the length for message field [mot_data_array]
    bufferOffset = _serializer.uint32(obj.mot_data_array.length, buffer, bufferOffset);
    obj.mot_data_array.forEach((val) => {
      bufferOffset = mot_data.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type mot_data_array
    let len;
    let data = new mot_data_array(null);
    // Deserialize message field [stamp]
    data.stamp = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [mot_data_array]
    // Deserialize array length for message field [mot_data_array]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.mot_data_array = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.mot_data_array[i] = mot_data.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 30 * object.mot_data_array.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sdpo_ros_interfaces_hw/mot_data_array';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1604e6f90e8e645db25b755372826780';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    time stamp
    sdpo_ros_interfaces_hw/mot_data[] mot_data_array
    
    ================================================================================
    MSG: sdpo_ros_interfaces_hw/mot_data
    float64 sample_period
    int16 pwm
    int32 encoder_delta
    float64 ticks_per_rev
    float64 angular_speed
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new mot_data_array(null);
    if (msg.stamp !== undefined) {
      resolved.stamp = msg.stamp;
    }
    else {
      resolved.stamp = {secs: 0, nsecs: 0}
    }

    if (msg.mot_data_array !== undefined) {
      resolved.mot_data_array = new Array(msg.mot_data_array.length);
      for (let i = 0; i < resolved.mot_data_array.length; ++i) {
        resolved.mot_data_array[i] = mot_data.Resolve(msg.mot_data_array[i]);
      }
    }
    else {
      resolved.mot_data_array = []
    }

    return resolved;
    }
};

module.exports = mot_data_array;
