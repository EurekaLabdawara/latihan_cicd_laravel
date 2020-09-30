#memakai prebuild image
FROM '123majumundur/php-7.1-nginx':cicd
LABEL maintainer="eurekalabdawara@gmail.com"

#install prestissimo untuk instalasi composer yang lebih cepat
RUN composer global require hirak/prestissimo

#buat folder untuk menghost aplikasi
RUN mkdir home/app/app
WORKDIR home/app/app

#instal dependensi
COPY composer.json composer.json
RUN composer install --prefer-dist --no-scripts --no-dev --no-autoloader && rm -rf /home/app/.composer

#copy codebase
COPY --chown=app:root . ./

#finish composer
#RUN composer dump-autoload
RUN composer dump-autoload --no-scripts --no-dev --optimize

EXPOSE 8080