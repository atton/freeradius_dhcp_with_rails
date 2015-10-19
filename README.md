# Static Address DHCP using FreeRADIUS with rails
Sample of DHCP server using FreeRADIUS with.

# Set up docker containers and rails server
* PostgreSQL
    * docker build -t pg94 docker/postgres
    * docker run -itd --name postgres-server -p 5432:5432 -e POSTGRES_PASSWORD=hogehoge pg94
    * See Details (https://hub.docker.com/_/postgres/)

* Rails
    * rake db:create db:migrate
    * rake db:seed
    * rails server
        * Please Add your IP Information

* FreeRADIUS
    * modify IP in docker/bind-sdb/named.conf
        * Please set your postgres-server IP or docker host IP
    * $ docker build -t freeradius_with_rails/freeradius-dhcp docker/freeradius-dhcp
    * $ docker run -itd --link postgres-server:postgres-server --name dhcp-server freeradius_with_rails/freeradius-dhcp
