FROM ubuntu:latest AS BUILD_IMAGE
RUN apt update && apt install wget unzip -y
RUN wget https://www.tooplate.com/zip-templates/2075_digital_team.zip
RUN unzip 2075_digital_team.zip && cd 2075_digital_team && tar -czf digital.tgz * && mv digital.tgz /root/digital.tgz

FROM ubuntu:latest
RUN apt update && apt install apache2 git wget -y
COPY --from=BUILD_IMAGE /root/digital.tgz /var/www/html/
RUN cd /var/www/html/ && tar xzf digital.tgz
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
VOLUME /var/www/html/
EXPOSE 80
