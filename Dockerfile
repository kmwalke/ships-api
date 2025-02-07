FROM ruby:3.4.1
LABEL maintainer="kent@slaymakercellars.com"

ARG USERNAME
ARG UID
ARG GID

RUN echo "$USERNAME:1234:$UID:$GID:docker-user,,,:/app/:/bin/bash" >> /etc/passwd

RUN apt-get update && \
  apt-get install -y \
  build-essential \
  postgresql-client

RUN curl https://cli-assets.heroku.com/install.sh | sh

ENV BUNDLE_PATH /gems
ENV PATH $BUNDLE_PATH/bin:$GEM_HOME/gems/bin:$PATH

WORKDIR /app
EXPOSE 3000

RUN gem install bundler

ENTRYPOINT [ "./script/docker-entrypoint.sh" ]
