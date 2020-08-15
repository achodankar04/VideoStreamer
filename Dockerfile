FROM achodankar/ub-linux

MAINTAINER achodankar <ultimate.buzz.2019@gmail.com>

WORKDIR /var/www/html

RUN cd /var/www/html && rm -f index.html

RUN rm -rf /var/www/html/

ADD ./feed /var/www/html/feed/
ADD ./google /var/www/html/google/
ADD ./install /var/www/html/install/
ADD ./locale /var/www/html/locale/
ADD ./objects /var/www/html/objects/
ADD ./plugin /var/www/html/plugin/
ADD ./updatedb /var/www/html/updatedb/
ADD ./view /var/www/html/view/

ADD ./CNAME /var/www/html/
ADD ./LICENSE /var/www/html/
ADD ./_config.yml /var/www/html/
ADD ./_git.json.php. /var/www/html/
ADD ./classic.htaccess /var/www/html/
ADD ./index.php /var/www/html/
ADD ./new.htaccess /var/www/html/
ADD ./routes.php /var/www/html/
ADD ./rtmp.code-workspace /var/www/html/
ADD ./sitemap.xml /var/www/html/
ADD ./web.config /var/www/html/
ADD ./youphptube.yaml /var/www/html/
ADD ./.htaccess /var/www/html/

RUN cd /var/www/html  && pip install --upgrade pip \
    && pip install youtube-dl

ADD ./docker/000-default.conf /etc/apache2/sites-enabled/000-default.conf

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
