# a614808b9aab7cfd94d66a307a8b65c6c7890097 == 1.7.1
FROM envoyproxy/envoy-alpine:a614808b9aab7cfd94d66a307a8b65c6c7890097

RUN apk add --no-cache tini bash
ADD start.sh /
RUN chmod +x /start.sh
ADD envoy.yaml /etc/envoy.yaml

ENTRYPOINT ["/sbin/tini", "-g", "--"]
CMD ["sh", "-c", "/start.sh"]
