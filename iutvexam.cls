\NeedsTeXFormat{LaTeX2e}\relax
\ProvidesClass{JCexam}[2012/11/01 exam class for J-C Dubacq]
\LoadClass[a4paper]{exam}
\def\myjob{correction}
\edef\myjob{\meaning\myjob}
\edef\tmpjob{\jobname}
\edef\tmpjob{\meaning\tmpjob}
\ifx\myjob\tmpjob\printanswerstrue\fi
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc} \usepackage{xspace,color}
\usepackage[francais]{babel}
\usepackage{lmodern}
\pagestyle{headandfoot}
\addpoints
\qformat{Question \thequestion: {\bfseries\thequestiontitle}\dotfill\thepoints}
\renewcommand{\solutiontitle}{\noindent\textbf{Solution:}\par\noindent}
\shadedsolutions

\firstpageheader{IUT Villetaneuse\\\makebox[5cm]{Nom: \hrulefill}}
{Architecture des ordinateurs\\
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
