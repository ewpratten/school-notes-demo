def pandoc(name, srcs, outs, args = [], templates = [], assets = [], bibliographies = [], csls = [], **kwargs):
    """Generate pandoc outputs"""

    # Generate the command
    cmd = ["pandoc"]
    cmd.append(" ".join(["$(locations " + x + ")" for x in srcs]))
    cmd.append(" ".join(["-o $(location " + x + ")" for x in outs]))
    cmd.append(" ".join([arg for arg in args]))
    cmd.append(" ".join(["--bibliography $(location " + bib + ")" for bib in bibliographies]))
    cmd.append(" ".join(["--csl $(location " + csl + ")" for csl in csls]))
    cmd.append("--filter pandoc-citeproc")

    # Run the rule
    native.genrule(
        name = name,
        srcs = assets + srcs + templates + bibliographies + csls,
        outs = outs,
        cmd = "HOME=~ " + " ".join(cmd),
        **kwargs
    )

def pandoc_paper(name, srcs, out, args = [], assets = [], **kwargs):
    pandoc(
        name = name,
        srcs = srcs,
        assets = assets,
        outs = [
            out,
        ],
        args = [
            "--toc",
            "--standalone",
            "--data-dir ./pandoc",
            "--template eisvogel.tex",
            "--listings",
            "--highlight-style pygments",
        ] + args,
        templates = ["//pandoc"],
        **kwargs
    )

# Name binding
pandoc_templ = pandoc_paper


def pandoc_presentation(name, srcs, out, args = [], assets = [], **kwargs):
    pandoc(
        name = name,
        srcs = srcs,
        assets = assets,
        outs = [
            out,
        ],
        args = [
            "--toc",
            "--standalone",
            "--data-dir ./pandoc",
            "--template eisvogel.tex",
            "--listings",
            "--highlight-style pygments",
        ] + args,
        templates = ["//pandoc"],
        **kwargs
    )