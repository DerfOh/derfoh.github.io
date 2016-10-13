FROM phusion/baseimage:0.9.18

  # Install the brightbox ruby repository
  # https://www.brightbox.com/blog/2016/01/06/ruby-2-3-ubuntu-packages/
  RUN apt-add-repository ppa:brightbox/ruby-ng

  # Install lower level dev libraries required to install
  # gems with native extensions
  RUN apt-get update && apt-get install -y zlibc \
    libgcrypt11-dev \
    zlib1g-dev \
    build-essential \
    git

  # Install ruby
  RUN apt-get install -y -q ruby2.3 ruby2.3-dev

  # Install bundler and rake
  RUN gem install rake:11.1.2 \
    bundler:1.11.2 \
    --no-rdoc --no-ri

  # Install Jekyll and some common plugins
  RUN gem install jekyll:3.1.3 \
    rouge:1.10.1 \
    jekyll-scholar:5.8.0 \
    jekyll-seo-tag:1.4.0 \
    jekyll-assets:2.1.3 \
    jekyll-press:0.2.1 \
    --no-rdoc --no-ri

  COPY build.sh .

  RUN chmod +x build.sh

  CMD ["./build.sh"]
