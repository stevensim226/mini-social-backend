echo $MASTER_KEY > config/master.key
RAILS_ENV=production bundle exec rake db:create db:migrate