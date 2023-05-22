FROM ruby:${VARIANT:-3.2-buster}

# Install image preview generator tools
RUN apt-get update \
    && apt-get install -y apt-transport-https ca-certificates\
    imagemagick libmagickwand-dev libfontconfig\
    mlocate curl perl

RUN updatedb

# Image magick fonts
RUN mkdir -p /usr/src/img
WORKDIR /usr/src/img
RUN curl -o ./imagick_type_gen.pl https://www.imagemagick.org/Usage/scripts/imagick_type_gen
RUN chmod u+x ./imagick_type_gen.pl
RUN mkdir ~/.magick
RUN ./imagick_type_gen.pl > ~/.magick/type.xml

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . .
RUN gem install bundler
RUN bundle install --deployment
EXPOSE 5000
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "5000"]
