FROM envoyproxy/envoy-alpine:v1.6.0

RUN apk add --no-cache tini
ADD start.sh /
ADD envoy.yaml /etc/envoy.yaml

ENTRYPOINT ["/sbin/tini", "-g", "--"]
CMD ["sh", "-c", "/start.sh"]
