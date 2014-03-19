%% Copyright (C) 2014 by Paul D. Gessler
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
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mugsthesis}
  [2014/03/16 v1.1 Marquette University Graduate School Thesis Class]

\RequirePackage{etoolbox} % for patching commands

\newbool{indentfirst}

% only allow explicitly-defined options
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{memoir}}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{memoir}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{memoir}}
\DeclareOption{final}{\PassOptionsToClass{final}{memoir}}
\DeclareOption{draft}{\PassOptionsToClass{draft}{memoir}}
\DeclareOption{indentfirsttrue}{\booltrue{indentfirst}}
\DeclareOption{indentfirstfalse}{\boolfalse{indentfirst}}
\DeclareOption*{% ignore anything we don't want the user to be changing
  \ClassWarning{mugsthesis}{Unknown option `\CurrentOption' ignored}%
}

\ExecuteOptions{12pt,final,indentfirsttrue} % default options
\ProcessOptions\relax % process author options

\ifbool{indentfirst}{\RequirePackage{indentfirst}}{}

\LoadClass[letterpaper,oneside]{memoir} % load the `memoir' class

% set the line spacing and justification
\DoubleSpacing
\raggedright
\flushbottom % gives too many underfull vboxes at moment; TODO find better solution

% set the page layout
\setlrmarginsandblock{1.5in}{1.0in}{*}
\setulmarginsandblock{1.0in}{1.0in}{*}
\setheaderspaces{0.5in}{*}{*}
\marginparmargin{left} % use the wider (left) margin for notes
\setmarginnotes{0.125in}{1.25in}{\baselineskip}
\checkandfixthelayout[lines]

% set paragraph indentation
\setlength\parindent{0.5in}

% define and use the MUGS pagestyle
\makepagestyle{mugs}
\makeevenhead{mugs}{}{}{\thepage}
\makeoddhead{mugs}{}{}{\thepage}
\aliaspagestyle{chapter}{mugs} % alias so chapter opening pages match our style
\pagestyle{mugs}

% title page information
\newcommand{\degree}[1]{\def\mugsdegree{#1}}
\newcommand{\degreemo}[1]{\def\mugsdegreemo{#1}}
\newcommand{\degreeyr}[1]{\def\mugsdegreeyr{#1}}
\renewcommand{\title}[1]{\def\@title{\uppercase{#1}}}

% title page layout
\renewcommand{\maketitle}{{%
  \cleardoublepage
  \pagenumbering{Alph}
  \SingleSpace
  \thispagestyle{empty}
  \centering
  \@title
  \vfill
  by
  \vskip \onelineskip
  \@author
  \vfill
  A Thesis submitted to the Faculty of the Graduate School,\\
  Marquette University,\\
  in Partial Fulfillment of the Requirements for\\
  the Degree of \mugsdegree{}
  \vfill
  Milwaukee, Wisconsin
  \vskip \onelineskip
  \mugsdegreemo~\mugsdegreeyr
  \clearpage
}}

% set the abstract according to the directives
\renewenvironment{abstract}{%
  \thispagestyle{empty}
  \begin{SingleSpace}
  \begin{center}
    ABSTRACT\\
    \@title
    \vskip 2\onelineskip
    \@author
    \vskip \onelineskip
    Marquette University, \mugsdegreeyr
    \vskip 2\baselineskip 
  \end{center}
  \@afterindentfalse\@afterheading
}{
  \end{SingleSpace}\setcounter{page}{0}
}

% define some additional optional environments
\newenvironment{acknowledgments}{%
  \addcontentsline{toc}{chapter}{ACKNOWLEDGMENTS}
  \chapter*{Acknowledgments}
  \begin{SingleSpace}
  \begin{center}
    \vskip -1\onelineskip
    \@author
    \vskip 2\onelineskip
  \end{center}
  \@afterindentfalse\@afterheading
}{\end{SingleSpace}}
\newenvironment{dedication}{%
  \addcontentsline{toc}{chapter}{DEDICATION}
  \chapter*{Dedication}
  \begin{SingleSpace}
  \@afterindentfalse\@afterheading
}{\end{SingleSpace}}

\newsubfloat{figure}
\newsubfloat{table}
\setcounter{lofdepth}{2}
\setcounter{lotdepth}{2}
\subcaptionsize{\small}

% define and use the MUGS chapter style
\makechapterstyle{mugs}{%
  \setlength{\midchapskip}{0.5\onelineskip}
  \setlength{\afterchapskip}{\onelineskip}
  \renewcommand*{\chapterheadstart}{}
%  \renewcommand*{\afterchaptertitle}{\end{SingleSpace}}
  \renewcommand*{\chaptitlefont}{\bfseries}
  \renewcommand*{\printchaptername}{\centering \MakeTextUppercase{\@chapapp}}
  \renewcommand*{\printchapternum}{\thechapter}
  \renewcommand*{\printchaptertitle}[1]{%
    \SingleSpacing \protect\parbox{\textwidth}{\centering \chaptitlefont \MakeTextUppercase{##1}}
  }
}% end{mugs}
\chapterstyle{mugs}

% put the LoT and LoF on their own pages
\pretocmd{\listoftables}{\clearforchapter}{}{%
  \ClassWarning{mugsthesis}{Patching `\noexpand\listoftables' failed}
}
\pretocmd{\listoffigures}{\clearforchapter}{}{%
  \ClassWarning{mugsthesis}{Patching `\noexpand\listoffigures' failed}
}

% style the ToC, LoT, LoF, and bib
\renewcommand*{\contentsname}{TABLE OF CONTENTS}
\renewcommand*{\listtablename}{LIST OF TABLES}
\renewcommand*{\listfigurename}{LIST OF FIGURES}
\renewcommand*{\bibname}{BIBLIOGRAPHY}
\setlength{\bibitemsep}{\onelineskip}
\renewcommand*{\biblistextra}{%
  \setlength{\leftmargin}{0.375in}% hanging indent
  \setlength{\itemindent}{\labelwidth}%
  \addtolength{\itemindent}{\labelsep}    
  \addtolength{\itemindent}{-\leftmargin}    
}
\renewcommand*{\prebibhook}{\SingleSpacing}

% do not place an entry for the ToC within the ToC
\pretocmd{\tableofcontents}{\begin{KeepFromToc}}{}{%
  \ClassWarning{mugsthesis}{Patching `\noexpand\tableofcontents' failed; use `\noexpand\tableofcontents*' instead}
}
\apptocmd{\tableofcontents}{\end{KeepFromToc}}{}{%
  \ClassWarning{mugsthesis}{Patching `\noexpand\tableofcontents' failed; use `\noexpand\tableofcontents*' instead}
}

% set ToC, LoT, and LoF indents
\setlength{      \cftchapterindent}{0.0in}
\setlength{      \cftsectionindent}{0.5in}
\setlength{   \cftsubsectionindent}{1.0in}
\setlength{\cftsubsubsectionindent}{1.5in}
\setlength{    \cftparagraphindent}{2.0in}
\setlength{ \cftsubparagraphindent}{2.5in}
\setlength{        \cfttableindent}{0.0in}
\setlength{     \cftsubtableindent}{0.5in}
\setlength{       \cftfigureindent}{0.0in}
\setlength{    \cftsubfigureindent}{0.5in}

% ragged right ToC, LoT, and LoF entries
\setrmarg{3.55em plus 1fil}
\setlength{\cftbeforechapterskip}{\onelineskip}
\setlength{\cftbeforesectionskip}{\onelineskip}
\setlength{\cftbeforesubsectionskip}{\onelineskip}
\setlength{\cftbeforesubsubsectionskip}{\onelineskip}
\setlength{\cftbeforeparagraphskip}{\onelineskip}
\setlength{\cftbeforesubparagraphskip}{\onelineskip}
\setlength{\cftbeforetableskip}{\onelineskip}
%\setlength{\cftbeforesubtableskip}{\onelineskip}
\setlength{\cftbeforefigureskip}{\onelineskip}
%\setlength{\cftbeforesubfigureskip}{\onelineskip}
\renewcommand{\insertchapterspace}{}

% switch to single spacing
\renewcommand{\aftertoctitle}{\aftergroup\SingleSpacing}
\renewcommand{\afterlottitle}{\aftergroup\SingleSpacing}
\renewcommand{\afterloftitle}{\aftergroup\SingleSpacing}

% style the chapter headings
\renewcommand{\cftchapterfont}{\normalfont}
\renewcommand{\cftchapterleader}{\cftsectionleader}
\renewcommand{\cftchapterpagefont}{\normalfont}
\AtEndPreamble{\providecommand{\texorpdfstring}[2]{#1}}
\settocpreprocessor{chapter}{%
\let\tempf@rtoc\f@rtoc%
\def\f@rtoc{%
\texorpdfstring{\MakeTextUppercase{\tempf@rtoc}}{\tempf@rtoc}}%
}

% set spacing in quot{e,ation} environments
\AtBeginEnvironment{quote}{\par\SingleSpacing}
\AtBeginEnvironment{quotation}{\par\SingleSpacing}

% set sectional unit numbering levels and ToC depth
\maxsecnumdepth{subsection}
\settocdepth{subsection}

% style lower-level headings
\setsecheadstyle{\bfseries\SingleSpacing}
\setsubsecheadstyle{\bfseries\SingleSpacing}
\setsubsubsecheadstyle{\bfseries\SingleSpacing}

% caption justification
%\precaption{\raggedright}
%\captionstyle{\raggedright}
