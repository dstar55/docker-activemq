This is image containing ***activemq 5.11.1***. Image is based on ***dockerfile/java:oracle-java7***

Usage:   

clone git repo   
```
$ git clone https://github.com/dstar55/docker-activemq .
```

build docker image   
```
$ docker build -t="docker-activemq" .
```

run AMQ via docker   
```
$ docker run -p=61616:61616 -p=8161:8161 -d docker-activemq
```

