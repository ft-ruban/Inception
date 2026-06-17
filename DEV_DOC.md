Developer documentation

### set up the environment from scratch (prerequisites, config files, secrets).

make a .env file that shall include the following:
- DOMAIN_NAME=<your desired domain name>
- SQL_DATABASE=<desired name for mariadb database>
- SQL_USER=<desired name for mariadb username>
- SQL_PASSWORD=<desired name for mariadb password>
- SQL_ROOT_PASSWORD=<desired root password for mariadb docker>
- WP_TITLE=<desired wordpress title>
- WP_ADMIN=<Username of your Wordpress admin>
- WP_ADMIN_PASSWORD=<Password of your Wordpress admin>
- WP_ADMIN_EMAIL=<Email of your Wordpress admin>
- WP_USER=<Username of your non admin user>
- WP_USER_EMAIL=<Mail of your regular User>
- WP_USER_PASSWORD=<Password of your regular user>

### build and launch the project using the Makefile and Docker compose.
To start and rebuild our services and make the folders required to store our data you are required to enter the following command at the root of the Git repository of the project (it prevent data loss when containers are restarted or removed as it esnure that local host directories exist)
```
make
```

### use relevant commands to manage the containers and volumes

#### down
To stop and remove containers, networks, volumes created by our docker-compose you need to do the following command at the root of the Git Repository of the project
```
make down
```

#### up
If you need to only starts containers use it if you need to restart the environment or for a quick reset, but do not test updated code with it as no changes would be taken into account.
```
make up
```


#### clean
To stop remove *all* our containers, images, volumes and custom networks that is active on the host machine where the command was done.
```
make clean
```
(!Warning: that command is 'radical' as it erase ALL images in your system, *AND BY ALL IT MEAN ALSO IMAGES THAT DOESN'T BELONG TO THE PROJECT*)

#### fclean
extends the  clean target by also removing *named Docker volumes* that generaly persist after a regular clean or down.
```
make fclean
```

#### prune
to clean up automaticaly (cache or unused image / volumes) it is a safe command to free space without the risk of deleting the still used images by working containers.
```
make prune
```

#### volume
To erase the data folder and it's content. 
```
make volume
```

#### logs
to show up logs of all our containers (useful to debug or to understand why a specific service crashed)
```
make logs
```

#### re
To fclean + make
```
make re
```

### identify where the project data is stored and how it persists.

```
/home/ldevoude/data/wordpress
```
```
/home/ldevoude/data/mariadb
```

In the docker-compose.yml we redirect the data here thanks to Named volumes. It persist because it is created on the host machine and as long thoses folder are not cleaned then the data shall persist.