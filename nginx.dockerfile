FROM nginx
COPY ./configs/nginx.conf /etc/nginx/nginx.conf
COPY ./configs/default.conf /etc/nginx/conf.d/default.conf
COPY ./configs/loadBalancer.conf /etc/nginx/conf.d/loadBalancer.conf
CMD [ "nginx", "-s", "reload" ]

EXPOSE 80
