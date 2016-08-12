FROM fedora:latest

MAINTAINER Bernhard Schuster <rum@ahoi.io>

RUN dnf update -y
RUN dnf install -y nginx

# forward request logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443

CMD ["nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;"]

