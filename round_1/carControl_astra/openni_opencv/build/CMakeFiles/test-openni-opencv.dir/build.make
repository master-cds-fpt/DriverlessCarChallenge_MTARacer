# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.4

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/dev/openni_opencv/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/dev/openni_opencv/build

# Include any dependencies generated for this target.
include CMakeFiles/test-openni-opencv.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/test-openni-opencv.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test-openni-opencv.dir/flags.make

CMakeFiles/test-openni-opencv.dir/main.cpp.o: CMakeFiles/test-openni-opencv.dir/flags.make
CMakeFiles/test-openni-opencv.dir/main.cpp.o: /home/ubuntu/dev/openni_opencv/src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/dev/openni_opencv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/test-openni-opencv.dir/main.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test-openni-opencv.dir/main.cpp.o -c /home/ubuntu/dev/openni_opencv/src/main.cpp

CMakeFiles/test-openni-opencv.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test-openni-opencv.dir/main.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/dev/openni_opencv/src/main.cpp > CMakeFiles/test-openni-opencv.dir/main.cpp.i

CMakeFiles/test-openni-opencv.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test-openni-opencv.dir/main.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/dev/openni_opencv/src/main.cpp -o CMakeFiles/test-openni-opencv.dir/main.cpp.s

CMakeFiles/test-openni-opencv.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/test-openni-opencv.dir/main.cpp.o.requires

CMakeFiles/test-openni-opencv.dir/main.cpp.o.provides: CMakeFiles/test-openni-opencv.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/test-openni-opencv.dir/build.make CMakeFiles/test-openni-opencv.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/test-openni-opencv.dir/main.cpp.o.provides

CMakeFiles/test-openni-opencv.dir/main.cpp.o.provides.build: CMakeFiles/test-openni-opencv.dir/main.cpp.o


# Object files for target test-openni-opencv
test__openni__opencv_OBJECTS = \
"CMakeFiles/test-openni-opencv.dir/main.cpp.o"

# External object files for target test-openni-opencv
test__openni__opencv_EXTERNAL_OBJECTS =

test-openni-opencv: CMakeFiles/test-openni-opencv.dir/main.cpp.o
test-openni-opencv: CMakeFiles/test-openni-opencv.dir/build.make
test-openni-opencv: /usr/local/lib/libopencv_videostab.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_superres.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_stitching.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_shape.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_photo.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_cudastereo.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_cudaoptflow.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_cudaobjdetect.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_cudalegacy.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_cudaimgproc.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_cudafeatures2d.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_cudacodec.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_cudabgsegm.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_calib3d.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_cudawarping.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_objdetect.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_cudafilters.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_cudaarithm.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_features2d.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_ml.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_highgui.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_videoio.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_imgcodecs.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_flann.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_video.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_imgproc.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_core.so.3.1.0
test-openni-opencv: /usr/local/lib/libopencv_cudev.so.3.1.0
test-openni-opencv: CMakeFiles/test-openni-opencv.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/dev/openni_opencv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable test-openni-opencv"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test-openni-opencv.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test-openni-opencv.dir/build: test-openni-opencv

.PHONY : CMakeFiles/test-openni-opencv.dir/build

CMakeFiles/test-openni-opencv.dir/requires: CMakeFiles/test-openni-opencv.dir/main.cpp.o.requires

.PHONY : CMakeFiles/test-openni-opencv.dir/requires

CMakeFiles/test-openni-opencv.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test-openni-opencv.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test-openni-opencv.dir/clean

CMakeFiles/test-openni-opencv.dir/depend:
	cd /home/ubuntu/dev/openni_opencv/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/dev/openni_opencv/src /home/ubuntu/dev/openni_opencv/src /home/ubuntu/dev/openni_opencv/build /home/ubuntu/dev/openni_opencv/build /home/ubuntu/dev/openni_opencv/build/CMakeFiles/test-openni-opencv.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test-openni-opencv.dir/depend
