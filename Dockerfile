ARG ROS_DISTRO

FROM ros:${ROS_DISTRO}-ros-core

WORKDIR /colcon_ws/src

RUN apt update && apt install -y --no-install-recommends python3-rpi.gpio python3-pip python3-colcon-common-extensions && rm -rf /var/lib/apt/lists/*
RUN pip3 install adafruit-circuitpython-lis3dh

COPY accelerometer_publisher . 

WORKDIR /colcon_ws
RUN . /opt/ros/${ROS_DISTRO}/setup.sh && colcon build

WORKDIR /

COPY ros_entrypoint.sh .
