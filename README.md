# React Slim PHP Boilerplate
## Nginx and PHP-FPM on Alpine Linux

# Quickstart
```$xslt
npm run setup
npm start
npm run sever #in a new tab
```

# Recommended Setup
```$xslt
docker-compose up
```
* This will start the docker containers and nginx will point to server code.
* Server(Slim PHP) can be accessed at [localhost:80](http://localhost:80/)
* Now in a new tab 
```$xslt
npm start
```
* Frontend(React) can be accessed at [localhost:9000](http://localhost:9000/)

# Docker
To run docker containers
```$xslt
docker-compose up
```

# Project Structure

```
.
└── Client                           // All Client side(React) code goes here 
    ├── public                    
    |   ├── dist                    // Production build for react - automatically gets generated
    |   |   ├── bundle.js
    |   |   ├── index.html
    ├── src
    |   ├── components               // React components   
    |   |   ├── App.js        
    |   ├── index.html                // Webpack uses this html file as a base template to render react react application
    |   ├── index.js                 // Mount React application on div with id `app`   
└── Config                          // Nginx and PHP-FPM config files goes here
    ├── fpm-pool.conf              // PHP-fpm Configuration file
    ├── nginx.conf                // Nginx configuration file  
    ├── php.ini
    ├── supervisord.conf          // Supervisord configuration file     
└── Server                       // All Server side(Slim PHP) code goes here
    ├── src
        ├── index.php           // Slim PHP application
```