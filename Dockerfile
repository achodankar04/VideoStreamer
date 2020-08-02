FROM achodankar/ub-linux

MAINTAINER achodankar <ultimate.buzz.2019@gmail.com>

WORKDIR /var/www/html

RUN cd /var/www/html && rm -f index.html
ADD * /var/www/html/

RUN cd /var/www/html  && pip install --upgrade pip \
    && pip install youtube-dl

ADD ./docker/000-default.conf /etc/apache2/sites-enabled/000-default.conf

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
