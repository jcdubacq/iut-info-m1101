\NeedsTeXFormat{LaTeX2e}\relax
\ProvidesClass{iutvexam}[2012/11/01 exam class for J-C Dubacq]
\LoadClass[a4paper]{exam}
\newif\ifprof\proffalse
\edef\myjob{\jobname}
\edef\myjob{\meaning\myjob}
\ifnum\pdfmatch{correction}{\myjob}>0\let\@x\relax\else\let\@x\null\fi
\ifx\@x\relax\proftrue\fi

\ifprof\printanswerstrue\fi
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc} \usepackage{xspace,color}
\usepackage[francais]{babel}
\usepackage{lmodern}
\pagestyle{headandfoot}
\addpoints
\qformat{Question \thequestion: {\bfseries\thequestiontitle}\dotfill\totalpoints}
\renewcommand{\solutiontitle}{\noindent\textbf{Solution:}\par\noindent}
\shadedsolutions

\firstpageheader{IUT Villetaneuse\\\makebox[5cm]{Nom: \hrulefill}}
{M1101: Introduction à l'informatique\\
  \@title}
{\@date\\\makebox[3cm]{Groupe: \hrulefill}}
\runningheader{}{\@title}{}

\footer{\textbf{Modèle \jobname}}%
{Page \thepage\ sur \numpages}%
{\iflastpage{Fin.}{Tournez la page\ldots}}
\long\def\conditions#1{%
\begin{center}
  \fbox{\fbox{\parbox{5.5in}{\centering #1}}}
  \pointtable[h]
\end{center}
\bigskip}
