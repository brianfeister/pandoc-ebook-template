# Figures

\Blindtext

## Absolute positioning

\Blindtext

\AbsoluteFigure[top=1cm]{example-image-a}
\AbsoluteFigure[left=1cm]{example-image-a}
\AbsoluteFigure[bottom=1cm]{example-image-a}
\AbsoluteFigure[right=1cm]{example-image-a}

\Blindtext\Blindtext

\AbsoluteFigure{example-image-a}
\AbsoluteFigure[top left=1cm and 1cm]{example-image-a}
\AbsoluteFigure[bottom left=1cm and 1cm]{example-image-a}
\AbsoluteFigure[top right=1cm and 1cm]{example-image-a}
\AbsoluteFigure[bottom right=1cm and 1cm]{example-image-a}

\Blindtext

## Floating figures

![Floating figure (free)](example-image-a)

\Blindtext

![Floating figure (free)](example-image-a)

\Blindtext\Blindtext\Blindtext

\FloatingFigure[t]

![Floating figure on top of column](example-image-a)

\Blindtext\Blindtext\Blindtext

\FloatingFigure[h!]

![Floating figure in place (weak)](example-image-a)

\Blindtext\Blindtext\Blindtext

\FloatingFigure[H]

![Floating figure in place (strong)](example-image-a)

\Blindtext\Blindtext\Blindtext

\SpanningFigure

![Spanning figure (free)](example-image-a)

\Blindtext\Blindtext\Blindtext

\SpanningFigure[t]

![Spanning figure on top](example-image-a)

\Blindtext\Blindtext\Blindtext

\SpanningFigure[b]

![Spanning figure on bottom](example-image-a)

\Blindtext\Blindtext\Blindtext

## Pushing figures


\begin{figure*}[t]%\centering
\hspace{\dimexpr\linewidth-1.1\linewidth\relax}
\makebox[\linewidth][l]{\includegraphics[width=1.12\linewidth,height=1in,keepaspectratio=false]{example-image-a}}
\caption{Lol}
\end{figure*}

\Blindtext\Blindtext\blindtext\blindtext\blindtext

\begin{figure}
\hspace{\dimexpr\linewidth-1.1\linewidth\relax}
\makebox[\linewidth][l]{\includegraphics[width=1.1\linewidth]{example-image-a}}
\caption{Lol}
\end{figure}

\Blindtext\Blindtext\blindtext\blindtext

\begin{figure}
%\hspace{\dimexpr\linewidth-1.1\linewidth\relax}
\makebox[\linewidth][l]{\includegraphics[width=1.1\linewidth]{example-image-a}}
\caption{Lol}
\end{figure}

\Blindtext\Blindtext\Blindtext
