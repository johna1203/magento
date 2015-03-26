# magento + nginx + mariadb

## Prepare the container for MariaDB

change the password you want.

changing the value [-e "MARIADB_PASS=yourmariadbpassword"]

```shell

$ docker run --name="mariadb-data" johna1203/docker-data

$ docker run -d --name="mariadb" -e "MARIADB_PASS=yourmariadbpassword" -p 3306:3306 --volumes-from mariadb-data johna1203/mariadb

```

You can check the database password using docker logs

```shell

$ docker logs mariadb | grep MariaDB
....
....
MariaDB Username: docker
MariaDB Password: yourmariadbpassword

```

# Container for Magento

Now we will create the container for Magento.

to get access in the magento source code, I am sharing the directory

[-v ~ /src/magento:/data]

the Magento code will be placed in the directory [~/src/magento] from your computer.

```shell

$ docker run --name="magento-data" -v ~/src/magento:/data johna1203/data

$ docker run --name="magento" -d -p 8080:80 --link mariadb:mariadb --volumes-from magento-data johna1203/nginx-php-magento

```

wait for the container will download the Magento source code and copy the directory ~/src/ magento/http.

You can check the progress using the docker logs

```shell

$ docker logs magento

```
