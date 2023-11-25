# simple-calculator App

This project dockerizes a simple calculator web application built with Python and Flask. The app allows users to perform basic calculations through a web interface.

## Usage

### Prerequisites

Make sure you have Docker installed on your machine. If not, you can download it from [Docker's official website](https://www.docker.com/get-started).

### Build and Run with Docker

To build and run the Docker container locally, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/sanjukuruvilla/simple-calculator.git
   cd simple-calculator-app
   
2. Build the Docker image:

`docker build -t calculator-app .`

3. Run the Docker container:

`docker run -p 8080:80 calculator-app`

The calculator app will be accessible at `http://localhost:8080` in your web browser.

# Docker Compose

Alternatively, you can use Docker Compose for an easier setup:

1. Update the docker-compose.yml file with your desired image name and tag:

`version: "3.8"
services:
  web:
    image: leescoresby/cal:v1  # Set the desired image name and tag
    ports:
      - "8080:80"
    stdin_open: true
    tty: true`

2. Run the Docker Compose:

`docker-compose up`

The calculator app will be available at `http://localhost:8080` in your web browser.

## Notes:

- The Dockerfile sets up the Python 3.11-alpine image, installs Flask, and copies the necessary files.

- The calculator.py file contains the Flask application code, defining a route for the main page.

- The docker-compose.yml file provides an easy way to build and run the Docker container, including version control.

- The docker-compose.yml before pushing the docker image to docker hub / not pulling the image from dockerhub.

`version: "3.8"
services:
  web:
    build: . #builds the image by using the docker file
    #image: your-username/image-name:tag [optional]  # Set the desired image name and tag for the container; useful when pushing to Docker Hub
     #If you are using the image option, don't use the build option; conflicts may arise.
    ports:
      - "8080:80"
    stdin_open: true
    tty: true`

## Contributing

- Feel free to contribute to this project by opening issues or creating pull requests.
- Happy Coding...


