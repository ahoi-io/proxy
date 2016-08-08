FROM fedora:latest

MAINTAINER Bernhard Schuster <rum@ahoi.io>

RUN dnf update -y
RUN dnf install -y nginx

COPY index.html /srv/nginx/ahoi.io/index.html
COPY index.html /srv/nginx/ratpoison.io/index.html

# forward request logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

COPY production.conf /etc/nginx/production.conf
COPY simple.conf /etc/nginx/simple.conf


EXPOSE 80 443

CMD ["nginx", "-c", "/etc/nginx/production.conf", "-g", "daemon off;"]

