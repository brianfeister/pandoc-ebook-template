# Overflow

\Blindtext\Blindtext\Blindtext

\FloatingFigure[b]

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
