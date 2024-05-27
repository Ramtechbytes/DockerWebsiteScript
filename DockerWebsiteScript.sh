#!/bin/bash

# Function to check if Docker is installed
check_docker() {
  if ! command -v docker &> /dev/null; then
      echo "Docker is not installed. Please install Docker and try again."
      exit 1
  fi
}

# Function to prompt for user input
prompt_for_input() {
  read -p "Enter the application name (default: my-static-site): " APP_NAME
  APP_NAME=${APP_NAME:-my-static-site}

  read -p "Enter the port number (default: 8080): " PORT
  PORT=${PORT:-8090}
}

# Function to create website files and Dockerfile
create_files() {
  mkdir -p ${APP_NAME}
  cd ${APP_NAME}

  # Create a simple index.html file
  cat <<EOF > index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
        }
        .navbar {
            background-color: #0056b3;
            padding: 1em;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
        }
        .navbar a:hover {
            text-decoration: underline;
        }
        .container {
            text-align: center;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            max-width: 600px;
        }
        h1 {
            color: #0056b3;
        }
        p {
            font-size: 1.2em;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="logo">
            <a href="#">My Website</a>
        </div>
        <div class="nav-links">
            <a href="#">Home</a>
            <a href="#">About</a>
            <a href="#">Services</a>
            <a href="#">Contact</a>
        </div>
    </nav>
    <div class="container">
        <h1>Welcome to My Website</h1>
        <p>This is a simple welcome page served by Nginx in a Docker container.</p>
    </div>
</body>
</html>
EOF

  # Create a Dockerfile
  cat <<EOF > Dockerfile
# Use the official nginx image as a base
FROM nginx:alpine

# Copy the static website files to the nginx html directory
COPY index.html /usr/share/nginx/html
EOF
}

# Function to build and run the Docker container
build_and_run() {
  docker build -t ${APP_NAME} .
  docker run -d -p ${PORT}:80 ${APP_NAME}
  echo "Your static website is now available at http://localhost:${PORT}"
}

# Main script execution
check_docker
prompt_for_input
create_files

# Open index.html in nano for editing
nano index.html

# Build and run the Docker container after editing index.html
build_and_run

