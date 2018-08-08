# b59205bc9a3e7bd3e0b3453943b0a1a3c93ea0ec == 1.7.1
FROM envoyproxy/envoy-alpine:b59205bc9a3e7bd3e0b3453943b0a1a3c93ea0ec

RUN apk add --no-cache tini bash
ADD start.sh /
RUN chmod +x /start.sh
ADD envoy.yaml /etc/envoy.yaml

ENTRYPOINT ["/sbin/tini", "-g", "--"]
CMD ["sh", "-c", "/start.sh"]
