---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

# layout: home
usemathjax: true
---

{% include mathjax.html %}

# Reconstruction

[![Website](https://img.shields.io/badge/Website-ready-green)](https://hairer.github.io/Reconstruction/) [![Documentation](https://img.shields.io/badge/Documentation-passing-green)](https://hairer.github.io/Reconstruction/docs/) [![Blueprint](https://img.shields.io/badge/Blueprint-WIP-blue)](https://hairer.github.io/Reconstruction/blueprint/)  [![Paper](https://img.shields.io/badge/Paper-WIP-blue)](https://hairer.github.io/Reconstruction/blueprint.pdf) [![Gitpod Ready-to-Code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/hairer/Reconstruction)

Formalisation of the proof of the 'germs' version of the reconstruction theorem.

## Build the Lean files

To build the Lean files of this project, you need to have a working version of Lean.
See [the installation instructions](https://leanprover-community.github.io/get_started.html) (under Regular install).

To build the project, run `lake exe cache get` and then `lake build`.

## Build the blueprint

To build the web version of the blueprint, you need a working LaTeX installation.
Furthermore, you need some packages:

```
sudo apt install graphviz libgraphviz-dev
pip uninstall -y leanblueprint
pip install -r blueprint/requirements.txt
```

To actually build the blueprint, run
```
lake exe cache get
lake build
inv all
```

To view the web-version of the blueprint locally, run `inv serve` and navigate to
`http://localhost:8000/` in your favorite browser.

Or you can just run `inv dev` instead of `inv all` and `inv serve`, after each edit to the LaTeX,
it will automatically rebuild the blueprint, you just need to refresh the web page to see the rendered result.

Note: If you have something wrong in your LaTeX file, and the LaTeX compilation fails,
LaTeX will stuck and ask for commands, you'll need to type `X` then return to exit LaTeX,
then fix the LaTeX error, and run `inv dev` again.
