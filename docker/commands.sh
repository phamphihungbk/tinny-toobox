#Build docker image with located file
docker build -f "location file" -t cassandra .
#Run docker instance from available image
docker run --name "image of instance" -d "name image"
