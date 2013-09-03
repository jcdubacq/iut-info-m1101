\newif\ifpoly\polyfalse
\newif\ifexo\exofalse
\newif\ifprof\proffalse
\edef\myjob{\jobname}
\edef\myjob{\meaning\myjob}
\ifnum\pdfmatch{poly}{\myjob}>0\let\@x\relax\else\let\@x\null\fi
\ifx\@x\relax\polytrue\fi
\ifnum\pdfmatch{exo}{\myjob}>0\let\@x\relax\else\let\@x\null\fi
\ifx\@x\relax\exotrue\fi
\ifnum\pdfmatch{prof}{\myjob}>0\let\@x\relax\else\let\@x\null\fi
\ifx\@x\relax\proftrue\exotrue\fi

\NeedsTeXFormat{LaTeX2e}\relax
\ProvidesClass{iutv2013}[2013/09/01 slides class for J-C Dubacq]
\PassOptionsToPackage{francais}{translator}
\PassOptionsToPackage{table}{xcolor}
\PassOptionsToPackage{full}{textcomp}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions
\ifexo
\ifprof
\typeout{PROF}
\else
\typeout{EXO}
\fi
\LoadClass[12pt,landscape]{article}
\usepackage[landscape,a4paper,left=25mm,right=25mm,top=15 mm,bottom=15mm]{geometry}
\else
\ifpoly
\typeout{POLY}
\LoadClass[9pt,mathserif,handout]{beamer}
\else
\typeout{NOPOLY}
\LoadClass[9pt,mathserif]{beamer}
\fi
\fi
\usepackage[T2A,T1]{fontenc}%
\usepackage[utf8]{inputenc}%
\usepackage{arev}
\usepackage{tgtermes,tgadventor}
\usepackage[condensed]{tgheros}
\usepackage{colortbl}%
\usepackage{xcolor,textcomp}
\RequirePackage[francais]{babel}
\usepackage[autolanguage]{numprint}
\usepackage{arabtex}
\newtheorem{methode}{Méthode}
\usepackage{frmath}

\ifexo % WITHOUT BEAMER
\def\mode<#1>{}
\def\setbeamercolor{\@ifstar\@gobbletwo\@gobbletwo}
\usepackage{beamercolorthemesolarized}
\def\subtitle#1{\title{#1}}
\newcommand\institute[2][]{}
\def\beamertitle{\maketitle}
\else % WITH BEAMER
\useoutertheme{infolines}
\useinnertheme{circles}
\setbeamertemplate{blocks}[rounded][shadow=false]
\setbeamercovered{transparent}
\setbeamertemplate{sections in toc}[default]
\setbeamertemplate{subsections in toc}[default]
\setbeamertemplate{enumerate items}[default]
\setbeamertemplate{itemize items}[default]
\ifpoly
\usecolortheme{solarized}
\newcounter{cnt}\setcounter{cnt}{0}
\usepackage{pgfpages}
\def\markit{\pgftransformrotate{90}{\pgftext[base,y=10pt] {\stepcounter{cnt}\insertsubtitle{} --- \Alph{cnt}}}}
\def\markitalso{\pgftransformrotate{90}{\pgftext[y=-380pt] {«~\inserttitle~»}}}
\pgfpagesuselayout{4 on 1}[a4paper,border shrink=6mm,landscape]
\pgfpageslogicalpageoptions{1}{center=\pgfpoint{.25\pgfphysicalwidth+1.8*\pgfpageoptionborder}{.75\pgfphysicalheight-.9*\pgfpageoptionborder}}
\pgfpageslogicalpageoptions{2}{center=\pgfpoint{.75\pgfphysicalwidth-1.8*\pgfpageoptionborder}{.75\pgfphysicalheight-.9*\pgfpageoptionborder}}
\pgfpageslogicalpageoptions{3}{center=\pgfpoint{.25\pgfphysicalwidth+1.8*\pgfpageoptionborder}{.25\pgfphysicalheight+.9*\pgfpageoptionborder}}
\pgfpageslogicalpageoptions{4}{center=\pgfpoint{.75\pgfphysicalwidth-1.8*\pgfpageoptionborder}{.25\pgfphysicalheight+.9*\pgfpageoptionborder}}
\pgfpageslogicalpageoptions{1}{border code=\pgfstroke\markit}
\pgfpageslogicalpageoptions{2}{border code=\pgfstroke\markitalso}
\pgfpageslogicalpageoptions{3}{border code=\pgfstroke}
\pgfpageslogicalpageoptions{4}{border code=\pgfstroke}
\else
\usecolortheme[dark]{solarized}
\fi
\AtBeginSection[]{
  \begin{frame}<handout:0>{Plan}
    \tableofcontents[sectionstyle=show/shaded,subsectionstyle=show/shaded/hide]
  \end{frame} 
  \begin{frame}<presentation:0| handout:1>{\secname}
    \tableofcontents[sectionstyle=hide/hide,subsectionstyle=show/show/hide]
  \end{frame}
}
\AtBeginSubsection[]%
{
  \begin{frame}<handout:0>{Plan}
    \tableofcontents[sectionstyle=show/shaded,subsectionstyle=show/shaded/hide]
  \end{frame}
}
\def\minimaltoc{
  \AtBeginSection[]{
    \begin{frame}<handout:0>{\secname}
      \tableofcontents[sectionstyle=hide/hide,subsectionstyle=show/show/hide]
    \end{frame} 
  }
  \AtBeginSubsection[]{}
}
\def\appendix{
  \minimaltoc
  \section{\appendixname}
}
\newcommand{\beamertitle}{\begin{frame}\titlepage\end{frame}\begin{frame}<beamer
    >{Plan}\tableofcontents\end{frame}}
\fi % WITH/WITHOUT BEAMER

\title{Introduction à l'informatique}
\subtitle{Les bits}
\author{Jean-Christophe Dubacq}%
\institute[IUTV]{IUT de Villetaneuse}%{\includegraphics{img/logo_iut}}
\date{S1 2013}

\usepackage{tikz}%
\usetikzlibrary{snakes,calc,shapes,arrows,mindmap}%
\pgfdeclarelayer{background}%
\pgfsetlayers{background,main}%
\def\dialog#1#2{\rule{0pt}{3ex}\smash{\raisebox{#2}{\includegraphics[height=3.5ex]{img/common/dialog-#1}}}}
\def\cdial#1{\expandafter\def\csname dialog#1\endcsname{\dialog{#1}{-.5ex}}
  \expandafter\def\csname ddialog#1\endcsname{\dialog{#1}{-2.5ex}}}
\cdial{information}
\cdial{question}
\cdial{error}
\cdial{warning}
\cdial{network}
\cdial{system}
\cdial{exercice}
\cdial{home}

\tikzset{globalbg/.style={rounded corners,bottom color=solarizedRebase2,top color=solarizedRebase3}}
\tikzset{labelinfo/.style={color=solarizedRebase03}}
\tikzset{title/.style={anchor=south,font=\large,color=solarizedBlue}}

\usepackage{version}
\ifprof
\newenvironment{correction}%
  {\color[rgb]{0.7,0,0}\ifmmode\else\itshape\fi}{}%
\newenvironment{xcorrection}%
  {\color[rgb]{0.7,0,0}\par\itshape}{}%
\else
\excludeversion{correction}\excludeversion{xcorrection}
\fi

\ifpoly\excludeversion{presentationonly}\else\ifexo\excludeversion{presentationonly}\else\includeversion{presentationonly}\fi\fi
\ifpoly\includeversion{handoutonly}\else\excludeversion{handoutonly}\fi
\ifexo\excludeversion{frame}\includeversion{exercice}
\newenvironment{exercicelet}[1]{\subsubsection{#1}}{}\else%
\newenvironment{exercice}
  {\begin{frame}[fragile,environment=exercice]
  \frametitle{\dialog{exercice}{-1ex} Exercices}}
  {\end{frame}}
\newenvironment{exercicelet}[1]{\begin{block}{#1}}{\end{block}}
\fi
\let\objectif\@gobble
%\newenvironment{student}{}{}%
