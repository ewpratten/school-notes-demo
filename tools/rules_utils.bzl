def concatenate(name, srcs, ext, outname = "out", **kwargs):
    """Concatenate files together"""
    native.genrule(
        name = name,
        srcs = srcs,
        outs = [outname + "." + ext],
        cmd = "cat " + "".join(["$(location " + x + ") " for x in srcs]) + " > $@",
        **kwargs
    )

def ldfile(name, src, **kwargs):
    native.genrule(
        name = name,
        srcs = [src],
        outs = [src],
        cmd = "cat $(location " + src + ")  > $@",
        **kwargs
    )

def createBinIndex(name, srcs, out, **kwargs):
    native.genrule(
        name = name,
        srcs = srcs,
        outs = [out],
        cmd = "tree -H '.' --noreport --charset utf-8 > $@",
        **kwargs
    )

def stripSymbolsFromFile(name, src, out, symstr, **kwargs):
    native.genrule(
        name = name,
        srcs = [src],
        outs = [out],
        cmd = "sed 's|" + symstr + "||g' $(location " + src + ") > $@",
        **kwargs
    )

    # bazel-out/k8-fastbuild/bin
