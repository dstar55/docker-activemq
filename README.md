Run ***activemq 5.15.13***, via Docker.

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

