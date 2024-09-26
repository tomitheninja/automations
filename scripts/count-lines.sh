#!/usr/bin/env bash
set -euo pipefail
set -x

TARGET_DIR=$1
IGNORE_RULE=$2

# Enable this script to be executed locally
: ${GITHUB_OUTPUT:=/dev/stdout}
: ${GITHUB_STATE:=/dev/stdout}
: ${GITHUB_STEP_SUMMARY:=/dev/stdout}
: ${GITHUB_ENV:=/tmp/.github-env}

if [[ -n "$GITHUB_ENV" && -f "$GITHUB_ENV" ]]; then
  source "$GITHUB_ENV"
fi

if [ ! -d "$TARGET_DIR" ]; then
    echo "Directory '$TARGET_DIR' not found" >&2
    exit 1
fi

pushd "$TARGET_DIR"

tree >&2

function count_lines {
    echo $(xargs wc --lines | tail -n 1 | awk '{print $1}')
}

case "$IGNORE_RULE" in
    git)
    line_count=$(git ls-files | count_lines)
    ;;
    hidden)
    line_count=$(find . -type f -not -path '*/.*/*' | count_lines)
    ;;
    none)
    line_count=$(find . -type f | count_lines)
    ;;
    *)
    echo "Invalid IGNORE_RULE value. Use 'git', 'hidden', or 'none'" >&2
    exit 1
    ;;
esac

echo $GITHUB_OUTPUT >&2
echo "line_count=$line_count" >> $GITHUB_OUTPUT

popd