+++
date = "2023-04-11T00:00:00+01:00"
description = "The Tufte-LATEX document classes define a style similar to the style Edward Tufte uses in his books and handouts. Tufte's style is known for its extensive use of sidenotes, tight integration of graphics with text, and well-set typography. This document aims to be at once a demonstration of the features of the Tufte-LATEX document classes and a style guide to their use."
image = "images/articles/xargs.png"
draft = true
slug = "test-post"
tags = ["UNIX", "Linux"]
title = "On the use of tufte-doc"
+++

## Page Layout

### Headings

This style provides a- and b-heads (that is, `\section` and `\subsection`),
demonstrated above.

If you need more than two levels of section headings, you’ll have to define them
yourself at the moment; there are no pre-defined styles for anything below a
`\subsection`. As Bringhurst points out in _The Elements of Typographic
Style_,<sup>4</sup> you should "use as many levels of headings as you need: no
more, and no fewer."

The Tufte-LATEX classes will emit an error if you try to use \subsubsection and
smaller headings.

<aside>
<cite><sup>4</sup> Robert Bringhurst. <em>The Elements of Typography</em>. Hartley & Marks, 3.1 edition, 2005. ISBN 0-88179-205-5</cite>
</aside>

<span class="uppercase">In his later books</span>,<sup>5</sup> Tufte starts each
section with a bit of vertical space, a non-indented paragraph, and sets the
first few words of the sentence in small caps. To accomplish this using this
style, use the `\newthought` command:

<aside>
<cite><sup>5</sup>Edward R. Tufte. <em>Beautiful Evidence</em>.
Graphics Press, LLC, first edition, May
2006. ISBN 0-9613921-7-7</cite>
</aside>

```latex
\newthought{In his later books}, Tufte starts...
```

### Sidenotes

One of the most prominent and distinctive features of this style is the
extensive use of sidenotes. There is a wide margin to provide ample room for
sidenotes and small figures. Any `\footnotes` will au- tomatically be converted
to sidenotes.<sup>6</sup> If you’d like to place ancillary information in the
margin without the sidenote mark (the superscript number), you can use the
`\marginnote` command.

<aside>
<cite>
<sup>6</sup>This is a sidenote that was entered
using the \footnote command.
</cite>
</aside>

The specification of the \sidenote command is:

```latex
\sidenote[<number>][<offset>]{Sidenote text.}
```

Both the _\<number\>_ and _\<offset\>_ arguments are optional. If you pro- vide
a _\<number\>_ argument, then that number will be used as the sidenote number.
It will change of the number of the current side- note only and will not affect
the numbering sequence of subsequent sidenotes.

Sometimes a sidenote may run over the top of other text or graph- ics in the
margin space. If this happens, you can adjust the vertical position of the
sidenote by providing a dimension in the _\<offset\>_ argu- ment. Some examples
of valid dimensions are:

```latex
1.0in 2.54cm 254mm 6\baselineskip
```

While both the _\<number\>_ and _\<offset\>_ arguments are optional, they must
be provided in order. To adjust the vertical position of the side- note while
leaving the sidenote number alone, use the following syntax:

```latex
\sidenote[][<offset>]{Sidenote text.}
```

The empty brackets tell the `\sidenote` command to use the default sidenote
number. If you only want to change the sidenote number, however, you may
completely omit the hoffseti argument:

````latex
    \sidenote[<number>]{Sidenote text.}

The `\marginnote` command has a similar offset argument:

```latex
\marginnote[<offset>]{Margin note text.}
````

### References

References are placed alongside their citations as sidenotes, as well. This can
be accomplished using the normal `\cite` command.<sup>7</sup>

<aside>
<cite>
<sup>7</sup>The first paragraph of this document
includes a citation.
</cite>
</aside>

The complete list of references may also be printed automatically by using the
`\bibliography` command. (See the end of this document for an example.) If you
do not want to print a bibliography at the end of your document, use the
`\nobibliography` command in its place.

To enter multiple citations at one location,<sup>8</sup> you can provide a list
of keys separated by commas and the same optional vertical offset argument:

<aside>
<cite>Edward R. Tufte. <em>Beautiful Evidence</em> ; and Edward R. Tufte. <em>Envisioning Information</em>. Graphics Press, Cheshire, Connecticut, 1990. ISBN 0-9613921-1-8</cite>
</aside>

```latex
\cite{Tufte2006,Tufte1990}. \cite[hoffseti]{bibkey1,bibkey2,.. . }
```

### Figures and Tables

Images and graphics play an integral role in Tufte’s work. In addition to the
standard `figure` and `tabular environments`, this style provides special figure
and table environments for full-width floats.

Full page–width figures and tables may be placed in `figure*` or `table*`
environments. To place figures or tables in the margin, use the `marginfigure`
or `margintable` environments as follows (see figure 1):

<aside class="two-row">
<figure>
<img src="/images/articles/tufte-box.png" >
<figcaption>
Figure 1: This is a margin figure. The helix is defined by x = cos(2πz), y =
sin(2πz), and z = [0, 2.7]. The figure was drawn using Asymptote
(http://asymptote.sf.net/).
</figcaption>
</figure>
</aside>

foo

```latex
\begin{marginfigure}
    \includegraphics{helix}
    \caption{This is a margin figure.}
    \label{fig:marginfig}
\end{marginfigure}
```

The `marginfigure` and `margintable` environments accept an op-tional parameter
hoffseti that adjusts the vertical position of the figure or table. See the
“Sidenotes” section above for examples. The specifications are:

```latex
\begin{marginfigure}[hoffseti]
...
\end{marginfigure}
\begin{margintable}[hoffseti]
...
\end{margintable}
```

Figure 2 is an example of the figure\* environment and figure 3 is an example of
the normal `figure` environment.

<figure class="two-column">
<img src="/images/articles/tufte-wave.png" >
<figcaption>
Figure 2: This graph shows y = sin x from about x = [−10, 10]. Notice that this figure takes up the full page width.
</figcaption>
</figure>

<figure>
<img src="/images/articles/tufte-boxes.png" >
<figcaption>
Figure 3: Hilbert curves of various
degrees n. Notice that this figure only
takes up the main textblock width.
</figcaption>
</figure>

As with sidenotes and marginnotes, a caption may sometimes require vertical
adjustment. The `\caption` command now takes a second optional argument that
enables you to do this by providing a dimension hoffseti. You may specify the
caption in any one of the following forms:

```latex
\caption{long caption}
\caption[short caption]{long caption}
\caption[][hoffseti]{long caption}
\caption[short caption][hoffseti]{long caption}
```

A positive hoffseti will push the caption down the page. The short caption, if
provided, is what appears in the list of figures/tables, otherwise the “long”
caption appears there. Note that although the arguments hshort captioni and
hoffseti are both optional, they must be provided in order. Thus, to specify an
hoffseti without specifying a hshort captioni, you must include the first set of
empty brackets [], which tell \caption to use the default “long” caption. As an
example, the caption to figure 3 above was given in the form

    \caption[Hilbert curves...][6pt]{Hilbert curves...}

| Margin                      | Length       |
| --------------------------- | ------------ |
| Paper width                 | 8 1/2 inches |
| Paper height                | 11 inches    |
| textblock width             | 6 1/2 inches |
| Textblock / sidenote gutter | 3/8 inch     |
| Sidenote width              | 2 inches     |

<aside>
<cite>
Table 4: Here are the dimensions of
the various margins used in the Tufte-
handout class.
</cite>
</aside>

Occasionally LATEX will generate an error message:

```sh
Error: Too many unprocessed floats
```

LATEX tries to place floats in the best position on the page. Until it’s
finished composing the page, however, it won’t know where those positions are.
If you have a lot of floats on a page (including side-notes, margin notes,
figures, tables, etc.),

LATEX may run out of "slots" to keep track of them and will generate the above
error. LATEX initially allocates 18 slots for storing floats. To work around
this limitation, the Tufte-LATEX document classes provide a \morefloats command
that will reserve more slots.

The first time `\morefloats` is called, it allocates an additional 34 slots. The
second time \morefloats is called, it allocates another 26 slots.

The \morefloats command may only be used two times. Calling it a third time will
generate an error message. (This is because we can’t safely allocate many more
floats or LATEX will run out of memory.)

If, after using the `\morefloats` command twice, you continue to get the Too
many unprocessed floats error, there are a couple things you can do.

The `\FloatBarrier` command will immediately process all the floats before
typesetting more material. Since `\FloatBarrier` will start a new paragraph, you
should place this command at the beginning or end of a paragraph.

The \clearpage command will also process the floats before continuing, but
instead of starting a new paragraph, it will start a new page.

You can also try moving your floats around a bit: move a figure or table to the
next page or reduce the number of sidenotes. (Each sidenote actually uses two
slots.)

After the floats have placed, LATEX will mark those slots as unused so they are
available for the next page to be composed.

### Captions

You may notice that the captions are sometimes misaligned. Due to the way
LATEX’s float mechanism works, we can’t know for sure where it decided to put a
float. Therefore, the Tufte-LATEX document classes provide commands to override
the caption position.

### Full-width text blocks

## Typography

### Typefaces

### Letterspacing

This document class includes two new commands and some im- provements on
existing commands for letterspacing. When setting strings of ALL CAPS or
<span class="uppercase">small caps</span>, the letter- spacing—that is, the
spacing between the letters—should be in- creased slightly.9 The \allcaps
command has proper letterspacing for strings of FULL CAPITALLETTERS , and the
\smallcaps command has letterspacing for small capital letters. These commands
will also automatically convert the case of the text to upper- or lowercase,
respectively.

The \textsc command has also been redefined to include letterspacing. The case
of the \textsc argument is left as is, however. This allows one to use both
uppercase and lowercase letters: The Initial Letters Of The Words In This
Sentence Are Capitalized.
