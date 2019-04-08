# React Slim PHP Boilerplate
## Nginx and PHP-FPM on Alpine Linux

# Quickstart
```$xslt
npm run setup
npm start
npm run sever #in a new tab
```
# Docker
To run docker containers
```$xslt
docker-compose up
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

# Project Structure
