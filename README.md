# Challenge

## Overview:
This repository contains a full-stack application comprised of two main components: an API and a Client. Both can be easily deployed using Docker and Docker Compose.
### Components:

- **API**: Built with PHP Laravel, providing robust backend functionality.
- **Client**: A Nuxt.js application that serves as the frontend interface.
- **Database**: Utilizes MySQL for data storage.
- **Reverse Proxy**: Nginx is employed as a reverse proxy to manage client-server communication.

--- 

## Prerequisites

Before you begin, ensure you have the following installed on your machine:

- **Docker**
- **Docker Compose**

## Architecture
![Architecture](https://raw.githubusercontent.com/AbdElRhmanArafa/Challenge/refs/heads/main/assets/Architecture.png)

## Getting Started

### Step 1: Clone the Repository

Clone the repository to your local machine using the following command:

```bash
git clone https://github.com/AbdElRhmanArafa/Challenge
```
--- 

### step 2: Run the Application using Docker Compose
```bash
cd Challenge
docker-compose up --build
```
> **Note:** --build for build a new images.

![Docker Compose](https://raw.githubusercontent.com/AbdElRhmanArafa/Challenge/refs/heads/main/assets/docker-compose.png)
---

### Step 3: Access the Application
you can access it by visiting the localhost in your browser:
- **API**: [http://localhost:80](http://localhost:80)
![API](https://raw.githubusercontent.com/AbdElRhmanArafa/Challenge/refs/heads/main/assets/web-page.png)

### Step 4: uplaod the docker images to the docker hub
```bash
docker login
docker tag <name of image >:latest <user name>/challenge_api:latest
docker push abdelrhmanarafa/challenge_api:latest
```
link to the docker hub [Docker-hub](https://hub.docker.com/repositories/abdelrahman2arafa)
![Docker Hub](https://raw.githubusercontent.com/AbdElRhmanArafa/Challenge/refs/heads/main/assets/docker-hub.png)

---
## Docker Compose Configuration

### Services Overview

1. **Nginx**:
   - Acts as a reverse proxy for the application, routing requests to the appropriate services.
   - Uses the latest official Nginx image and is configured with a custom Nginx configuration file.
   - Exposes port 80 for HTTP traffic and waits for the `api` and `client` services to start before running.

2. **Client**:
   - Built from a specified Dockerfile within the `client` directory.
   - Runs as a separate container to serve the frontend of the application.
   - Connected to an internal network for communication with other services.

3. **API**:
   - Built from its own Dockerfile located in the `api` directory.
   - Configured to use a custom PHP-FPM configuration file.
   - Depends on the database service to start before it can run and operates within the internal network.

4. **Database (MySQL)**:
   - Utilizes the latest official MySQL image and is set to restart automatically if it stops.
   - The root password is defined through environment variables for secure access.
   - Data is persisted using a named volume to ensure that database data remains intact across container restarts.
   - An initialization SQL script is provided to set up the database schema on the first run.

### Volume and Network Configuration

- A named volume is defined to store the MySQL data, ensuring data persistence.
- An internal network is created using the bridge driver to facilitate communication between all services without exposing them to the external network.


> **Note:** why use `php artisan serve` instead of `php-fpm`?  `PHP-FPM` is used to handle PHP requests, which is more efficient than using the command php artisan serve . PHP-FPM is designed to manage PHP processes in a production environment, providing better performance and resource management. **BUT** in my case I used `php artisan serve` because I faced some problems with `php-fpm` and I didn't have enough time to solve it and  to allow me to quickly run application and test it Especially with sql.
---
