#pull base image
FROM openjdk:8-jdk-alpine

#maintainer 
MAINTAINER dstar55@yahoo.com

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

#expose ports
EXPOSE 61612 61613 61616 8161

# download the activemq gzip file to the Linux machine
RUN wget http://ftp.carnet.hr/misc/apache/activemq/5.11.1/apache-activemq-5.11.1-bin.tar.gz

# extract the files from the gzip file 
RUN tar zxvf apache-activemq-5.11.1-bin.tar.gz

# move the ActiveMQ folder to optional folder (`/opt`)
RUN mv apache-activemq-5.11.1 /opt

# create symbolic link, while the ActiveMQ scripts expect to have them run from `/opt/activemq`
RUN ln -sf /opt/apache-activemq-5.11.1/ /opt/activemq

# If the ActiveMQ start-up script is not executable, change its permissions. Script is located in the `bin` directory
#RUN chmod 755 /opt/activemq/bin/activemq

#cleaning
RUN apt-get clean
RUN rm apache-activemq-5.11.1-bin.tar.gz

# start the ActiveMQ 
CMD java -Xms1G -Xmx1G -Djava.util.logging.config.file=logging.properties -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote -Djava.io.tmpdir=/opt/activemq/tmp -Dactivemq.classpath=/opt/activemq/conf -Dactivemq.home=/opt/activemq -Dactivemq.base=/opt/activemq -Dactivemq.conf=/opt/activemq/conf -Dactivemq.data=/opt/activemq/data -jar /opt/activemq/bin/activemq.jar start
