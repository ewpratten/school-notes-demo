#! /bin/bash

"${GITHUB_WORKSPACE}/bin/bazel" clean
"${GITHUB_WORKSPACE}/bin/bazel" build //:all

mkdir -p docs

cp -r -v bazel-bin/* ./docs/