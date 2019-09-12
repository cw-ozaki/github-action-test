provisioners:
files:
  Dockerfile:
    source: Dockerfile.tpl
    arguments:
      git:
        version: "{{.git.version}}"
      golang:
        version: "{{.golang.version}}"
      alpine:
        version: "{{.alpine.version}}"

dependencies:
  git:
    releasesFrom:
      dockerImageTags:
        source: alpine/git
    version: "> 1.0.6"
  golang:
    releasesFrom:
      dockerImageTags:
        source: golang
    version: "> 1.13.0"
  alpine:
    releasesFrom:
      dockerImageTags:
        source: alpine
    version: "> 3.10"
