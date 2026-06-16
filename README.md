*This project has been created as part of the 42 curriculum by ldevoude*

# Project Inception

## Description
This project aim to broaden our knowledge of system administration by using Docker.
We had to virtualize 3 docker images to setup 3 different services (MariaDB, Nginx, Wordpress)
it had to be done on a virtual machine that is running Debian or Alpine. (I choosed the former)





## Instructions
### make
To start and rebuild our services and make the folders required to store our data you are required to enter the following command at the root of the Git repository of the project (it prevent data loss when containers are restarted or removed as it esnure that local host directoryies exist)
```
make
```


### down
To stop and remove containers, networks, volumes created by our docker-compose you need to do the following command at the root of the Git Repository of the project
```
make down
```

### up
If you need to only starts containers use it if you need to restart the environment or for a quick reset, but do not test updated code with it as no changes would be taken into account.
```
make up
```


### clean
To stop remove *all* our containers, images, volumes and custom networks that is active on the host machine where the command was done.
```
make clean
```
(!Warning: that command is 'radical' as it erase ALL images in your system, *AND BY ALL IT MEAN ALSO IMAGES THAT DOESN'T BELONG TO THE PROJECT*)

### fclean
extends the  clean target by also removing *named Docker volumes* that generaly persist after a regular clean or down.
```
make fclean
```

### prune
to clean up automaticaly (cache or unused image / volumes) it is a safe command to free space without the risk of deleting the still used images by working containers.
```
make prune
```

### volume
To erase the data folder and it's content. 
```
make volume
```

### logs
to show up logs of all our containers (useful to debug or to understand why a specific service crashed)
```
make logs
```

### re
To fclean + make
```
make re
```

### execution
You can get on the created wordpress page by entering the following URL in your browser:
```
https://ldevoude.42.fr
```

you can also log as an admin if you have the right login and password by doing

```
https://ldevoude.42.fr/wp-admin
```




### Use of AI:

- `ldevoude`: had to use it at some point to make a more efficient and quick documentation, however, peer collaboration remained my primary source to gather critical information and/or knowledge over the topic.
I also had to use it at some point to help me getting trough bugs/issues nobody was able to help me resolve.



## Resources

### wikipedia's related sources.
- https://en.wikipedia.org/wiki/Daemon_(computing)
- https://en.wikipedia.org/wiki/Nginx
- https://en.wikipedia.org/wiki/MariaDB
- https://en.wikipedia.org/wiki/MySQL
- https://en.wikipedia.org/wiki/WordPress
- https://en.wikipedia.org/wiki/API
- https://en.wikipedia.org/wiki/DevOps
- https://en.wikipedia.org/wiki/OS-level_virtualization
- https://en.wikipedia.org/wiki/Docker_(software)
- https://en.wikipedia.org/wiki/Virtual_machine
- https://en.wikipedia.org/wiki/Proxy_server

### main sources
- https://docs.docker.com
- https://hub.docker.com
- https://blog.stephane-robert.info/ (the bible)
- https://www.manning.com/books/learn-docker-in-a-month-of-lunches

### secondary sources
- https://mariadb.com/resources/blog/get-started-with-mariadb-using-docker-in-3-steps/
- https://mariadb.com/docs/server/server-management/automated-mariadb-deployment-and-administration/docker-and-mariadb/creating-a-custom-container-image
- https://www.geeksforgeeks.org/devops/docker-or-virtual-machines-which-is-a-better-choice/
- https://nginx.org/en/docs/http/configuring_https_servers.html
- https://www.baeldung.com/ops/docker-compose-restart-policies
- https://github.com/docker/awesome-compose/tree/master/wordpress-mysql
- https://medium.com/freestoneinfotech/simplifying-docker-compose-operations-using-makefile-26d451456d63

### utils
- https://docs.docker.com/get-started/docker_cheatsheet.pdf
- https://lab.abilian.com/Tech/Cheat%20Sheets/Dockerfile%20Cheat%20Sheet/

##  Project description

### virtual machines vs Docker
- Dockers boots faster
- Pre-built docker are available and easy to find while ready-made VM are difficult to find-
- Dockers require less resources
- containers are lighter
- Docker offer great flexibility for apps that require regular modifications and updates, while VM seem to be more ideal when it come to static programs that do not change signficantly over time.
- VMs are more secure as there is a strong isolation (doesn't rely on shared kernel unlike Docker), so VM are better suited for tasks that require high security.

My conclusion is that they serve different purposes, and can be used together depending of our needs Docker is focused on speed and efficiency (and solve the compatibility issues.) while VMs is a more secure solution.

### secrets vs Environment Variables

Environment variables are used to store configuration setting in plain text making it visible to any users. Where secrets are restricted to authorized ones only.
we use env variables for safe, non-sensitive configuration that define application behavior.
We use secret managers for any data where a leak would grand unauthorized access or cause any damage.

### Docker Network vs Host Network
Those differ mostly when it come to isolation performance and port management.

Bridge Network (default Docker Network) create an isolate vistual network where containers get their own IP and network name, to communicate with the host require port mapping (8080:80) This provide *strong security isolation* containers cannot access host's services directly, and external systems cannot reach containers without mapped ports.

Host network remove network isolation entirely, it use host IP address and interface directly.

### Docker Volumes vs bind Mounts

Docker volumes and bind mounts differ when it come to management portability and performance.

Volumes are managed by docker stored in a dedicated directory.

bind mounts map a specific host path into our container, it rely on host's exact directory structure offering real-time sync for code editing but introduce path dependencies.
