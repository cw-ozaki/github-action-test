provisioners:
  files:
    Dockerfile:
      source: Dockerfile.tpl
      arguments:
        mod:
          version: "{{ .mod.version }}"

dependencies:
  mod:
    releasesFrom:
      dockerImageTags:
        source: chatwork/mod
      version: "> 0.2.1"
