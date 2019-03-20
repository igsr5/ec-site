# ==============================================================================
# docker - local.Dockerfile
# ==============================================================================
# ruby:2.6.1-alpine
FROM ruby@sha256:7fdd3e9ab2f9797c280deeb1a97d8158b28bd33eb98531b928cb006270712d2e
ENV LANG C.UTF-8

ENV APP_HOME /pos_system
WORKDIR $APP_HOME

# Install apk package
COPY docker/scripts/apk_install.sh scripts/apk_install.sh
RUN /bin/sh scripts/apk_install.sh

# Prepare App
COPY . $APP_HOME

# Expose assets for web container
VOLUME $APP_HOME/public/assets

EXPOSE 3000
CMD bundle exec rails server -b 0.0.0.0
