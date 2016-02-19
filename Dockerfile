FROM tutum/lamp:latest
MAINTAINER Saransh Sharma <saransh@theupscale.in>, Upscale Team <team@theupscale.in>

# Install plugins
RUN apt-get update && \
  apt-get -y install php5-gd && \
  rm -rf /var/lib/apt/lists/*

# Download latest version of Wordpress into /app
RUN rm -fr /app && git clone --depth=1 https://github.com/theupscale/upscalweb.git /app

# Configure Wordpress to connect to local DB
ADD wp-config.php /app/wp-config.php

#Load database

ADD data/wordpress_bk.sql /tmp/wordpress_bk.sql

# Modify permissions to allow plugin upload
RUN chown -R www-data:www-data /app/wp-content /var/www/html

# Add database setup script
ADD create_mysql_admin_user.sh /create_mysql_admin_user.sh
ADD create_db.sh /create_db.sh
RUN chmod +x /*.sh


EXPOSE 80 3306
CMD ["/run.sh"]
