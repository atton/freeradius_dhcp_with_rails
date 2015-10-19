# Pull OS image
FROM centos

# Install radius packages
RUN /bin/yum -y install freeradius freeradius-ldap freeradius-postgresql vim && /bin/yum clean all

# Add radius configuration
ADD files/mods-available/sql                           /etc/raddb/mods-available/
ADD files/sites-available/dhcp.relay                   /etc/raddb/sites-available/
ADD files/mods-config/sql/main/postgresql/queries.conf /etc/raddb/mods-config/sql/main/postgresql/

WORKDIR /etc/raddb/mods-enabled/
RUN /bin/ln -s ../mods-available/sql sql && /bin/chown root:radiusd *

# Enable dhcp
WORKDIR /etc/raddb/sites-enabled/
RUN /bin/ln -s ../sites-available/dhcp.relay dhcp.relay && /bin/chown root:radiusd *

# Return working directory to "/"
WORKDIR /

RUN sed -i -e 's/user = radiusd/user = root/'   /etc/raddb/radiusd.conf && \
    sed -i -e 's/group = radiusd/group = root/' /etc/raddb/radiusd.conf

# CMD /usr/sbin/radiusd -f -d /etc/raddb
CMD bash
