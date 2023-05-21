\ProvidesClass{resume}[Resume class]

\LoadClass[11pt,letterpaper]{article}

\usepackage[parfill]{parskip}
\usepackage{array}
\usepackage{ifthen}

\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,      
    urlcolor=cyan,
}

\pagestyle{empty}


\def \name#1{\def\@name{#1}}
\def \@name {}

\def \printname {
  \begingroup
    \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
    \nameskip\break
  \endgroup
}


\def \aboutSep {$\diamond$}

\let \@aboutone \relax
\let \@abouttwo \relax
\let \@aboutthree \relax

\def \about #1{
  \@ifundefined{@abouttwo}{
    \def \@abouttwo {#1}
  }{
  \@ifundefined{@aboutthree}{
  \def \@aboutthree {#1}
  }{
     \def \@aboutone {#1}
  }}
}

\def \printAbout #1{
  \begingroup
    \def \\ {\aboutSep\ }
    \centerline{#1}
  \endgroup
  \par
  \aboutskip
}


\let\ori@document=\document
\renewcommand{\document}{
  \ori@document
  \printname
  \@ifundefined{@aboutone}{}{
    \printAbout{\@aboutone}}
  \@ifundefined{@abouttwo}{}{
    \printAbout{\@abouttwo}}
     \@ifundefined{@aboutthree}{}{
    \printAbout{\@aboutthree}}
}

\newenvironment{rSection}[1]
{
  \sectionskip
  \MakeUppercase{\textbf{#1}}
  \sectionlineskip
  \hrule
  \begin{list}{}
  {
    \setlength\leftmargin{0em}
    \setlength\itemsep{0em}
  }
  \item[]
}
{
  \end{list}
}

\def\namesize{\LARGE} % Size of the name at the top of the document
\def\aboutskip{\smallskip} % The space between the two about (or phone/email) lines
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section 
\def\nameskip{\medskip} % The space after your name at the top
\def\sectionskip{\medskip} % The space after the heading section