load("//tools:rules_pandoc.bzl", "pandoc_paper")

filegroup(
    name = "notes",
    srcs = [
        ":hello_world"
    ],
    visibility = ["//visibility:public"],
)

pandoc_paper(
    name = "hello_world",
    srcs = [
        "hello_world.md",
    ],
    out = "hello_world.pdf",
    args = [
        "--mathjax",
    ],
)
