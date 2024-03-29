FROM alpine/git:1.0.7

ARG MOD_VERSION=0.2.2

ADD https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub /etc/apk/keys/sgerrand.rsa.pub
ADD https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk /tmp
ADD https://github.com/variantdev/mod/releases/download/v${MOD_VERSION}/mod_${MOD_VERSION}_linux_amd64.tar.gz /tmp
RUN apk --no-cache add /tmp/glibc-2.28-r0.apk \
    && tar -zxvf /tmp/*.tar.gz -C /tmp \
    && cp /tmp/mod /usr/local/bin/mod \
    && chown root:root /usr/local/bin/mod \
    && chmod +x /usr/local/bin/mod \
    && rm -rf /tmp/*

ENTRYPOINT ["/usr/local/bin/mod"]
CMD ["--help"]