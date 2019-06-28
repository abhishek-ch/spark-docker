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








# HOW To RUN 

# docker build -t buntha/spark:latest .

# Refer from this
# https://towardsdatascience.com/a-journey-into-big-data-with-apache-spark-part-1-5dfcc2bccdd2

# First run Docker
# docker run --rm -it --name spark-master --hostname spark-master -p 7077:7077 -p 8080:8080 buntha/spark:latest /bin/sh

# Inside Docker Shell Run Following for Master
# /spark/bin/spark-class org.apache.spark.deploy.master.Master --ip `hostname` --port 7077 --webui-port 8080

# After Networking 
# MASTER Run Looks Like 
# docker run --rm -it --name spark-master --hostname spark-master -p 7077:7077 -p 8080:8080 --network spark_network buntha/spark:latest /bin/sh

# Run WORKER in doker network
# docker run --rm -it --name spark-worker --hostname spark-worker  --network spark_network buntha/spark:latest /bin/sh

# Docker Shell Worker Command
# /spark/bin/spark-class org.apache.spark.deploy.worker.Worker --webui-port 8080 spark://spark-master:7077


# Run Spark-shell
# docker run --rm -it --network spark_network buntha/spark:latest /bin/sh

# Inside Docker Shell
# source ~/.bashrc
# spark-shell --master spark://spark-master:7077

# check spark network after docker compose using ```docker network ls``` command