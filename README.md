- Setup:
========
    * Create Data Directory (on Docker Host):
        # mkdir -p /opt/node1
        # mkdir -p /opt/node2
    
    * Build Docker Image (on Docker Host):
        # docker build -t deployment/elasticsearch .
        
    * Run Docker Container (on Docker Host):
        # docker run --name elasticsearch1 -d -v /opt/node1:/opt/elasticsearch/node1 -p 9200:9200 -p 9300:9300 -t deployment/elasticsearch
        # docker run --name elasticsearch2 -d -v /opt/node2:/opt/elasticsearch/node1 -p 9201:9200 -p 9301:9300 -t deployment/elasticsearch
        
    Elasticsearch data and logs are persistant, in case docker container goes down ES data and logs will be available in /opt/node[1/2] directory on Docker host.