# Static Address DHCP using FreeRADIUS with rails
Sample of DHCP server using FreeRADIUS with.

# Set up docker containers and rails server
* PostgreSQL
    * docker build -t pg94 docker/postgres
    * docker run -itd --name postgres-server -p 5432:5432 -e POSTGRES_PASSWORD=hogehoge pg94
    * See Details (https://hub.docker.com/_/postgres/)

* Rails
    * rake db:create db:migrate
    * rails server
        * Please Add your IP Information(e.g.: http://localhost:3000)

* FreeRADIUS
    * $ docker build -t freeradius_with_rails/freeradius-dhcp docker/freeradius-dhcp
    * $ docker run --privileged --link postgres-server:postgres-server --name dhcp-server -itd freeradius_with_rails/freeradius-dhcp
    * Please modify /etc/raddb/sites-enabled/dhcp.relay for your environment.
    * $ radiusd -X

* Check DHCP client in docker
    * $ docker run --privileged -it centos bash
    * $ yum install -y dhclient
    * Plase Register your Mac Address/IP Information using rails
    * $ dhclient -d
