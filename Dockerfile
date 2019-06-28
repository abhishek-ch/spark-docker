FROM openjdk:8-alpine

RUN apk --update add wget tar bash

#Download the Spark binaries from the repo
WORKDIR /
RUN wget http://mirror.dkd.de/apache/spark/spark-2.4.3/spark-2.4.3-bin-hadoop2.7.tgz

# Untar the downloaded binaries , move them the folder name spark and add the spark bin on my class path
RUN tar -xzf /spark-2.4.3-bin-hadoop2.7.tgz && \
    mv spark-2.4.3-bin-hadoop2.7 spark && \
    echo "export PATH=$PATH:/spark/bin" >> ~/.bashrc


COPY start-master.sh /start-master.sh
COPY start-worker.sh /start-worker.sh