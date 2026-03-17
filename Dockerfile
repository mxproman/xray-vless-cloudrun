FROM alpine:latest
RUN apk add --no-cache ca-certificates bash curl
RUN curl -L https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip -o xray.zip \
    && unzip xray.zip \
    && mv xray /usr/local/bin/ \
    && chmod +x /usr/local/bin/xray \
    && rm -rf xray.zip
COPY config.json /etc/xray/config.json
CMD ["xray", "-config", "/etc/xray/config.json"]
