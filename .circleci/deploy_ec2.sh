sudo docker pull stevensim226/minisocial-be:latest
sudo docker rm -f minisocial-app
sudo docker run --name minisocial-app \
    -e MINISOCIAL_DATABASE_HOST=$MINISOCIAL_DATABASE_HOST \
    -e MINISOCIAL_DATABASE_PASSWORD=$MINISOCIAL_DATABASE_PASSWORD \
    -e MASTER_KEY=$MASTER_KEY \
    -p 3000:3000 \
    -d stevensim226/minisocial-be:latest
exit
