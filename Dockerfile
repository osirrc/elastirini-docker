FROM ubuntu:18.10

RUN apt update && \
    apt install -y openjdk-8-jdk maven python3 git wget curl jq gnupg && \
    wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add - && \
    sh -c 'echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" > /etc/apt/sources.list.d/elastic-7.x.list' && \
    apt update && \
    apt install -y elasticsearch logstash kibana

COPY index init interact search /

# Expose Elasticsearch and Kibana ports
EXPOSE 9200 5601

WORKDIR /work
