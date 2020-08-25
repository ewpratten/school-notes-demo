---
title: Hello World
author: Evan Pratten
date: 2020-08-25
titlepage: false
toc: false
colorlinks: true
header-includes: | 
 \usepackage{tikz}
 \usetikzlibrary{positioning}
 \usetikzlibrary{arrows}
---

# Hello World

This is an example note from an "example course". All normal markdown things will work in these documents (thanks pandoc). Like **this**.

 - Lists
 - Work
 - Too!

| Section 1 | Section 2                |
|-----------|--------------------------|
| You can   | Also do tables like this |

Importantly, you can embed math into the document:

$$
y=mx+b
$$

I used the `mblk` macro defined in `.vscode/markdown.code-snippets` to create that.

Inline math works too: $\begin{smallmatrix} a \\ b \\ c \end{smallmatrix}

If you need a graph, you can use the `graph2d` macro. I used it to generate figure \ref{fig:example_graph}

\begin{figure}
\centering
\begin{tikzpicture}

% Grid
\draw[thin,gray!40] (-5,-5) grid (5,5);
\draw[<->] (-5,0)--(5,0) node[right]{$x$};
\draw[<->] (0,-5)--(0,5) node[above]{$y$};

% Vectors
\draw[line width=2pt,blue,-stealth](0,0)--(1,1) node[anchor=south west]{$\boldsymbol{\vec{v}}$};

\end{tikzpicture}
\caption{This is an example graph}
\label{fig:example_graph}
\end{figure}

The possibilities are endless.