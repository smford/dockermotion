FROM ubuntu:xenial-20180808

USER root

COPY files/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY files/start-motion.sh /start-motion.sh
RUN chmod +x /start-motion.sh

RUN apt-get update && apt-get install wget vim nginx -y

RUN mkdir /packages
RUN wget https://github.com/Motion-Project/motion/releases/download/release-4.1.1/xenial_motion_4.1.1-1_amd64.deb -O /packages/xenial_motion_4.1.1-1_amd64.deb
RUN apt-get -y install /packages/xenial_motion_4.1.1-1_amd64.deb

COPY files/default-motion /etc/default/motion
RUN chown root:root /etc/default/motion && chmod 644 /etc/default/motion

# Configure nginx
# COPY files/nginx-config /etc/nginx/sites-enabled/nginx-config
# RUN rm -rf /etc/nginx/sites-enabled/default

# Make port 80 available to the world outside this container
EXPOSE 80

# start the wrapper script as user root
#USER root
#ENTRYPOINT ["/entrypoint.sh", "/start-motion.sh"]
