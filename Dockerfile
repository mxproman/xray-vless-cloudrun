FROM alpine:latest

# Xray መጫኛ
RUN apk add --no-cache ca-certificates bash curl
RUN curl -L https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip -o xray.zip \
    && unzip xray.zip \
    && mv xray /usr/local/bin/ \
    && chmod +x /usr/local/bin/xray \
    && rm -rf xray.zip

# ኮንፊገሬሽኑን ኮፒ አድርግ
COPY config.json /etc/xray/config.json

# Cloud Run የሚሰጠውን Port እንዲጠቀም (አስገዳጅ ነው)
CMD ["xray", "-config", "/etc/xray/config.json"]
