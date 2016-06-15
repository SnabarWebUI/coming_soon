#!/usr/bin/env bash

docker build -t snabar/coming-soon .
echo "$(tput setaf 2)Building image $(tput sgr0)"
docker run -d --name snabar-coming-soon -p 80:80 snabar/coming-soon
echo "$(tput setaf 2)Running container for the first time $(tput sgr0)"

if [ $? != 0 ]
then
    docker stop snabar-coming-soon
    echo "$(tput setaf 1)Stopping Docker image $(tput sgr0)"
    docker rm snabar-coming-soon
    echo "$(tput setaf 1)Removing Docker image $(tput sgr0)"
    docker run --rm --name snabar-coming-soon -p 80:80 -d snabar/coming-soon
    echo "$(tput setaf 1)Starting new Docker image $(tput sgr0)"
fi

echo "$(tput setaf 2)Deployed Coming-Soon \n Please visit http://snabar.com $(tput sgr0)"
