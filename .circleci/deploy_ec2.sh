sudo docker pull stevensim226/minisocial:latest
#sudo docker container rm minisocial-app
sudo docker run --name minisocial-app \
    -e MINISOCIAL_DATABASE_HOST=$MINISOCIAL_DATABASE_HOST
    -e MINISOCIAL_DATABASE_PASSWORD=$MINISOCIAL_DATABASE_PASSWORD
    -p 80:3000
    -d stevensim226/minisocial:latest
    'rails s -e production'
