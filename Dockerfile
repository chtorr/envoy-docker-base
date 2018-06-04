FROM envoyproxy/envoy-alpine:v1.6.0

RUN apk add --no-cache tini bash
ADD start.sh /
RUN chmod +x /start.sh
ADD envoy.yaml /etc/envoy.yaml

ENTRYPOINT ["/sbin/tini", "-g", "--"]
CMD ["sh", "-c", "/start.sh"]
