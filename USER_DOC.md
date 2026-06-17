## User Documentation

### services provided by the stack

    mariadb: opensource relational databases.

    nginx: is 
    - an http web server 
    - a reverse proxy
    - a content cache
    - a load balancer
    - a TCP/UDP proxy server
    - and a mail proxy server.
    
    wordpress: website builder and content management system, it is open source and allow anyone to create any type of website, blog, or online store. 

### start and stop the project

enter at the root of the git repo : 
```
make
```

depending of how you want to stop the project the Makefile provide different commands, you may want to refer to the README.md to make sure you stop the project the way you desire to stop it.



### access the website and the admin panel

- open the browser of your choice
- enter at the url bar ``` https://ldevoude.42.fr ```
- to access as admin you have to go to ``` https://ldevoude.42.fr/wp-admin ``` and enter the right credentials.

### locate and manage credentials

in the .env file that shall be placed at the root of the project. it shall be provided separetly as a secure mesure.

### check that the services are running correctly

to list running containers:
```docker ps```

