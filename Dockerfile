FROM ruby:3.0.0

EXPOSE 3000

RUN mkdir rubyapp/
WORKDIR rubyapp/

ADD . .

RUN bundle install
RUN rails db:migrate
CMD ["rails", "s", "-e", "production"]