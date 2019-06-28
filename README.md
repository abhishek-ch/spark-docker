<h1> Spark Docker Environment for Development/Testing Purpose </h1>

A docker-compose is provided to simplify the life !!!

The project is based on this [article](https://towardsdatascience.com/a-journey-into-big-data-with-apache-spark-part-1-5dfcc2bccdd2)

Files included are -
* **Dockerfile** - Defined Spark and required binaries to be setup in the container
* **docker-compose.yml** - Trigger the job

_Port mapping is done 8555:8080 for Spark master UI_

### How to Run ###

* For Docker build.     		```docker build -t $DOCKER_ID/spark:latest .```
* Add $DOCKER_NAME in bash      ```export $DOCKER_ID = <Docker Id>```
* Docker Compose        		```docker-compose up``` 
* For multiple workers  		```docker-compose up --scale spark-worker=3```


#### Starting a Spark-Shell

To check the Docker Network Name - 
<code>
docker network ls
</code>

Docker Run -
```
docker run --rm -it --network trial_docker_spark-network buntha/spark:latest /bin/sh
```

Docker Run, starting Spark-Shell - 
```
source ~/.bashrc
spark-shell --master spark://spark-master:7077
```



### Troubleshooting

- Currently i am using my own Docker hub id for Spark Image tagging <b>buntha</b>, add yours DOCKER_ID in the bash


### Success 

Try [http://localhost:8555](http://localhost:8555)

![](https://raw.githubusercontent.com/abhishek-ch/spark-docker/master/spark_ui.png)