FROM 056154071827.dkr.ecr.us-east-1.amazonaws.com/base-image-ruby-version-arg:2.7
MAINTAINER cru.org <wmd@cru.org>

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update
RUN apt install --no-install-recommends yarn
RUN yarn --version

ARG DD_API_KEY
RUN echo $DD_API_KEY
RUN DD_INSTALL_ONLY=true DD_API_KEY=$DD_API_KEY bash -c "$(curl -L https://raw.githubusercontent.com/DataDog/datadog-agent/master/cmd/agent/install_script.sh)"

# Config for logging to datadog
COPY docker/datadog-agent /etc/datadog-agent
COPY docker/supervisord-datadog.conf /etc/supervisor/conf.d/supervisord-datadog.conf
COPY docker/docker-entrypoint.sh /

# https://www.speedshop.co/2017/12/04/malloc-doubles-ruby-memory.html - limit malloc arenas
ENV MALLOC_ARENA_MAX=4

COPY Gemfile Gemfile.lock ./

RUN bundle config set without 'development test'
RUN bundle install --jobs 20 --retry 5 --deployment
RUN bundle binstubs bundler --force
RUN bundle binstub puma rake rails

COPY . ./

RUN bundle exec rails assets:precompile RAILS_ENV=production

## Run this last to make sure permissions are all correct
RUN mkdir -p /home/app/webapp/tmp /home/app/webapp/db /home/app/webapp/log && \
  chmod -R ugo+rw /home/app/webapp/tmp /home/app/webapp/db /home/app/webapp/log

CMD "/docker-entrypoint.sh"