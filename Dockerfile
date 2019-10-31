FROM ruby
RUN apt-get -y update && apt-get -y install libicu-dev cmake && rm -rf /var/lib/apt/lists/*
RUN gem install github-linguist
RUN mkdir -p /gollum-src && cd /gollum-src && git clone https://github.com/gollum/gollum && cd /gollum-src/gollum && git checkout 5.x && bundle install && bundle exec rake install
RUN gem install wikicloth
WORKDIR /wiki
ENTRYPOINT ["bundle", "exec", "bin/gollum", "--port", "80"]
EXPOSE 80
