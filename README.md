# docker-opengrok

docker-opengrok is a OpenGrok boxed in a Docker image built by [Tommy Lau](http://tommy.net.cn/).

## What is OpenGrok?

[OpenGrok](https://opengrok.github.io/OpenGrok/) is a fast and usable source code search and cross reference engine. It helps you search, cross-reference and navigate your source tree. It can understand various program file formats and version control histories like Mercurial, Git, SCCS, RCS, CVS, Subversion, Teamware, ClearCase, Perforce, Monotone and Bazaar. In other words it lets you grok (profoundly understand) source code and is developed in the open, hence the name OpenGrok. It is written in Java.

## What's included?

The latest OpenGrok from official release and nothing more.

## How to use this image

Get the docker image by running the following commands:

```bash
docker pull tommylau/opengrok
```

Start an OpenGrok instance:

```bash
docker run  --name=[name] -v /path/to/opengrok:/grok -p [port]:8080 -d --privileged tommylau/opengrok
```
