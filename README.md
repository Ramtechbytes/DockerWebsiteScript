
This script sets up a Docker environment to host a static website using the Nginx web server. It includes the following steps:


![Static Docker Website Creation](https://github.com/Ramtechbytes/DockerWebsiteScript/assets/170969555/25c7a1b4-c15e-41da-b0b8-718d4dc3e946)


Create a Dockerfile:

1) The Dockerfile uses the official nginx:alpine image as the base image, ensuring a lightweight and efficient container.
Static website files are copied from the current directory to the Nginx HTML directory (/usr/share/nginx/html), making them accessible via the web server.
Create an HTML Welcome Page:

2) An index.html file is created, containing a simple and visually appealing welcome page.
The welcome page includes a navigation bar with links to different sections (Home, About, Services, Contact), styled with basic CSS for a clean and modern look.
Build and Run the Docker Container:

3) The Docker image is built using the Dockerfile, tagged as my-nginx-site.
The Docker container is run in detached mode, with port 8080 on the host mapped to port 80 in the container, allowing access to the website at http://localhost:8080.


