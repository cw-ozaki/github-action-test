FROM cwozaki/mod:latest

LABEL "com.github.actions.name"="variantdev/mod"
LABEL "com.github.actions.description"="Package manager for Makefile and Variantfile. Any set of files in Git/S3/GCS/HTTP as a reusable and parameterized module"
LABEL "com.github.actions.icon"="octagon"
LABEL "com.github.actions.color"="orange"

COPY --from=builder /go/src/github.com/variantdev/mod/mod /usr/local/bin/mod
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
