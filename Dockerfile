FROM ubuntu:22.04

# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive

# Install clang-14 and other necessary packages
RUN apt-get update && apt-get install -y \
    git \
    wget \
    curl \
    build-essential \
    vim \
    pkg-config \
    cmake \
    ninja-build \
    python3 \
    python3-pip \
    clang-14 \
    libclang-14-dev \
    libc++-14-dev \
    libc++abi-14-dev \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Set the default compiler to clang-14
ENV CC=clang-14
ENV CXX=clang++-14

# Create a non-root user
#RUN useradd -m -s /bin/bash dev && \
#    echo "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install gosu for easy step-down from root
RUN apt-get update && apt-get install -y gosu && rm -rf /var/lib/apt/lists/*

# Copy the entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Copy the Script
COPY setup_opencbdc.sh /usr/local/bin/setup_opencbdc.sh

# Make sure the script is executable
RUN sudo chmod a+x /usr/local/bin/setup_opencbdc.sh


# Set up environment variables
ENV PATH="/home/dev/.local/bin:${PATH}"

# Set entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]


# Set working directory
WORKDIR /home/dev/work


#RUN sudo chown dev:dev  /usr/local/bin/setup_opencbdc.sh

# Set entrypoint
CMD ["/bin/bash"]
