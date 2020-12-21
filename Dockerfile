FROM nginx:alpine
ENV DNS_RESOLVER "8.8.8.8"
ENV WUNDER_BACKEND_HOST ""
ENV WUNDER_API_TOKEN ""
COPY proxy.conf.template /etc/nginx/templates/proxy.conf.template
RUN rm /etc/nginx/conf.d/default.conf