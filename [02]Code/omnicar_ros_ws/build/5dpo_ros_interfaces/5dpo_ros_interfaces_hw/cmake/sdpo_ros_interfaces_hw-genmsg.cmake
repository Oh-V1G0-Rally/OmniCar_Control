# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "sdpo_ros_interfaces_hw: 5 messages, 0 services")

set(MSG_I_FLAGS "-Isdpo_ros_interfaces_hw:/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(sdpo_ros_interfaces_hw_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data.msg" NAME_WE)
add_custom_target(_sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sdpo_ros_interfaces_hw" "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data.msg" ""
)

get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data_array.msg" NAME_WE)
add_custom_target(_sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sdpo_ros_interfaces_hw" "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data_array.msg" "sdpo_ros_interfaces_hw/mot_data"
)

get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc.msg" NAME_WE)
add_custom_target(_sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sdpo_ros_interfaces_hw" "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc.msg" ""
)

get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc_array.msg" NAME_WE)
add_custom_target(_sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sdpo_ros_interfaces_hw" "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc_array.msg" "sdpo_ros_interfaces_hw/mot_enc"
)

get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_ref.msg" NAME_WE)
add_custom_target(_sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sdpo_ros_interfaces_hw" "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_ref.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sdpo_ros_interfaces_hw
)
_generate_msg_cpp(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data_array.msg"
  "${MSG_I_FLAGS}"
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sdpo_ros_interfaces_hw
)
_generate_msg_cpp(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sdpo_ros_interfaces_hw
)
_generate_msg_cpp(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc_array.msg"
  "${MSG_I_FLAGS}"
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sdpo_ros_interfaces_hw
)
_generate_msg_cpp(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_ref.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sdpo_ros_interfaces_hw
)

### Generating Services

### Generating Module File
_generate_module_cpp(sdpo_ros_interfaces_hw
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sdpo_ros_interfaces_hw
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(sdpo_ros_interfaces_hw_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages sdpo_ros_interfaces_hw_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_cpp _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data_array.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_cpp _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_cpp _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc_array.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_cpp _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_ref.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_cpp _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sdpo_ros_interfaces_hw_gencpp)
add_dependencies(sdpo_ros_interfaces_hw_gencpp sdpo_ros_interfaces_hw_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sdpo_ros_interfaces_hw_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sdpo_ros_interfaces_hw
)
_generate_msg_eus(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data_array.msg"
  "${MSG_I_FLAGS}"
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sdpo_ros_interfaces_hw
)
_generate_msg_eus(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sdpo_ros_interfaces_hw
)
_generate_msg_eus(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc_array.msg"
  "${MSG_I_FLAGS}"
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sdpo_ros_interfaces_hw
)
_generate_msg_eus(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_ref.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sdpo_ros_interfaces_hw
)

### Generating Services

### Generating Module File
_generate_module_eus(sdpo_ros_interfaces_hw
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sdpo_ros_interfaces_hw
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(sdpo_ros_interfaces_hw_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages sdpo_ros_interfaces_hw_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_eus _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data_array.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_eus _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_eus _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc_array.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_eus _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_ref.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_eus _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sdpo_ros_interfaces_hw_geneus)
add_dependencies(sdpo_ros_interfaces_hw_geneus sdpo_ros_interfaces_hw_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sdpo_ros_interfaces_hw_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sdpo_ros_interfaces_hw
)
_generate_msg_lisp(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data_array.msg"
  "${MSG_I_FLAGS}"
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sdpo_ros_interfaces_hw
)
_generate_msg_lisp(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sdpo_ros_interfaces_hw
)
_generate_msg_lisp(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc_array.msg"
  "${MSG_I_FLAGS}"
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sdpo_ros_interfaces_hw
)
_generate_msg_lisp(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_ref.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sdpo_ros_interfaces_hw
)

### Generating Services

### Generating Module File
_generate_module_lisp(sdpo_ros_interfaces_hw
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sdpo_ros_interfaces_hw
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(sdpo_ros_interfaces_hw_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages sdpo_ros_interfaces_hw_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_lisp _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data_array.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_lisp _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_lisp _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc_array.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_lisp _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_ref.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_lisp _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sdpo_ros_interfaces_hw_genlisp)
add_dependencies(sdpo_ros_interfaces_hw_genlisp sdpo_ros_interfaces_hw_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sdpo_ros_interfaces_hw_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sdpo_ros_interfaces_hw
)
_generate_msg_nodejs(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data_array.msg"
  "${MSG_I_FLAGS}"
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sdpo_ros_interfaces_hw
)
_generate_msg_nodejs(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sdpo_ros_interfaces_hw
)
_generate_msg_nodejs(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc_array.msg"
  "${MSG_I_FLAGS}"
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sdpo_ros_interfaces_hw
)
_generate_msg_nodejs(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_ref.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sdpo_ros_interfaces_hw
)

### Generating Services

### Generating Module File
_generate_module_nodejs(sdpo_ros_interfaces_hw
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sdpo_ros_interfaces_hw
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(sdpo_ros_interfaces_hw_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages sdpo_ros_interfaces_hw_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_nodejs _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data_array.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_nodejs _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_nodejs _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc_array.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_nodejs _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_ref.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_nodejs _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sdpo_ros_interfaces_hw_gennodejs)
add_dependencies(sdpo_ros_interfaces_hw_gennodejs sdpo_ros_interfaces_hw_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sdpo_ros_interfaces_hw_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sdpo_ros_interfaces_hw
)
_generate_msg_py(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data_array.msg"
  "${MSG_I_FLAGS}"
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sdpo_ros_interfaces_hw
)
_generate_msg_py(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sdpo_ros_interfaces_hw
)
_generate_msg_py(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc_array.msg"
  "${MSG_I_FLAGS}"
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sdpo_ros_interfaces_hw
)
_generate_msg_py(sdpo_ros_interfaces_hw
  "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_ref.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sdpo_ros_interfaces_hw
)

### Generating Services

### Generating Module File
_generate_module_py(sdpo_ros_interfaces_hw
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sdpo_ros_interfaces_hw
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(sdpo_ros_interfaces_hw_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages sdpo_ros_interfaces_hw_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_py _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_data_array.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_py _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_py _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_enc_array.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_py _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sdpo-ratf/OmniCar_Control/[02]Code/omnicar_ros_ws/src/5dpo_ros_interfaces/5dpo_ros_interfaces_hw/msg/mot_ref.msg" NAME_WE)
add_dependencies(sdpo_ros_interfaces_hw_generate_messages_py _sdpo_ros_interfaces_hw_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sdpo_ros_interfaces_hw_genpy)
add_dependencies(sdpo_ros_interfaces_hw_genpy sdpo_ros_interfaces_hw_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sdpo_ros_interfaces_hw_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sdpo_ros_interfaces_hw)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sdpo_ros_interfaces_hw
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sdpo_ros_interfaces_hw)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sdpo_ros_interfaces_hw
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sdpo_ros_interfaces_hw)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sdpo_ros_interfaces_hw
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sdpo_ros_interfaces_hw)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sdpo_ros_interfaces_hw
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sdpo_ros_interfaces_hw)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sdpo_ros_interfaces_hw\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sdpo_ros_interfaces_hw
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
