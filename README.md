# Demo of my school notetaking & distribution system

Please see [this post](https://retrylife.ca/post/68df02l4) for information. Go to [ewpratten.retrylife.ca/school-notes-demo/](https://ewpratten.retrylife.ca/school-notes-demo/) to see a live demo of the CI pipeline output.

## Usage

The following packages are required on the host system:

```
bazel pandoc pandoc-citeproc texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra tree texlive-bibtex-extra biber
```

Although I mentioned using `rules_pandoc` in my post, this repo does not actually use that ruleset. This is just to keep the example repo as similar to my actual school repo as possible.

All courses can be built by running:

```sh
bazel build //:all
```

## Adding a new course

New courses need their own package (you can just copy another course, and update all the paths in the `BUILD` files), and must have it's base package added to `./BUILD`

## CI

Upon push to the `master` branch, the project will be built, and have its files pushed automatically to the `gh_pages` branch.