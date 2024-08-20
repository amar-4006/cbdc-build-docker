#!/bin/bash

# Function to print error messages and exit
function error_exit {
    echo "Error: $1" >&2
    exit 1
}

# Clone the repository with submodules
echo "Cloning the OpenCBDC repository..."
git clone --recurse-submodules https://github.com/mit-dci/opencbdc-tx || error_exit "Failed to clone repository."

# Navigate to the cloned directory
cd opencbdc-tx || error_exit "Failed to change directory to opencbdc-tx."

# Install build tools
echo "Installing build tools..."
sudo ./scripts/install-build-tools.sh || error_exit "Failed to install build tools."

# Install necessary clang modules
echo "Installing additional clang modules..."
sudo apt-get install -y clang libclang-14-dev libc++-14-dev libc++abi-14-dev libclang-rt-14-dev || error_exit "Failed to install clang modules."


# Set up project dependencies
#echo "Setting up project dependencies..."
#cd ~/work/opencbdc-tx ; ./scripts/setup_dependencies.sh || error_exit "Failed to set up dependencies."

# Build the project
#echo "Building the project..."
#./scripts/build.sh || error_exit "Failed to build the project."

echo "Setup completed successfully. please run next command now \n ./scripts/setup_dependencies.sh"
