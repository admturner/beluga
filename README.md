          ____                               
          /   )          /                   
      ---/__ /-----__---/-----------__----__-  
        /    )   /___) /   /   /  /   ) /   )  
      _/____/___(___ _/___(___(__(___/_(___(_  
                                    /        
                                (_ /         

# Beluga 🐳 [ ![Download](https://img.shields.io/github/v/release/admturner/Beluga.svg) ](https://github.com/admturner/beluga/releases/tag/v1.2.0)

Beluga is a local development environment for WordPress. It uses [Docker](https://www.docker.com/) and Docker Compose.

🚧 Beluga is still in development, but the `stable` branch should work to provide a basic WordPress development environment.

## System Requirements

- A 64-bit operating system with virtualization enabled and 4GB+ of system RAM. See the [Get Docker guides](https://docs.docker.com/get-docker/) for OS-specific requirements.
- Hyper-V turned on for Windows.
- Docker Engine (included as part of Docker Desktop for Mac and Windows).
- Docker Compose (included as part of Docker Desktop for Mac and Windows).

**Conflicts:** Docker will not work alongside Virtualbox.

## How to Use

1. To get started, download and install Docker Desktop for your operating system. You can follow the [quickstart instructions in the Docker Docs](https://docs.docker.com/get-started/). Docker Desktop comes with Docker Compose preinstalled.
    - **Linux Users**: Instructions are coming soon. You'll probably need to install Docker Engine and Docker Compose manually.
2. To start things up run: `./beluga start`. The first time this runs it'll create a Dockerfile (in `config/containers`) for the WordPress container and an environment file (`.env`) file to store the WordPress database credentials. It'll then build, create, start, and attach to containers for each service specified in the `docker-compose.yml` file.
3. When you receive the "All set" message you can visit [http://localhost:8000](http://localhost:8000) in a web browser to complete the installation through the WordPress interface.
3. You can add plugins and themes and modify files in the `plugins`, `themes`, and `wordpress` directories.
6. When you're finished you can run `./beluga stop` to stop the running services, and then `./beluga start` to bring things back up. To remove the containers volumes use `./beluga down`. To completely remove all containers, images, networks, and volumes use `./beluga destroy`. You can also interact with the containers using standard Docker Compose commands. See the [Docker Compose CLI reference](https://docs.docker.com/compose/reference/overview/) for more information.

## Reference

### Network paths

- WordPress: [http://localhost:8000](http://localhost:8000)
- phpMyAdmin: [http://localhost:3333](http://localhost:3333)
- MailHog: [http://localhost:8025](http://localhost:8025)

### CLI commands

Usage: `./beluga [command]`

Commands:

- `destroy`: Stops and deletes all volumes, images, and containers.
- `down`: Stop and remove containers, networks, images, and volumes.
- `start`: Start services. Create environment and containers if needed.
- `status`: Show the current containers and their status.
- `stop`: Stop services.
- `version`: Display the Beluga, Docker Compose, and Docker versions.

### Default credentials

The default MariaDB database name is `wordpress` with the following credentials:  

| Field    | Value        |
| -------- | ------------ |
| username | wp           |
| password | password     |

The MariaDB root user will have the following credentials:

| Field    | Value        |
| -------- | ------------ |
| username | root         |
| password | root         |

You can SSH into the Docker image running WordPress with: `docker exec -it wordpress bash`.

### Packages installed

The following packages are installed through the [WordPress](https://hub.docker.com/_/wordpress), [MariaDB](https://hub.docker.com/_/mariadb), [phpMyAdmin](https://hub.docker.com/r/phpmyadmin/phpmyadmin), and [MailHog](https://hub.docker.com/r/mailhog/mailhog) Docker images.

- [WordPress stable](https://wordpress.org/)
- [PHP 7.4.x](https://www.php.net/)
- [MariaDB 10.5.x](https://mariadb.org/)
- [Apache 2](https://httpd.apache.org/)
- PHP [imagick extension](https://pecl.php.net/package/imagick)
- [phpMyAdmin](https://www.phpmyadmin.net/)
- [MailHog](https://github.com/mailhog/MailHog)

### PHP Extensions

The following PHP Modules are installed as part of the official WordPress Docker image.

- bcmath
- Core
- ctype
- curl
- date
- dom
- exif
- fileinfo
- filter
- ftp
- gd
- hash
- iconv
- imagick
- json
- libxml
- mbstring
- mysqli
- mysqlnd
- openssl
- pcre
- PDO
- pdo_sqlite
- Phar
- posix
- readline
- Reflection
- session
- SimpleXML
- sodium
- SPL
- sqlite3
- standard
- tokenizer
- xml
- xmlreader
- xmlwriter
- Zend OPcache
- zip
- zlib
