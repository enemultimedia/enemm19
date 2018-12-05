FROM ruby:2.5
LABEL maintainer="pjaneiro@whitesmith.co"

ENV HOME /home/user
ENV CODE /code

RUN useradd --create-home --home-dir $HOME user && \
  chown -R user:user $HOME && \
  chown -R user:user $GEM_HOME

RUN apt-get update -qq && \
  apt-get install -y build-essential libpq-dev vim

RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN apt-get update -qq && \
  apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && \
  apt-get install -y yarn

USER user

WORKDIR $CODE

VOLUME $CODE

EXPOSE 3000

CMD ["bundle","exec","rails","server","Puma","-p","3000","-b","0.0.0.0"]
