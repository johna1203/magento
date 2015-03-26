# magento + nginx + mariadb

## Prepare the container for MariaDB

change the password you want.

changing the value [-e "MARIADB_PASS=yourmariadbpassword"]

```shell

$ docker run --name="mariadb-data" johna1203/docker-data

$ docker run -d --name="mariadb" -e "MARIADB_PASS=yourmariadbpassword" -p 3306:3306 --volumes-from mariadb-data johna1203/docker-mariadb

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

[-v ~/src/magento:/data]

the Magento code will be placed in the directory [~/src/magento] from your computer.

```shell

$ mkdir ~/src/magento

$ docker run --name="magento-data" -v ~/src/magento:/data johna1203/docker-data

$ docker run --name="magento" -d -p 8080:80 --link mariadb:mariadb --volumes-from magento-data johna1203/nginx-php-magento

```

wait for the container will download the Magento source code and copy the directory ~/src/ magento/http.

You can check the progress using the docker logs

```shell

$ docker logs magento

```

when it's over will be created a file called "databaseInfo.txt" in your directory (~/src/magento).

Inside will have the information from your database.

## Access the magento

I use [boot2docker](http://boot2docker.io/)
check the ip [boot2docker](http://boot2docker.io/)

```shell

$ boot2docker ip
192.168.59.103

```
Visit the web browser on port 8080.

http://192.168.59.103:8080

I think you will see the magento screen.

Thank U.
