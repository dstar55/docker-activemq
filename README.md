This is image containing activemq 5.11.1.   
It is based on ***dockerfile/java:oracle-java7***

To build run this command:
```
$ docker build -t="docker-activemq" .

$ docker run -p=61616:61616 -p=8161:8161 -d docker-activemq
```


