# Docker Web

This docker compose is related with my another repository. You can check it out in [Study-World](https://github.com/kiuyha/Study-World).

## Features
- **Using Dockerfile**. It will setup the app using git and pip.
- **Mysql integration**. The app using Mysql database for saving data.
- **phpMyAdmin integration**. This ensure that modifying and checking database can be do seemsly.
- **Nginx integration**. Nginx can be use to Load Balancing and SSL Termination. It's used by 33.7% of all the website.

## How It Works?
1. When `docker-compose` is running, first it will create the db (Mysql database) since another services depends on it.
2. After db is sucessfuly created and healty, now the app and adminer will be running. The app is using image that being created using `Dockerfile`.
3. Adminer is a container for phpMyAdmin. It using the host, password, user, and port of the db (you can change it in the docker-compose).
4. Finally, after the app sucessfuly running, the web which is nginx will be running and created for us to access.

## Setup
- You can download this repository by click the `code` button and download zip. If you prefer using git, you can use this command
```
git clone https://github.com/kiuyha/docker-web.git
```

- Ensure you running your docker engine. In windows and MacOS, you can just open the `docker desktop` app. If you using linux, you can use this command in terminal
```
sudo systemctl start docker
```

- First build the app using this command
```
docker-compose build --no-cache
```
The `--no-cache` ensure the docker not using cache because the docker will store cache after you build image, this is for faster up the building time but this is also mean the docker using the older version of the repository. Actually you can add `git pull` in `Dockerfile` but this approach is adding time when building.

- After that, you can running the container using this command
```
docker-compose up -d
```
Using `-d` to running it using detached mode meaning it will running in the background.

- Finally you can access the web using some of these url.
### Nginx
```
localhost:8080/auth
```
### Python Flask
```
localhost:5000/auth
```
### phpMyAdmin
```
localhost:8081
```
### Mysql
The db using `3306` port, but you can't access it using localhost since database don't send any data.

### Some of command for docker.
- Stopping docker
```
docker-compose down
```

- Inspect running container
```
docker-compose ps
```

- Inspect images
```
docker images
```

- Access bash of container
```
docker exec -it <container-id> bash 
```


## END
Thank you for reading. Feel free to fork this project and modify it.
