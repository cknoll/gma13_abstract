%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  LaTeX2e-Klasse fuer Kurzfassungen zu den Vortraegen im Rahmen der 
%%  Workshops der GMA-FA 1.3 und 1.40
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gma}[2017/05/24 v1.1 gma-abstracts]
\def\filedate{2017/05/24}
\def\fileversion{1.1}
\def\fileauthor{Thomas Meurer}
%
\typeout{This is gma.cls, version \fileversion, date \filedate by \fileauthor.} 

\LoadClass[a4paper,12pt]{article}

\RequirePackage[left=2.5cm,right=2.5cm,top=2.5cm, bottom=2cm]{geometry}
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage[numbers]{natbib}

%Processing options
\let\if@langde\iftrue
\DeclareOption{english}{\let\if@langde\iffalse}
\ProcessOptions

% Switch language
\if@langde
\RequirePackage[ngerman]{babel}
\else
\RequirePackage[english]{babel}
\fi

%
%%%%%%%%%%%%%%%%%%%%   Globals   %%%%%%%%%%%%%%%%%%%%%%%%%%
%
\setlength{\parindent}{0mm}
\setlength{\parskip}{1em}

%
%%%%%%%%%%%%%%%%%%%%   Titeldefinitionen  %%%%%%%%%%%%%%%%%%%%%%%%%%
%
\def\@titel{}
\def\titel#1{\gdef\@titel{#1}}
\def\@erstautor{}
\def\erstautor#1{\gdef\@erstautor{#1}} 
\def\@vortragender{}
\def\vortragender#1{\gdef\@vortragender{#1}} 
\def\@mitautoren{}
\def\mitautoren#1{\gdef\@mitautoren{#1}} 
\def\@adresse{!! ADD !!}
\def\adresse#1{\gdef\@adresse{{\footnotesize #1}}}

\renewcommand{\maketitle}{%
\thispagestyle{plain}
\begin{center}
  {\normalsize 
    {\large \@titel \par}%

    \begin{tabular}{c}%
      \ifx \@erstautor \@empty
      {}
      \else
      {\bf \@erstautor,~}
      \fi
      \ifx \@mitautoren \@empty
      {\bf \underline{\@vortragender}} 
      \else
      {\bf \underline{\@vortragender},~\@mitautoren} 
      \fi
    \end{tabular}

    \begin{minipage}{0.9\textwidth}
    {\@adresse} 
    \end{minipage}
    \vspace{0.5em}
  }%
\end{center}
}% 

%
%%%%%%%%%%%%%%%%%%%% Bibliografie  %%%%%%%%%%%%%%%%%%%%%%%%%%
\if@langde
\bibliographystyle{plainnat_german}
\else
\bibliographystyle{plainnat}
\fi


% %%%%%%%%%%%%%%%%%%%%%   Layout   %%%%%%%%%%%%%%%%%%%%%%%%%%
\pagestyle{empty}
\let\ps@plain\ps@empty %for first page

% %%%%%%%%%%%%%%%%%%%%%    Misc    %%%%%%%%%%%%%%%%%%%%%%%%%%
\def\BibTeX{{\rm B\kern-.05em{\sc i\kern-.025em b}\kern-.08em
    \TeX}}
\def\BibLaTeX{{\rm B\kern-.05em{\sc i\kern-.025em b}\kern-.08em
    \LaTeX}}