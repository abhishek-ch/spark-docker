FROM openjdk:8-alpine

# Added all necessary libraries along with git to pull scala project in container
RUN apk --update add wget tar bash && \
	 apk add --no-cache bash git openssh

#Download the Spark binaries from the repo
WORKDIR /
RUN wget http://mirror.dkd.de/apache/spark/spark-2.4.3/spark-2.4.3-bin-hadoop2.7.tgz

# Untar the downloaded binaries , move them the folder name spark and add the spark bin on my class path
RUN tar -xzf /spark-2.4.3-bin-hadoop2.7.tgz && \
    mv spark-2.4.3-bin-hadoop2.7 spark && \
    echo "export PATH=$PATH:/spark/bin" >> ~/.bashrc

# Install Sbt to build scala/bt project, ideally only sbt is enough to build project
RUN wget https://piccolo.link/sbt-1.2.8.tgz && \
	tar -xzf /sbt-1.2.8.tgz && \
	mv sbt /usr/local && \
	ln -s /usr/local/sbt/bin/* /usr/local/bin/ && \
	sbt sbtVersion || true


COPY start-master.sh /start-master.sh
COPY start-worker.sh /start-worker.sh