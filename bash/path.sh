# Sets the PATH

# CUDA PATH Export
if [ -z "$__DOTFILES__/.installed/cuda" ]; then
    export PATH="$PATH:/usr/local/cuda/bin"
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/nvidia-current-updates:/usr/local/cuda/lib64:/usr/local/cuda/lib"
fi

# ROS exports (osx)
if [ -z "$__DOTFILES__/.installed/ros" ]; then
    export CPATH=/opt/local/include
    export LIBRARY_PATH=/opt/local/lib
    export ROS_OS_OVERRIDE=osx:macports
    source /opt/ros/groovy/setup.bash
fi

# Mac Ports includes
if [ -z "$__DOTFILES__/.installed/ros" ]; then
    export PATH="$PATH:/opt/local/include"
fi

# set JAVA_HOME
if [ -z "$__DOTFILES__/.installed/java" ]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
fi

# For Android SDK and NDK
if [ -z "$__DOTFILES__/.installed/android" ]; then
    export PATH="$PATH:/AndroidSDK/tools"
    export PATH="$PATH:/AndroidSDK/platform-tools"
    if [ -z "$__DOTFILES__/.installed/android.ndk" ]; then
        export PATH="$PATH:/NDK"
    fi
fi

# Language fix, since OSX seems to mess it up
if [ $OSX ]; then
    export LANGUAGE=en_US.UTF-8
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
fi