#memakai prebuild image
FROM '123majumundur/php-7.1-nginx':cicd
LABEL maintainer="eurekalabdawara@gmail.com"

#install prestissimo untuk instalasi composer yang lebih cepat
RUN composer global require hirak/prestissimo

#instal dependensi
COPY composer.json composer.json
RUN composer install --prefer-dist --no-scripts --no-dev --no-autoloader

#copy codebase
COPY --chown=app:root . ./

#finish composer
#RUN composer dump-autoload
RUN composer dump-autoload --no-scripts --no-dev --optimize

EXPOSE 8080