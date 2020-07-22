# Beluga 🐳

Beluga is a local development environment for WordPress plugins and themes. It uses [Docker](https://www.docker.com/) and Docker Compose.

Beluga is still in development, but the stable branch should work to provide a basic WordPress plugin and theme development environment.

## How to Use

1. To get started, download and install Docker Desktop for your operating system. You can follow the [quickstart instructions in the Docker Docs](https://docs.docker.com/get-started/). Docker Desktop comes with Docker Compose preinstalled. **Linux Users**: Instructions are coming soon. You'll probably need to install Docker Engine and Docker Compose manually.
2. Clone this repository and set up your environment variables by creating a copy of the `.env-example` file, renaming it `.env`, and entering whatever credentials you want to use.
3. To start things up run:

~~~shell
docker-compose up -d
~~~
