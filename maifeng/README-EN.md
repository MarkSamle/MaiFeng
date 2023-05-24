<div style="text-align: center;">

## MaiFeng-Backend

[![](https://img.shields.io/badge/MaiFeng-V1.0.0-gray.svg?longCache=true&colorB=orange)](https://github.com/MarkSamle/MaiFeng) [![](https://img.shields.io/badge/MaiFeng-ZH-gray.svg?longCache=true&colorB=green)](README.md)

</div>


### Technology Stack

+ Python3.6+
+ Django3.0+
+ Django-rest-framework
+ Django-filters
+ SimpleUI

### Local Installation in Win

+ #### Virtual Environment： `mkvirtualenv -p python3 maifeng`
+ #### Import Dependency： `pip install -r requirements.txt`
+ #### Create Database：
    ```
    mysql -u root -p  # 进入数据库
    CREATE SCHEMA `maifeng` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci ; # 创建数据库
    exit; # 退出
    ```
+ #### Change Database password：
    find `DATABASES` form `maifeng\maifeng\settings.py` and change password
+ #### Generate Database Structure：
    ```
    python manage.py makemigrations 
    python manage.py migrate
    ```
+ #### Create Superuser：`python manage.py createsuperuser`
+ #### Local Test：`python manage.py runserver`

### Config Change 
+ #### System Config Files：`setting.py`
    + ##### Allow Access
        `ALLOWED_HOSTS = ["*"]`
    + ##### Admin LOGO
        `SIMPLEUI_LOGO = 'http://logo.png'`
    + ##### Admin Models Icon
        + [![](https://img.shields.io/badge/获取图标-fontawesome-gray.svg?longCache=true&colorB=lightgreen)](https://fontawesome.com/v5/search?m=free)
        + `SIMPLEUI_ICON = {}` 
    + ##### Admin Menus
        `SIMPLEUI_CONFIG = {}`
    + ##### Database Config
        `DATABASES = {}`
    + ##### System Language
        `LANGUAGE_CODE = 'zh-hans'`
    + ##### System Time Zone
        `TIME_ZONE = 'Asia/Shanghai'`
+ #### Web Config Files：`maifeng_uwsgi.ini`
+ #### Process Manage Config Files：`maifeng_supervisor.conf`
    
### Server Deployment
+ #### [![](https://img.shields.io/badge/Ubuntu-18.04/20.04-gray.svg?longCache=true&colorB=red)](https://ubuntu.com)
    + ##### Collect Static Files
        `python manage.py collectstatic`
    + ##### Import Project
        + Project Path：`cd /opt/`
        + Way：
            + One：`git clone XXX` 
            + Two：Use WinSCP
        + In Project：`cd /opt/maifeng`
    + ##### Virtual Environment
        `mkvirtualenv -p python3 maifeng`
    + ##### Import Dependency： 
        `pip install -r requirements.txt`
    + ##### Create Database：
        ```
        mysql -u root -p  # 进入数据库
        CREATE SCHEMA `maifeng` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci ; # 创建数据库
        exit; # 退出
        ```
    + ##### Generate Database Structure：
        ```
        python manage.py makemigrations 
        python manage.py migrate
        ```
    + ##### Create Superuser：`python manage.py createsuperuser`
    + ##### Install Uwsgi：
        `pip install uwsgi`
    + ##### Install supervisor：
        `pip install supervisor`
    + ##### Create Log Folder：
        `mkdir log`
    + ##### Nginx Config：
        + New File：
            `touch /etc/nginx/conf.d/maifeng.conf`
        + Edit File：
            `vi /etc/nginx/conf.d/maifeng.conf`
        + Config：
            ```
            upstream maifeng{
                server unix:///opt/maifeng/maifeng.sock;
            }
            map $http_upgrade $connection_upgrade {
                default upgrade;
                '' close;
            }
            server {
                listen 80;
                server_name 0.0.0.0;
                root html;
                index index.html index.htm;
                charset utf-8;
                client_max_body_size 1000M;
                location /static {
                    alias /opt/maifeng/static;
                }
                location / {
                    uwsgi_pass  maifeng;
                    include     /etc/nginx/uwsgi_params;
                }
            }
            ```
        + Restart：
            `service nginx restart`
    + ##### Start Process：
        `supervisord -c maifeng_supervisor.conf`
