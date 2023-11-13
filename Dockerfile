FROM artmalini/nginx-dev:0.1

ADD etc/nginx/nginx.conf /etc/nginx/nginx.conf

ADD entrypoint.sh /entrypoint.sh
ADD le.sh /le.sh

RUN \
 rm /etc/nginx/conf.d/default.conf && \
 chmod +x /entrypoint.sh && \
 chmod +x /le.sh && \
 apk add  --update certbot tzdata openssl && \
 rm -rf /var/cache/apk/*

CMD ["/entrypoint.sh"]
