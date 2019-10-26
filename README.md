# Smiley noise image web app

Simple smiley image web app using sinatra and RMagick.

## install

### MAC OS X

```sh
brew install imagemagick@6
```

```sh
export LDFLAGS="-L/usr/local/opt/imagemagick@6/lib"
export CPPFLAGS="-I/usr/local/opt/imagemagick@6/include"
export PKG_CONFIG_PATH="/usr/local/opt/imagemagick@6/lib/pkgconfig"
gem install rmagick -v '4.0.0'
```

Save this perl script as [imagick_type_gen.pl](http://www.imagemagick.org/Usage/scripts/imagick_type_gen)

```sh
curl -o ./imagick_type_gen.pl http://www.imagemagick.org/Usage/scripts/imagick_type_gen
chmod u+x ./imagick_type_gen.pl
mkdir ~/.magick
./imagick_type_gen.pl > ~/.magick/type.xml
```
