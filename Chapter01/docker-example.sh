#First we will pull an image
docker pull docker/whalesay

#We can then look at which images we have locally
docker images

#Then we will run our container
docker run docker/whalesay cowsay boo