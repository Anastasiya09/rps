FROM ruby:2.6.1
MAINTAINER ANASTASIIA

# Installation of dependencies
RUN apt-get update -qq \
    && apt-get install -y \
        # Needed for certain gems
      build-essential \
           # Needed for postgres gem
      libpq-dev \
           # Needed for asset compilation
      nodejs \
      # The following are used to trim down the size of the image by removing unneeded data
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf \
      /var/lib/apt \
      /var/lib/dpkg \
      /var/lib/cache \
      /var/lib/log

# Set working directory
ENV CURRENT_PATH /usr/src/app
WORKDIR $CURRENT_PATH

# Setting env up
ENV RAILS_ENV='production'
ENV RACK_ENV='production'
ENV RAILS_SERVE_STATIC_FILES='true'

# Adding gems
COPY ./Gemfile Gemfile
COPY ./Gemfile.lock Gemfile.lock
RUN bundle install --jobs 20 --retry 5 --without development test
# Adding project files
COPY . .
RUN bundle exec rake assets:precompile
EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]