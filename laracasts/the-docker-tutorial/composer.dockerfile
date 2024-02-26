# Unlike our previous three services composer is not designed to stay up and running in the background. This container is meant to be created for the sole purpose of running a composer command and then once completed, be destroyed to free up any resources.
FROM composer:2

ENV COMPOSERUSER=laravel
ENV COMPOSERGROUP=laravel

RUN adduser -g ${COMPOSERGROUP} -s /bin/sh -D ${COMPOSERUSER}