# docker-cerb
CerbWeb packaged for Docker

# Requirements

  * Docker 1.6 and above
  * External MySQL or MariaDB database

# Launching the Docker container

``` docker run -d --name cerb -p 8080:80 abhas/cerb ```

# Setting up cerb

  * Access the application on the port published above
  * Provide the database details and setup the application
  * Access the container and delete the install directory: ``` docker exec -ti cerb bash ``` and then ``` rm -r /var/www/html/install/ ```

