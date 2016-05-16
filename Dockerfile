# Inspired by Deepak's setup here - https://gist.github.com/deepak/5925003

FROM ubuntu:14.04

RUN apt-get update -qq
RUN apt-get install -y build-essential

RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN apt-get install -y git
RUN apt-get install -y curl
RUN apt-get install -y mysql-client
RUN apt-get install -y libmysqlclient-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libxslt-dev
RUN apt-get install -y libreadline-dev
RUN apt-get install -y alien
RUN apt-get install -y libaio1
RUN mkdir -p /rails_app

#install oracle instant client
ADD oracle_instant_client/* /tmp/
RUN alien -i /tmp/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
RUN alien -i /tmp/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm
RUN alien -i /tmp/oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm

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

#REF https://help.ubuntu.com/community/Oracle%20Instant%20Client
ENV LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib/${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}

RUN rbenv install  2.1.4
RUN rbenv global  2.1.4
RUN gem sources --remove https://rubygems.org/
RUN gem sources -a https://ruby.taobao.org/
RUN gem sources -l
RUN gem install bundler
RUN rbenv rehash

ENV APP_HOME /rails_app
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
# --- Add this to your Dockerfile ---
ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle

WORKDIR /rails_app

RUN bundle install

ADD . $APP_HOME
