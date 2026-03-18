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

class mot_data {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sample_period = null;
      this.pwm = null;
      this.encoder_delta = null;
      this.ticks_per_rev = null;
      this.angular_speed = null;
    }
    else {
      if (initObj.hasOwnProperty('sample_period')) {
        this.sample_period = initObj.sample_period
      }
      else {
        this.sample_period = 0.0;
      }
      if (initObj.hasOwnProperty('pwm')) {
        this.pwm = initObj.pwm
      }
      else {
        this.pwm = 0;
      }
      if (initObj.hasOwnProperty('encoder_delta')) {
        this.encoder_delta = initObj.encoder_delta
      }
      else {
        this.encoder_delta = 0;
      }
      if (initObj.hasOwnProperty('ticks_per_rev')) {
        this.ticks_per_rev = initObj.ticks_per_rev
      }
      else {
        this.ticks_per_rev = 0.0;
      }
      if (initObj.hasOwnProperty('angular_speed')) {
        this.angular_speed = initObj.angular_speed
      }
      else {
        this.angular_speed = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type mot_data
    // Serialize message field [sample_period]
    bufferOffset = _serializer.float64(obj.sample_period, buffer, bufferOffset);
    // Serialize message field [pwm]
    bufferOffset = _serializer.int16(obj.pwm, buffer, bufferOffset);
    // Serialize message field [encoder_delta]
    bufferOffset = _serializer.int32(obj.encoder_delta, buffer, bufferOffset);
    // Serialize message field [ticks_per_rev]
    bufferOffset = _serializer.float64(obj.ticks_per_rev, buffer, bufferOffset);
    // Serialize message field [angular_speed]
    bufferOffset = _serializer.float64(obj.angular_speed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type mot_data
    let len;
    let data = new mot_data(null);
    // Deserialize message field [sample_period]
    data.sample_period = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pwm]
    data.pwm = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [encoder_delta]
    data.encoder_delta = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [ticks_per_rev]
    data.ticks_per_rev = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [angular_speed]
    data.angular_speed = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 30;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sdpo_ros_interfaces_hw/mot_data';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9296bbf0c26da88feecdfff17cec0da1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new mot_data(null);
    if (msg.sample_period !== undefined) {
      resolved.sample_period = msg.sample_period;
    }
    else {
      resolved.sample_period = 0.0
    }

    if (msg.pwm !== undefined) {
      resolved.pwm = msg.pwm;
    }
    else {
      resolved.pwm = 0
    }

    if (msg.encoder_delta !== undefined) {
      resolved.encoder_delta = msg.encoder_delta;
    }
    else {
      resolved.encoder_delta = 0
    }

    if (msg.ticks_per_rev !== undefined) {
      resolved.ticks_per_rev = msg.ticks_per_rev;
    }
    else {
      resolved.ticks_per_rev = 0.0
    }

    if (msg.angular_speed !== undefined) {
      resolved.angular_speed = msg.angular_speed;
    }
    else {
      resolved.angular_speed = 0.0
    }

    return resolved;
    }
};

module.exports = mot_data;
