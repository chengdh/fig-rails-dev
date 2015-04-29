# Inspired by Deepak's setup here - https://gist.github.com/deepak/5925003

FROM ubuntu:14.04

RUN apt-get update -qq && apt-get install -y build-essential nodejs npm git curl mysql-client libmysqlclient-dev libxml2-dev libxslt-dev libreadline-dev
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

RUN rbenv install  2.0.0-p598
RUN rbenv global  2.0.0-p598
RUN gem sources --remove https://rubygems.org/
RUN gem sources -a https://ruby.taobao.org/
RUN gem sources -l
RUN gem install bundler
RUN rbenv rehash

WORKDIR /rails_app

ADD Gemfile Gemfile
RUN ruby -v
RUN bundle install

ADD . /rails_app
