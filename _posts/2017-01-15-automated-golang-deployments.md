---
layout: post
categories: ["tips", "tutorias"]
tags: ["tips", "tutorias"]
title: "Automated golang Deployments"
date: "2017-01-15 21:00 -0500"
published: False
comments: True
---

# Intro
In this post I am going to create an outline for the process that I have successfully used to automatically test and deploy golang web applications to a production ready cloud environment using Docker, CircleCi, GitHub, and Digital Ocean. 

Using Docker as a contianerization service as well as an orchestration layer has allowed me to support clustering and scaling of my web applications in a seamless manor.

When coupled with a continuous integration service like CircleCi I have been able to perform deploys using just a single code commit that include end to end testing for the applications for each deploy. 

# Set up a repository on GitHub

While this is a bit out of scope for this guide you can follow the steps [here](https://help.github.com/articles/create-a-repo/) to get a repository started for the application. The important thing here is that the repository is made and houses the application as well as the configuration files that will be described throughout the guide. This will be the primary means of notifying CircleCi whenever a change has been made to the application and provides a central resource of configuation for CircleCi and Docker.

# Setting up a Golang web app

In this section I will set up a simple golang web application using the http library provided by the standard library. I am not going to go into much depth as to what the process is here for setting up and getting started with go, I assure you there are many great tutorials just a quick search away.

First I create the following file in my golang projects directory.

main.go
```golang
package main

import (
    "fmt"
    "net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "I love Go!")
}

func main() {
    http.HandleFunc("/", handler)
    http.ListenAndServe(":80", nil)
}
```
If you have your gopath set up then at this point you're all set to build the application if you wish to try things out.

Otherwise if you haven't set up the path yet or if you're not sure how then the next section will actually outline the process of containerizing the application in a docker container. So technically you don't even need to install the golang toolkit on your computer as the docker container will contain all of the dependencies and requirements for building and running the golang app. This is really where Docker shines as you can do all of your development locally testing your changes against a docker container. Once you're done adding the feature all you'll need to do is push up the container to Dockerhub and it is ready to go!


# Docker
### Writing a Dockerfile
The first step is to write a Dockerfile using the oficially maintained golang  container.

Dockerfile
```Dockerfile
FROM golang:latest
# Put your info on the following line
MAINTAINER Fredrick Paulin <fredrick.p@outlook.com>

# Create the directory for the application to run from
RUN mkdir /app 

# Add the contents of the current directory to the dockerimage
ADD . /app/ 

#Set your working directory
WORKDIR /app 

# While not needed for this particular example you can include any dependencies
# here that you need for your app.
# The following is an example of getting the mysql package
RUN go get github.com/go-sql-driver/mysql

# Build the application
RUN go build -o main . 

# Set the port that your web application communicates on
EXPOSE 80:80

# This is the command that runs by defualt when the container is run, include
# any flags or arguments for your app here.
CMD ["/app/main"]
```

Now we just need to build and test our app and contianer replacing the repository owner and name where appropriate:

```bash
docker build -t . derfoh/golang-deploys-tutorial
docker run -it -p 80:80 derfoh/golang-deploys-tutorial
```
Note that we have specified the port with the `-p 80:80` tag this tells docker that you want the internal port 80 on the container to listen on port 80 of the host. You can change this to your liking but since our application is already written to listen on port 80 for this example we will continue to use the standard http port. 

Once you have navigated to [http://localhost/](http://localhost/) you will be greeted by the message "I love Go!". This confirms that the application was properly built and ran. Eventually we will automate this test using a simple `curl` defined within the CircleCi settup.

To exit the container use ctrl+c.

Next we need to push the initial container to Dockerhub replacing my info with yours where appropriate
```bash
docker push derfoh/golang-deploys-tutorial
```

## Connecting Docker cloud and Docker hub
This section will detail how to put your docker image hosted at [hub.docker.com](http://hub.docker.com) into the docker cloud at [cloud.docker.com](http://cloud.docker.com).

After logging into [Docker Cloud](http://cloud.docker.com) you will want to go to the repository link along the left navigation bar.

Then select the container that you wish to deploy.

The next page will show some information about the application as well as some configuration options for it as well. We want to launch the service so go ahead and click on the button that says "Launch Service".

The next page that will come up will be the general settings for the application. 

We will want to toggle some options on this page. First turn on autoredeploy. This will tell Docker that as soon as the configurations are changed to automatically restart the container to reflect those configuration changes.

Scroll down to the ports section and enter port 80 for the node port. Tick the "Published" box, then click "Add Port". This tells dockercloud to publish the service on that port on that host. You can also set this to be alocated dynamically if you don't want to use port 80.

### Configuring Dockerhub service to auto deploy when a new image is pushed
This section will detail the process of automatically deploying when a new docker image is pushed to docker hub. The container living in docker cloud will automattically redeploy it's self as soon as a new docker build is available. This step while not required can be skipped if you prefer a manual deployment but for the sake of this guide we'll be automating the whole process from the git push to the deployed application.

# CircleCi
### Writing a circle.yml

```yml
machine:
  environment:
    IMPORT_PATH: "github.com/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME"
  services:
    - docker

dependencies:
  pre:
    # set up golang dependencies here
    # you will tell CircleCi where the golang app is hosted using go get
    - go get github.com/DerfOh/golang-deploys-tutorial


  override:
    # overrides for golang
    - mkdir -p "$GOPATH/src/$IMPORT_PATH"
    - rsync -azC --delete ./ "$GOPATH/src/$IMPORT_PATH/"
    # Ensure the docker service is present
    - docker info
    # Specify the build location for docker to create the container as well as your docker registry for the application
    - docker build --rm=false -t derfoh/golang-deploys-tutorial /home/ubuntu/golang-deploys-tutorial

test:
  pre:
    # go tests want to include them, these should be done before pushing to github generally though
    # - go vet ./...
    # - go test ./...

  override:
    # go overrides
    - docker run -d -p 80:80 derfoh/golang-deploys-tutorial; sleep 10
    # Test that our webserver is up and serves a page once the container is run
    - curl --retry 10 --retry-delay 30 -v http://localhost/

# Here we define the branch that CircleCi will be deploying once all the 
# tests pass, you need to make sure you set your environment variables 
# within your circle project 
deployment:
  hub:
    branch: master
    commands:
      - docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
      - docker push derfoh/golang-deploys-tutorial

```
$CIRCLE_PROJECT_USERNAME, and $CIRCLE_PROJECT_REPONAME both will be set by CircleCi but you will need to manually set the variables for $DOCKER_EMAIL, $DOCKER_USER, and $DOCKER_PASS. The next section will talk about this.

## Authorize CircleCi to access GitHub repo and setting up environment variables for automatically deploying the docker container.
This final step we will glue all of these components together. First we will configure CircleCi to watch our git repository for changes. Then we will set up the environment variables that are needed in order to push the docker container once all of the tests have run on CircleCi.

## Link CircleCi to your GitHub
1. Go to [your CircleCi Dashboard](https://circleci.com/dashboard)
2. Click on the cog labled by "Account Settings"
3. Click "Accont Integrations"
4. Then proceed with connecting your GitHub Account
5. Next click on the box with a plus on it labled "Add Project"
6. Select your GitHub Profile
7. Finally locate the project you wish to add, in our case it would be golang-deploys-tutorial
8. Once you have located the project click the button that says "Build Project"

Your project will now be built by CircleCi according to the preferences in the circle.yml

After the first run you will see that the build has failed on a step. This is because the environment variables associated with your Docker account have not been set for the project yet.

## Set up variables for docker deployment
1. Click on builds
2. Click the cog next to the project name
3. This will open up the configurations page for your project. There are a lot of settings that you can tweek here but our main focus will be setting the environment variables
4. Under the heading "Build Settings" you will see a link labled "environment variables"
5. Click on "Add variable"
6. The first one will be our Docker Email. In the "name" field enter `DOCKER_EMAIL`, then in the "value" field enter your email address associated with your docker account.
7. Click "Add variable"
6. Repeat steps 5 through 7 for `DOCKER_USER` and `DOCKER_PASS`

## Give it a go
 
At this point we should be all set to rebuild the project. Go ahead and click the link that says "rebuild"

If all goes well after a few minutes the project will build it's self and deploy the docker container to your docker repository. Then once the docker image is deployed docker cloud will see that there is a difference in the container and automatically redeploy the container to the latest version. 

You might notice that the first push to docker takes a bit of time to complete but if you look into your build times as you push more changes you will notice that the built in caching of layers for Docker will allow for your deploys to be shorter and shorter every time you commit code.