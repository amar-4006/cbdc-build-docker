# CBDC Build Docker

This repository provides a streamlined process for developers to pull and run a Docker image for building and working with the CBDC project. Follow the steps below to get started.

## Prerequisites

- Ensure you have Docker installed on your system.
- Create a free account on [Docker Hub](https://hub.docker.com/).

## Steps to Pull and Run the Docker Image

1. **Clone the Repository**

   Clone this repository to your local machine:

   ```bash
   git clone git@github.com:amar-4006/cbdc-build-docker.git
   ```
2. **Log in to Docker**

   ```bash
   docker login
   ```
4. **Navigate to the Repository Directory**

   ```bash
   cd cbdc-build-docker
   ```
6. **Run the Docker Script**

   ```bash
   ./run_docker.sh path/to/<mount-dir> --name <custom-docker-name>
   ```
8. **Verify Successful Setup**

   ```bash
   work$
   ```
10. **Clone the OpenCBDC-Tx Repository**

    ```bash
    git clone --recurse-submodules https://github.com/mit-dci/opencbdc-tx
    ```
12. **Navigate to the OpenCBDC-Tx Directory**

    ```bash
    cd opencbdc-tx
    ```
14. **Set Up Dependencies**

    ```bash
    ./scripts/setup_dependencies.sh
    ```
16. **Build the Project**

    ```bash
    ./scripts/build.sh
    ```
## Troubleshooting
In case of any issues, please contact me for assistance. By following these steps, you should be able to successfully pull and run the Docker image, set up dependencies, and build the project. If you encounter any problems, feel free to reach out for support
