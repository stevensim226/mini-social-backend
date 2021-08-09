FROM ruby:3.0.0

EXPOSE 3000

RUN mkdir rubyapp/
WORKDIR rubyapp/

ADD . .

RUN bundle install

CMD ["bash", "run_prod.sh", "&&", "rails", "server", "-e", "production"]