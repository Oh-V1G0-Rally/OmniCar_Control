// Auto-generated. Do not edit!

// (in-package sdpo_ratf_ros_driver.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class SetMotorsPWMRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.motors_pwm = null;
    }
    else {
      if (initObj.hasOwnProperty('motors_pwm')) {
        this.motors_pwm = initObj.motors_pwm
      }
      else {
        this.motors_pwm = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetMotorsPWMRequest
    // Serialize message field [motors_pwm]
    bufferOffset = _arraySerializer.int16(obj.motors_pwm, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetMotorsPWMRequest
    let len;
    let data = new SetMotorsPWMRequest(null);
    // Deserialize message field [motors_pwm]
    data.motors_pwm = _arrayDeserializer.int16(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 2 * object.motors_pwm.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sdpo_ratf_ros_driver/SetMotorsPWMRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8d849fa8efc3b3d6d4674548331cb1a6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16[] motors_pwm
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetMotorsPWMRequest(null);
    if (msg.motors_pwm !== undefined) {
      resolved.motors_pwm = msg.motors_pwm;
    }
    else {
      resolved.motors_pwm = []
    }

    return resolved;
    }
};

class SetMotorsPWMResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetMotorsPWMResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetMotorsPWMResponse
    let len;
    let data = new SetMotorsPWMResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sdpo_ratf_ros_driver/SetMotorsPWMResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetMotorsPWMResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: SetMotorsPWMRequest,
  Response: SetMotorsPWMResponse,
  md5sum() { return '8d849fa8efc3b3d6d4674548331cb1a6'; },
  datatype() { return 'sdpo_ratf_ros_driver/SetMotorsPWM'; }
};
