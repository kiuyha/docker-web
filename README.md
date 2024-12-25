# Docker Web

This docker compose is related with my other repository. You can check it out in [Study-World](https://github.com/kiuyha/Study-World).

## Features
- **Using Dockerfile**. It will setup the app using git and pip.
- **Mysql integration**. The app using Mysql database for saving data.
- **phpMyAdmin integration**. This ensure that modifying and checking database can be do easly.
- **Nginx integration**. Nginx can be use to Load Balancing and SSL Termination. It's used by 33.7% of all the website.

## How It Works?
1. When `docker-compose` is running, first it will create the db (Mysql database) since another services depends on it.
2. After db is sucessfuly created and healty, now the app and adminer will be running. The app is using image that being created using `Dockerfile`.
3. Adminer is a container for phpMyAdmin. It using the host, password, user, and port of the db (you can change it in the docker-compose).
4. Finally, after the app sucessfuly running, the web which is nginx will be running and created for us to access.

## Setup
1. You can download this repository by click the `code` button and download zip. If you prefer using git, you can use this command
```
git clone https://github.com/kiuyha/docker-web.git
```
2. This program requires to have .env file to be run. Below are the required variables:
  - `MAIL_USERNAME`: The email that the app will be use.
  - `MAIL_PASSWORD`: Password of the email.
  - `SECRET_KEY `: Random string as key for encryption user's data.
  -  `DATABASE_URL`: mysql+pymysql://app_user:password@db:3306/database.
  You can also run this command for to have the same thing:
  ```
  echo MAIL_USERNAME=your_email_address > .env
  echo MAIL_PASSWORD=your_email_password >> .env
  echo SECRET_KEY=your_secret_key >> .env
  echo DATABASE_URL=mysql+pymysql://app_user:password@db:3306/database >> .env
  ```
  **NOTE**: if you run that command in powershell or CMD the .env file might be using the UTF-16, which not
  supported by the python code. You can change it in vscode though.

3. Ensure you running your docker engine. In windows and MacOS, you can just open the `docker desktop` app. If you using linux, you can use this command in terminal
```
sudo systemctl start docker
```

4. First build the app using this command
```
docker-compose build --no-cache
```
The `--no-cache` ensure the docker not using cache because the docker will store cache after you build image, this is for faster up the building time but this is also mean the docker using the older version of the repository. Actually you can add `git pull` in `Dockerfile` but this approach is adding time when building.

5. After that, you can running the container using this command
```
docker-compose up -d
```
Using `-d` to running it using detached mode meaning it will running in the background.

6. Finally you can access the web using some of these url.
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
