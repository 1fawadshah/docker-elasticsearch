FROM phusion/baseimage:latest
MAINTAINER "Fawad Shah <https://github.com/1fawadshah>"

# Install Java 8
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && sudo apt-get -y install oracle-java8-installer wget

# Download, Install and Configure Elasticsearch 1.3.5
RUN wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.5.tar.gz
RUN tar xvzf elasticsearch-1.3.5.tar.gz
RUN cp -r elasticsearch-1.3.5 /opt/elasticsearch/
RUN rm elasticsearch-1.3.5/ elasticsearch-1.3.5.tar.gz -rf
RUN ln -s /opt/elasticsearch/bin/* /usr/bin/
ADD elasticsearch.yml /opt/elasticsearch/config/

# Install Elasticsearch plugin(s), if required.
# Installing elasticsearch-river-mongodb plugin as an example, remove or replace with your required plugin.
RUN plugin --install com.github.richardwilly98.elasticsearch/elasticsearch-river-mongodb/2.0.2

EXPOSE 9200 9300

ENTRYPOINT elasticsearch
