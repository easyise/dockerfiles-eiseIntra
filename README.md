eiseIntra dockerfiles
===

All files you need to run Intra apps with Docker container.

Insrtuctions:
---

1. Create root dir for your app, e.g. `mkdir ~/Works/my_gorgeous_app`

2. Make directory for docker and configs:

```
mkdir ~/Works/my_gorgeous_app/dockerfiles
cd ~/Works/my_gorgeous_app/dockerfiles
```

All remaining directories will be created by docker automatically.

3. Clone this gir repository: `git clone https://github.com/easyise/dockerfiles-eiseIntra.git .`

4. Edit '.env_template' file and save it as '.env', correctly specify your envoronment variables (do NOT change MYSQL_HOST value):

```
PROJECT_DIR=your_gorgeous_app_dir
MYSQL_HOST=mysql
MYSQL_ROOT_PASSWORD=your_mysql_pass
MYSQL_DATABASE=your_gorgeous_app_db
MYSQL_PORT=13306
NGINX_PORT=8081
MYSQL_USER=your_gorgeous_app_db_user
MYSQL_PASSWORD=your_gorgeous_app_db_password
```

5. Run docker daemon, then run docker-compose: `docker-compose up --build -d`

If you'd like to initilize an empty app:
---

6. Run init.sh, it will initialize your app from github repos: `./init.sh your_gorgeous_app_dir`

7. Then open your browser and navigate to `http://localhost:8081/your_gorgeous_app_dir/vendor/eiseIntra/admin/`

8. Specify host name 'mysql', login - 'root' and the password you specified as MYSQL_ROOT_PASSWORD in .env file.

9. Choose database 'your_gorgeous_app_db'

10. Click 'Apply eiseIntra' button. Specify login and password for web user. Click Apply.

11. Logon to your app with this URL:  `http://localhost:8081/your_gorgeous_app_dir/`

Important notices:
---

In this container your nginx listens on port you specified as NGINX_PORT (8081 in this example) in .env file.
MySQL listens for external connections on port specified in MYSQL_PORT (13306 in this example), but internal connections should be established to host 'mysql' on standart port (3306).
Php-fpm ports are not mapped externally.

If you'd like to make your app accessible on standard HTTPS port (443) you can use nginx as proxy, e.g.:
```
server {
    listen 443 ssl;

    server_name A.local;

    ssl_certificate ...;
    ssl_certificate_key ...;

    location / {
        proxy_pass http://127.0.0.1:8081;
    }
}
```
