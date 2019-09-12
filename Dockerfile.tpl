FROM alpine/git:{{git.version}} as git
WORKDIR /
RUN git clone https://github.com/variantdev/mod.git


FROM golang:{{golang.version}}-alpine as builder

ENV GOOS=linux
ENV GOARCH=amd64

WORKDIR /go/src/github.com/variantdev/mod
COPY --from=git /mod /go/src/github.com/variantdev/mod

RUN apk add --no-cache bash make git ca-certificates && make build


FROM alpine:{{alpine.version}}

LABEL "com.github.actions.name"="variantdev/mod"
LABEL "com.github.actions.description"="Package manager for Makefile and Variantfile. Any set of files in Git/S3/GCS/HTTP as a reusable and parameterized module"
LABEL "com.github.actions.icon"="octagon"
LABEL "com.github.actions.color"="orange"

COPY --from=builder /go/src/github.com/variantdev/mod/mod /usr/local/bin/mod

VOLUME ["/mod"]
WORKDIR /mod

ENTRYPOINT ["/usr/local/bin/mod"]
CMD ["--help"]
