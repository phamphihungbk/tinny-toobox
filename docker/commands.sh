#Build docker image with located file
docker build -f "location file" -t cassandra .
#Run docker instance from available image
docker run --name "image of instance" -d "name image"
#Tag local image with remote image
docker tag local_image remote_image
#Push image to remote server
docker push image_name
