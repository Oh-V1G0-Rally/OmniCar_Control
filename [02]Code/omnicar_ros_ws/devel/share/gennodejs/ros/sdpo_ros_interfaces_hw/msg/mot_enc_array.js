// Auto-generated. Do not edit!

// (in-package sdpo_ros_interfaces_hw.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let mot_enc = require('./mot_enc.js');

//-----------------------------------------------------------

class mot_enc_array {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.stamp = null;
      this.mot_enc_array_data = null;
    }
    else {
      if (initObj.hasOwnProperty('stamp')) {
        this.stamp = initObj.stamp
      }
      else {
        this.stamp = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('mot_enc_array_data')) {
        this.mot_enc_array_data = initObj.mot_enc_array_data
      }
      else {
        this.mot_enc_array_data = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type mot_enc_array
    // Serialize message field [stamp]
    bufferOffset = _serializer.time(obj.stamp, buffer, bufferOffset);
    // Serialize message field [mot_enc_array_data]
    // Serialize the length for message field [mot_enc_array_data]
    bufferOffset = _serializer.uint32(obj.mot_enc_array_data.length, buffer, bufferOffset);
    obj.mot_enc_array_data.forEach((val) => {
      bufferOffset = mot_enc.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type mot_enc_array
    let len;
    let data = new mot_enc_array(null);
    // Deserialize message field [stamp]
    data.stamp = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [mot_enc_array_data]
    // Deserialize array length for message field [mot_enc_array_data]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.mot_enc_array_data = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.mot_enc_array_data[i] = mot_enc.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 20 * object.mot_enc_array_data.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sdpo_ros_interfaces_hw/mot_enc_array';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fb57b8488f2393fd342c9aa24f555ed4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    time stamp
    sdpo_ros_interfaces_hw/mot_enc[] mot_enc_array_data
    
    ================================================================================
    MSG: sdpo_ros_interfaces_hw/mot_enc
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
    const resolved = new mot_enc_array(null);
    if (msg.stamp !== undefined) {
      resolved.stamp = msg.stamp;
    }
    else {
      resolved.stamp = {secs: 0, nsecs: 0}
    }

    if (msg.mot_enc_array_data !== undefined) {
      resolved.mot_enc_array_data = new Array(msg.mot_enc_array_data.length);
      for (let i = 0; i < resolved.mot_enc_array_data.length; ++i) {
        resolved.mot_enc_array_data[i] = mot_enc.Resolve(msg.mot_enc_array_data[i]);
      }
    }
    else {
      resolved.mot_enc_array_data = []
    }

    return resolved;
    }
};

module.exports = mot_enc_array;
