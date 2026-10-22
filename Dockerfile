FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf
COPY deploy/hosts /etc/nginx/sites-enabled
COPY deploy/nginx.conf /etc/nginx/nginx.conf
COPY deploy/expires.conf /etc/nginx/expires.conf
ADD public /usr/share/nginx/html
HEALTHCHECK --interval=60s --timeout=1s --start-period=5s CMD curl --fail --header 'Host: getsby.co' http://localhost/health || exit 1
