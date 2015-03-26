


#prepare mariadb

```shell

$ docker run --name="mariadb-data" johna1203/data
$ docker run -d --name="mariadb" -e "MARIADB_PASS=atpass" -p 3306:3306 --volumes-from mariadb-data johna1203/mariadb

```

# run magento container for dev

```shell

$ docker run --name="magento-data" -v ~/src/magento:/data johna1203/data
$ docker run -d -p 8080:80 --link mariadb:mariadb --volumes-from magento-data johna1203/nginx-php-magento

```
