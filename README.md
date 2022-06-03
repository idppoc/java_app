# Gradle Docker Sample App

This is an example Java application that uses Spring Boot 2, Gradle and Docker
It is intended to be built and deployed using Tekton and Flux CD.


## Create a Docker image packaging an existing jar

```bash
./gradlew build
docker build . -t my-app -f Dockerfile
```

## To run the docker image

```bash
docker run -p 8080:8080 my-app
```

And then visit http://localhost:8080 in your browser.

