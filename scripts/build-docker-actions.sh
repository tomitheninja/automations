#!/usr/bin/env bash
set -euo pipefail
# set -x

CONTEXT=$(dirname $0)
DOCKER_REPO=$1
TAG=$2
EXTRA_ARGS=${3:-''}

# Enable this script to be executed locally
: ${GITHUB_OUTPUT:=/dev/stdout}
: ${GITHUB_STATE:=/dev/stdout}
: ${GITHUB_STEP_SUMMARY:=/dev/stdout}
: ${GITHUB_ENV:=/tmp/.github-env}

pushd $CONTEXT

for FILE in *.Dockerfile
do
  NAME=${FILE%.Dockerfile}
  docker buildx build --load \
    --file "$FILE" \
    --tag "$DOCKER_REPO/$NAME:$TAG" \
    $EXTRA_ARGS \
    .
done

echo '# Docker images' >> $GITHUB_STEP_SUMMARY
docker images "$DOCKER_REPO"/"$NAME"* >> $GITHUB_STEP_SUMMARY

popd