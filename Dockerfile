# Inspired by Deepak's setup here - https://gist.github.com/deepak/5925003

FROM ubuntu:16.04

RUN apt-get update -qq && apt-get install -y build-essential nodejs npm git curl mysql-client libmysqlclient-dev libxml2-dev libxslt-dev libreadline-dev
RUN apt-get install imagemagick -y
RUN mkdir -p /rails_app

# Install rbenv
RUN git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
RUN echo '# rbenv setup' > /etc/profile.d/rbenv.sh
RUN echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh
RUN echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
RUN chmod +x /etc/profile.d/rbenv.sh

# install ruby-build
RUN mkdir /usr/local/rbenv/plugins
RUN git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build

ENV RBENV_ROOT /usr/local/rbenv
ENV PATH $RBENV_ROOT/bin:$RBENV_ROOT/shims:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN rbenv install  2.1.4
RUN rbenv global  2.1.4
RUN gem sources --remove https://rubygems.org/
RUN gem sources -a https://gems.ruby-china.com
RUN gem sources -l
RUN gem install bundler -v 1.11.2
RUN rbenv rehash

ENV APP_HOME /rails_app
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
# --- Add this to your Dockerfile ---
ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle

RUN bundle install

ADD . $APP_HOME
