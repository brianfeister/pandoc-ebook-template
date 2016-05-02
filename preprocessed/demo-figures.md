# Figures

\Blindtext

![Floating figure (free)](comune-pv)

## Floating figures

\Blindtext
\Blindtext

![Floating figure (free)](example-image-a)

\Blindtext
\Blindtext

\FloatingFigure[t]

![Floating figure on top of column](example-image-a)

\Blindtext
\Blindtext

\FloatingFigure[h]

![Floating figure in place (weak)](example-image-a)

\Blindtext
\Blindtext

\FloatingFigure[H]

![Floating figure in place (strong)](example-image-a)

\Blindtext
\Blindtext

\SpanningFigure

![Spanning figure (free)](example-image-a)

\Blindtext
\Blindtext

\SpanningFigure[t]

![Spanning figure on top](example-image-a)

\Blindtext
\Blindtext

\SpanningFigure[b]

![Spanning figure on bottom](example-image-a)

\Blindtext
\Blindtext

## Pushing figures

\newsavebox{\mybox}

\Blindtext
\Blindtext

\begin{figure*}[t]
\savebox{\mybox}{\includegraphics{example-image-a}}
\tikz [overlay, remember picture] \node at (current page.north) [anchor=north, inner sep=0] {\usebox{\mybox}};
\vskip\dimexpr\ht\mybox-.5in\relax
\end{figure*}

\Blindtext
\Blindtext

\begin{figure*}[b]
\savebox{\mybox}{\includegraphics{example-image-a}}
\tikz [overlay, remember picture] \node at (current page.south) [anchor=south, inner sep=0] {\usebox{\mybox}};
\vskip\dimexpr\ht\mybox-.5in\relax
\end{figure*}

\Blindtext
\Blindtext

\begin{figure}[t]
\savebox{\mybox}{\includegraphics{example-image-a}}
\tikz [overlay, remember picture] \node at (current page.east) [anchor=east, inner sep=0] {\usebox{\mybox}};
\vskip\dimexpr\textheight-5in\relax
\end{figure}

\Blindtext
\Blindtext

## Absolute positioning

\Blindtext
\Blindtext

\AbsoluteFigure[top=1cm]{example-image-a}
\AbsoluteFigure[left=1cm]{example-image-a}
\AbsoluteFigure[bottom=1cm]{example-image-a}
\AbsoluteFigure[right=1cm]{example-image-a}

\Blindtext
\Blindtext

\AbsoluteFigure{example-image-a}
\AbsoluteFigure[top left=1cm and 1cm]{example-image-a}
\AbsoluteFigure[bottom left=1cm and 1cm]{example-image-a}
\AbsoluteFigure[top right=1cm and 1cm]{example-image-a}
\AbsoluteFigure[bottom right=1cm and 1cm]{example-image-a}

\Blindtext
\Blindtext

