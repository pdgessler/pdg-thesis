%%
%% This is file `muthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% muthesis.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2012 by Paul D. Gessler
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.2 of this license or (at your option) any later
%% version. The latest version of this license is in:
%% 
%%   http://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of
%% LaTeX version 1999/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{muthesis}
   [2012/10/19 v1.0 Marquette University Thesis Class]
\newcommand\@ptsize{}
\RequirePackage{setspace}
\RequirePackage{etoolbox}
\newif\if@mainmatter \@mainmattertrue
\DeclareOption{a4paper}{%
  \setlength\paperheight {297mm}%
  \setlength\paperwidth  {210mm}}
\DeclareOption{letterpaper}{%
  \setlength\paperheight {11in}%
  \setlength\paperwidth  {8.5in}}
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
    \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
    }%
    \renewcommand\newblock{\par}
  }
}
\ExecuteOptions{letterpaper,12pt,final}
\ProcessOptions
\input{bk1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\def\ps@myheadings{%
  \let\@oddfoot\@empty\let\@evenfoot\@empty
  \def\@evenhead{\thepage\hfil\slshape\leftmark}%
  \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
  \let\@mkboth\@gobbletwo
  \let\chaptermark\@gobble
  \let\sectionmark\@gobble
}
\def\degree#1{\gdef\@degree{#1}}
\def\degreemo#1{\gdef\@degreemo{#1}}
\def\degreeyr#1{\gdef\@degreeyr{#1}}
\newcommand\maketitle{\begin{singlespace}
  \begin{titlepage}%
    \begin{center}%
      \@title
      \vfill
      by
      \vskip 1em
      \@author
      \vfill
      A Thesis submitted to the Faculty of the Graduate School,\\
      Marquette University,\\
      in Partial Fulfillment of the Requirements for\\
      the Degree of \@degree{}
      \vfill
      Milwaukee, Wisconsin
      \vskip 1em
      \@degreemo~\@degreeyr
    \end{center}
  \end{titlepage}%
  \end{singlespace}
  \setcounter{footnote}{0}%
  \global\let\maketitle\relax
}
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{2}
\newcounter{chapter}
\newcounter{section}[chapter]
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
\renewcommand \thechapter      {\@arabic\c@chapter}
\renewcommand \thesection      {\thechapter.\@arabic\c@section}
\renewcommand \thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand \thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand \theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand \thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}
\newcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}}
\newcommand\mainmatter{%
  \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}}
\newcommand\backmatter{%
  \clearpage
  \@mainmatterfalse}

\newcommand\chapter{
  \clearpage
  \thispagestyle{myheadings}%
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter
}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
  \if@mainmatter
    \refstepcounter{chapter}%
    \typeout{\@chapapp\space\thechapter.}%
    \addcontentsline{toc}{chapter}%
    {\protect\numberline{\thechapter}#1}%
    \else
      \addcontentsline{toc}{chapter}{#1}%
    \fi
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \@makechapterhead{#2}%
  \@afterheading
}
\def\@makechapterhead#1{%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \centering{\@chapapp\space \thechapter}
        \par\nobreak
        \vskip 2em
      \fi
    \fi
    \interlinepenalty\@M
    \centering{\bfseries\uppercase{#1}}\par\nobreak
    \vskip 2em
  }}
\def\@schapter#1{\@makeschapterhead{#1}%
  \@afterheading}
\def\@makeschapterhead#1{%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \centering{\uppercase{#1}}\par\nobreak
    \vskip 2em
  }}
\newcommand\section{\@startsection {section}{1}{\z@}%
  {-3.5ex \@plus -1ex \@minus -.2ex}%
  {2.3ex \@plus.2ex}%
  {\normalfont\normalsize\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  {\normalfont\normalsize\bfseries}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  {\normalfont\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
  {3.25ex \@plus1ex \@minus.2ex}%
  {-1em}%
  {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
  {3.25ex \@plus1ex \@minus .2ex}%
  {-1em}%
  {\normalfont\normalsize\bfseries}}
\setlength\leftmargini  {2.5em}
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\setlength\leftmarginv  {1em}
\setlength\leftmarginvi {1em}
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
  {\list{}{\labelwidth\z@ \itemindent-\leftmargin
    \let\makelabel\descriptionlabel}}
  {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
  \normalfont\bfseries #1}
\newenvironment{abstract}
  {\thispagestyle{empty}
    \begin{singlespace}
    \begin{center}
      ABSTRACT\\
      \@title
      \vskip 2em
      \@author
      \vskip 1em
      Marquette University, \@degreeyr
      \vskip 2em
    \end{center}}
    {\setcounter{page}{0} \end{singlespace}}
\newenvironment{acknowledgments}
  {\addcontentsline{toc}{chapter}{Acknowledgments}
    \begin{singlespace}
    \begin{center}
      ACKNOWLEDGMENTS
      \vskip 2em
      \@author
      \vskip 2em
    \end{center}}
  {\end{singlespace}}
\newenvironment{dedication}
  {\addcontentsline{toc}{chapter}{Dedication}
    \begin{singlespace}
    \begin{center}
      DEDICATION
      \vskip 2em
    \end{center}}
  {\end{singlespace}}
\newenvironment{verse}
  {\let\\\@centercr
    \list{}{\itemsep      \z@
      \itemindent   -1.5em%
      \listparindent\itemindent
      \rightmargin  \leftmargin
      \advance\leftmargin 1.5em}%
    \item\relax}
  {\endlist}
\newenvironment{quotation}
  {\list{}{\listparindent 1.5em%
      \itemindent    \listparindent
      \rightmargin   \leftmargin
      \parsep        \z@ \@plus\p@}%
    \item\relax}
  {\endlist}
\newenvironment{quote}
  {\begin{singlespace}\list{}{\rightmargin\leftmargin}%
    \item\relax}
  {\endlist\end{singlespace}}
\newenvironment{titlepage}
  {\cleardoublepage
    \newpage
    \thispagestyle{empty}%
    \setcounter{page}\@ne}
  {\newpage
    \setcounter{page}\@ne
  }
\newcommand\appendix{\par
  \addcontentsline{toc}{chapter}{APPENDICES}
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
\newcounter{figure}[chapter]
\renewcommand \thefigure
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
  {\@float{figure}}
  {\end@float}
\newenvironment{figure*}
  {\@dblfloat{figure}}
  {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand \thetable
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
  {\@float{table}}
  {\end@float}
\newenvironment{table*}
  {\@dblfloat{table}}
  {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}
\newcommand\tableofcontents{%
  \chapter*{\contentsname}
  \begin{singlespace}
    \@starttoc{toc}
  \end{singlespace}
}
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.4em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      \MakeUppercase{#1}\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\newcommand\listoffigures{%
  \chapter*{\listfigurename}%
  \addcontentsline{toc}{chapter}{\listfigurename}
  \begin{singlespace}
    \@starttoc{lof}
  \end{singlespace}}
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
  \chapter*{\listtablename}%
  \addcontentsline{toc}{chapter}{\listtablename}
  \begin{singlespace}
    \@starttoc{lot}
  \end{singlespace}}
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
  {\chapter*{\bibname}%
    \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
    \list{\@biblabel{\@arabic\c@enumiv}}%
    {\settowidth\labelwidth{\@biblabel{#1}}%
      \leftmargin\labelwidth
      \advance\leftmargin\labelsep
      \@openbib@code
      \usecounter{enumiv}%
      \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \sloppy
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000%
    \sfcode`\.\@m}
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
    \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
  {\twocolumn[\@makeschapterhead{\indexname}]%
    \@mkboth{\MakeUppercase\indexname}%
    {\MakeUppercase\indexname}%
    \thispagestyle{myheadings}\parindent\z@
    \parskip\z@ \@plus .3\p@\relax
    \columnseprule \z@
    \columnsep 35\p@
    \let\item\@idxitem}
  {\clearpage}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
  \parindent 1em%
  \noindent
  \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{\uppercase{Table of Contents}}
\newcommand\listfigurename{\uppercase{List of Figures}}
\newcommand\listtablename{\uppercase{List of Tables}}
\newcommand\bibname{\uppercase{Bibliography}}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\chaptername{\uppercase{Chapter}}
\newcommand\appendixname{\uppercase{Appendix}}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{myheadings}
\raggedbottom
\raggedright
\onecolumn
\setlength{\parindent}{0.5in}
\setlength{\textwidth}{6in}
\setlength{\textheight}{9in}
\setlength{\oddsidemargin}{0.5in}
\setlength{\evensidemargin}{0.5in}
\setlength{\headheight}{1em}
\setlength{\topmargin}{-0.5in}
\addtolength{\topmargin}{-\headheight}
\setlength{\headsep}{0.5in}
\doublespacing
\pretocmd{\@chapter}{\singlespacing}{}{}
\pretocmd{\@sect}{\singlespacing}{}{}
\pretocmd{\@ssect}{\singlespacing}{}{}
\apptocmd{\@chapter}{\doublespacing}{}{}
\apptocmd{\@sect}{\doublespacing}{}{}
\apptocmd{\@ssect}{\doublespacing}{}{}
\endinput
%%
%% End of file `muthesis.cls'.
