## Play Scala REST API and VueJS Frontend with Docker
First install Docker from https://www.docker.com/products/docker-desktop

Clone this repo:
```bash
git clone https://github.com/robertoporceddu/play-scala-rest-api-and-vuejs-example
```

Build Docker image and run the container
```bash
cd play-scala-rest-api-and-vuejs-example
docker build -t robertoporceddu/play-scala-rest-api-and-vuejs-example .
docker run -p 80:80 -p 3306:3306 -p 9000:9000 -it robertoporceddu/play-scala-rest-api-and-vuejs-example
```

After everything is build, open the browser and go to http://localhost:9000/v1/posts and wait the response, then go to http://localhost to see the fontend.

If you want to connect to Mysql Database, use localhost:3306 as host and root/root for username and password.
