# Beluga 🐳

Beluga is a local development environment for WordPress. It uses [Docker](https://www.docker.com/) and Docker Compose.

🚧 Beluga is still in development, but the `stable` branch should work to provide a basic WordPress development environment. 🚧

## System Requirements

- A 64-bit operating system with virtualization enabled and 4GB+ of system RAM. See the [Get Docker guides](https://docs.docker.com/get-docker/) for OS-specific requirements.
- Hyper-V turned on for Windows.
- Docker Engine (included as part of Docker Desktop for Mac and Windows).
- Docker Compose (included as part of Docker Desktop for Mac and Windows).

**Conflicts:** Docker will not work alongside Virtualbox.

## How to Use

1. To get started, download and install Docker Desktop for your operating system. You can follow the [quickstart instructions in the Docker Docs](https://docs.docker.com/get-started/). Docker Desktop comes with Docker Compose preinstalled.
    - **Linux Users**: Instructions are coming soon. You'll probably need to install Docker Engine and Docker Compose manually.
2. Clone this repository and set up your environment variables by creating a copy of the `.env-example` file, renaming it to `.env`, and entering whatever credentials you want to use.
3. To start things up run: `docker-compose up -d` to build, create, start, and attach to containers for each service. This command also starts any linked services. The `-d` flag runs it all in the background.
4. You'll now see the `wordpress` volume created in the root Beluga directory. You can add plugins and themes and modify files here. They'll persist between Docker Compose `up`s and `down`s.
5. Visit [http://localhost:8000](http://localhost:8000) in a web browser to complete the installation through the WordPress interface. (If the page fails to load right away give it a couple of minutes and try again, some things continue loading even after the "done" message.)
6. When you're finished you can run `docker-compose stop` to stop the running services, and then `docker-compose start` to bring things back up. To remove the services and containers use `docker-compose down`. See the [Docker Compose CLI reference](https://docs.docker.com/compose/reference/overview/) for more information.

## Reference

### Packages installed in Beluga

- The latest WordPress Docker Official image, which includes the following (as of 2020-07-23):
    - WordPress Stable
    - PHP 7.4.x
    - [Apache](https://httpd.apache.org/)
    - PHP [imagick extension](https://pecl.php.net/package/imagick)