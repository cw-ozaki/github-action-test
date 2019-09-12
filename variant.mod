provisioners:
  files:
    Dockerfile:
      source: Dockerfile.tpl
      arguments:
        git_version: "{{.git.version}}"

dependencies:
  git:
    releasesFrom:
      dockerImageTags:
        source: alpine/git
    version: "> 1.0.6"
