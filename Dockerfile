FROM eboraas/apache-php:latest

RUN apt update
RUN apt install -y ca-certificates apt-transport-https wget gpg
RUN wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add -
RUN echo "deb https://packages.sury.org/php/ buster main" | tee /etc/apt/sources.list.d/php.list
RUN apt update
RUN apt install -y php7.0
RUN apt install -y php7.0-cli php7.0-common php7.0-curl php7.0-gd php7.0-json php7.0-mbstring php7.0-mysql php7.0-xml
RUN a2dismod php7.3
RUN a2enmod php7.0
VOLUME /var/www/html
