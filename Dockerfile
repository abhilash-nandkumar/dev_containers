ARG ROS_DISTRO=humble
FROM osrf/ros:${ROS_DISTRO}-desktop-full
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    curl \
    wget \
    gdb \
    clangd \
    clang-format \
	zsh \
    python3-colcon-common-extensions \
    ros-${ROS_DISTRO}-plotjuggler \
    ros-${ROS_DISTRO}-plotjuggler-ros \
    && rm -rf /var/lib/apt/lists/*

SHELL ["/bin/zsh","-c"]
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.zsh" >> /etc/bash.bashrc

ARG HOST_UID=1000
ARG HOST_GID=1000
ARG HOST_USER=dev

RUN groupadd -g ${HOST_GID} ${HOST_USER} && \
    useradd -m -u ${HOST_UID} -g ${HOST_GID} -s /bin/bash ${HOST_USER} && \
    usermod -aG sudo ${HOST_USER} && \
	echo "${HOST_USER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${HOST_USER}

USER ${HOST_USER}
WORKDIR /home/${HOST_USER}

CMD ["zsh"]
