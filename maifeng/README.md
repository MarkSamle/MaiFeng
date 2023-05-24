<div style="text-align: center;">

## 脉蜂后端

[![](https://img.shields.io/badge/MaiFeng-V1.0.0-gray.svg?longCache=true&colorB=orange)](https://github.com/MarkSamle/MaiFeng) [![](https://img.shields.io/badge/MaiFengDoc-EN-gray.svg?longCache=true&colorB=green)](README-EN.md)
</div>

### 技术栈

+ Python3.6+
+ Django3.0+
+ Django-rest-framework
+ Django-filters
+ SimpleUI

### Win本地安装

+ #### 虚拟环境： `mkvirtualenv -p python3 maifeng`
+ #### 导入依赖： `pip install -r requirements.txt`
+ #### 创建数据库：
    ```
    mysql -u root -p  # 进入数据库
    CREATE SCHEMA `maifeng` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci ; # 创建数据库
    exit; # 退出
    ```
+ #### 对应修改数据库密码配置：
    在 `maifeng\maifeng\settings.py` 中找到 `DATABASES` 修改密码配置
+ #### 生成数据库结构：
    ```
    python manage.py makemigrations 
    python manage.py migrate
    ```
+ #### 创建超级用户：`python manage.py createsuperuser`
+ #### 打开本地测试：`python manage.py runserver`

### 配置修改
+ #### 系统配置文件：`setting.py`
    + ##### 请求白名单
        `ALLOWED_HOSTS = ["*"]`
    + ##### 后台LOGO
        `SIMPLEUI_LOGO = 'http://logo.png'`
    + ##### 后台模块图标 
        + [![](https://img.shields.io/badge/获取图标-fontawesome-gray.svg?longCache=true&colorB=lightgreen)](https://fontawesome.com/v5/search?m=free)
        + `SIMPLEUI_ICON = {}` 
    + ##### 后台菜单
        `SIMPLEUI_CONFIG = {}`
    + ##### 数据库配置
        `DATABASES = {}`
    + ##### 语言
        `LANGUAGE_CODE = 'zh-hans'`
    + ##### 时区
        `TIME_ZONE = 'Asia/Shanghai'`
+ #### Web配置文件：`maifeng_uwsgi.ini`
+ #### 进程管理配置文件：`maifeng_supervisor.conf`
    
### 服务器部署 
+ #### [![](https://img.shields.io/badge/Ubuntu-18.04/20.04-gray.svg?longCache=true&colorB=red)](https://ubuntu.com)
    + ##### 静态资源收集
        `python manage.py collectstatic`
    + ##### 移入项目
        + 项目位置：`cd /opt/`
        + 引入项目：
            + 方法1：`git clone XXX` 
            + 方法2：WinSCP传入
        + 进入项目：`cd /opt/maifeng`
    + ##### 创建虚拟环境
        `mkvirtualenv -p python3 maifeng`
    + ##### 导入依赖： 
        `pip install -r requirements.txt`
    + ##### 创建数据库：
        ```
        mysql -u root -p  # 进入数据库
        CREATE SCHEMA `maifeng` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci ; # 创建数据库
        exit; # 退出
        ```
    + ##### 生成数据库结构：
        ```
        python manage.py makemigrations 
        python manage.py migrate
        ```
    + ##### 创建超级用户：`python manage.py createsuperuser`
    + ##### 安装Uwsgi：
        `pip install uwsgi`
    + ##### 安装supervisor：
        `pip install supervisor`
    + ##### 创建日志文件夹：
        `mkdir log`
    + ##### Nginx配置：
        + 新建文件：
            `touch /etc/nginx/conf.d/maifeng.conf`
        + 编辑文件：
            `vi /etc/nginx/conf.d/maifeng.conf`
        + Nginx配置：
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
        + 重启Nginx生效配置：
            `service nginx restart`
    + ##### 启动进程：
        `supervisord -c maifeng_supervisor.conf`
