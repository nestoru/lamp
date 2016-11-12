FROM php:5.6-apache

MAINTAINER Nestor Urquiza <nestor.urquiza@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
    apt-get install -y less vim ssl-cert

RUN a2dismod mpm_event && \
    a2enmod mpm_prefork ssl rewrite && \
    a2ensite default-ssl && \
    make-ssl-cert generate-default-snakeoil --force-overwrite

EXPOSE 443
