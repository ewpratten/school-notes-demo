load("//tools:rules_utils.bzl", "createBinIndex", "stripSymbolsFromFile")

# Add all your courses here
allsrcs = [
    "//example_course",
]

# This is the :all file listing
# This can be wrapped in a rules_pkg rule to distribute the entire project as a ZIP or TAR file if needed
filegroup(
    name = "all",
    srcs = allsrcs + [
        ":directory_listing",
    ],
)

# This will strip the base path from all links in the generated index.html file
stripSymbolsFromFile(
    name = "directory_listing",
    src = ":directory_listing_raw",
    out = "index.html",
    symstr = "bazel-out/k8-fastbuild/bin",
)

# This will use tree -H to generate an index.html file
createBinIndex(
    name = "directory_listing_raw",
    srcs = allsrcs,
    out = "directory.html",
)
