sudo docker pull stevensim226/minisocial-be:latest
#sudo docker container rm minisocial-app
sudo docker run --name minisocial-app \
    -e MINISOCIAL_DATABASE_HOST=$MINISOCIAL_DATABASE_HOST \
    -e MINISOCIAL_DATABASE_PASSWORD=$MINISOCIAL_DATABASE_PASSWORD \
    -e MASTER_KEY=$MASTER_KEY \
    -p 80:3000 \
    stevensim226/minisocial-be:latest
