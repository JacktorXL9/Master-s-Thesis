% vim:syntax=tex

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis92e}[2005/08/02]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions

\LoadClass{report}

%%%%
%
% Layout of the page:
%--------------------
\RequirePackage{geometry}
\geometry{lmargin=1.5in, rmargin=1in,tmargin=1in,bmargin=1in,nohead}

%%%%
%
% Text formatting:
%-----------------

                           % DOUBLE SPACING

% In the Table 3 on [2, p. 53] are recommended values for double
% spacing of lines depending on the point size. The table is not
% implemented in this code, but the only value we give is the one for
% 11pt which was used in my thesis.



\RequirePackage{setspace}
\addtolength{\footnotesep}{\medskipamount} %

\ifcase \@ptsize \relax % 10pt
    \renewcommand\baselinestretch{1.667}
  \or % 11pt
    \renewcommand\baselinestretch{1.618}
  \or % 12pt
    \renewcommand\baselinestretch{1.655}
  \fi

%%%%
%
% Thesis specific macros:
%---

   % \@clearChapterPage

% Clears the last page of previous chapter (this is also true for
% ``PrepageEnvironment'') and properly positions the first page of the
% next chapter (perhaps skipping even page).

\def\@clearChapterPage{%
  \if@openright\cleardoublepage\else\clearpage \fi
}

%
% at cleardoublepage we don't want the possibly skipped even page to
% be numbered (taken from ``ltoutput.dtx''):
\renewcommand{\cleardoublepage}{%
  \clearpage%
  \if@twoside \ifodd\c@page\else \thispagestyle{empty}
    \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi%
  \fi\fi%
}


   % \prepages and \mainbody

\def\prepages{\pagestyle{plain}\pagenumbering{roman}}
\def\mainbody{
  \@clearChapterPage
  \pagenumbering{arabic}
  \pagestyle{plain}
}


%%%%
%
% Special pages of the thesis:
%-----------------------------

                             % TITLE PAGE

\newcommand{\advisor}[1]{\gdef\@advisor{#1}}
\newcommand{\discipline}[1]{\gdef\@discipline{#1}}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\renewcommand{\maketitle}{%
\begin{titlepage}
  \setlength{\parindent}{0pt}
  \let\footnotesize\small      % Local definitions to make \thanks produce
  \let\footnoterule\relax      % \normalsize footnotes with no
                               % separating rule.
  \parbox{\linewidth}{         % Title at the top.
    \begin{center}
      \textbf{\large \@title}
    \end{center}
  }

\vfill

  \parbox{\linewidth}{
    \begin{center}
       By
    \\ ~ \\  \@author
    \end{center}
  }

  \vspace{2\baselineskip}
  
  \parbox{\linewidth}{         % what is this thesis for is in the middle,
    \begin{center}
       A Dissertation
    \\ Submitted to the Faculty of Graduate Studies 
    \\ through the Department of Physics
	\\ in Partial Fulfillment of the Requirements for
    \\ the Degree of Doctor of Philosophy
     \\ at the University of Windsor
    \end{center}
  }

\vspace{3\baselineskip}

  \parbox{\linewidth}{         % what is this thesis for is in the middle,
    \begin{center}
	Windsor, Ontario, Canada
    \end{center}
  }

\vspace{3\baselineskip}

 
\vfill
  
  \parbox{\linewidth}{
    \begin{center}
 2017
    \end{center}
  }

\vspace{2\baselineskip}

  \parbox{\linewidth}{
    \begin{center}
       \textcopyright \number\year, \@author
    \end{center}
  }

  \@thanks
\end{titlepage}
  \setcounter{footnote}{1}       % Footnotes start at zero again.
%  \let\thanks\relax
%  \gdef\@thanks{}\gdef\@author{}\gdef\@title{}\let\maketitle\relax
}% \maketitle
\thispagestyle{empty}

                              % ABSTRACT

\renewenvironment{abstract}{
    \setlength{\parindent}{0pt}
    \@clearChapterPage %
    %\thispagestyle{empty} %
   \null\vfil %
    \parbox{.9\linewidth}{
    \begin{center} 
    	\textbf{\Large Abstract}\\[2\baselineskip]
    %	\MakeUppercase{\normalsize \@title}\\[2\baselineskip]
    \end{center}
  %  \begin{tabular*}{\linewidth}{@{\extracolsep{\fill}}ll}
  %      \@author & Advisor: \\
   %     University of Windsor, \number\year & \@advisor%
   % \end{tabular*}
    }
	%\\*[3\baselineskip]
  }{\par\vfil\null\clearpage}
   % }{\par\vfil\null\clearpage\setcounter{page}{1}}

			    % Acknowledgements
			    
\newenvironment{acknowledgements}{
    \@clearChapterPage%
    \vfill%
    \begin{center}
    	\textbf{\LARGE Acknowledgements}
    \end{center}
    \vspace{\baselineskip}
    \nopagebreak
  }{\par\vfill\clearpage}
  
  			    % Glossary
			    
\newenvironment{glossary222}{
    \@clearChapterPage%
    \vfill%
    \begin{center}
    	\textbf{\LARGE Glossary of Symbols}
    \end{center}
    \vspace{\baselineskip}
    \nopagebreak
  }{\par\vfill\clearpage}
  
    			    % Declaration
			    
\newenvironment{Declaration}{
    \setcounter{page}{3}  
  \@clearChapterPage%
    \vfill%
    \begin{center}
    	\textbf{ \large Declaration of Previous Publication}
    \end{center}
    \vspace{\baselineskip}
    \nopagebreak
  }{\par\vfill\clearpage}
  
      			    % Authorpage
			    
\newenvironment{authorpage}{  
    \@clearChapterPage%
    \vfill%
   % \begin{center}
    	\textbf{\LARGE Vita Auctoris }
    %\end{center}
    \vspace{\baselineskip}
    \nopagebreak
  }{\par\vfill\clearpage}
  
        			    % Authorpage
			    
\newenvironment{approval}{
    \setcounter{page}{0}
    \@clearChapterPage%
    \vfill%
    \vspace{\baselineskip}
    \nopagebreak
  }{\par\vfill\clearpage}

  

			    
                            % BIBLIOGRAPHY

  % Redefine bibliography from report.doc to add a table of
  % contents entry
\def\thebibliography#1{\chapter*{Bibliography\@mkboth
  {BIBLIOGRAPHY}{BIBLIOGRAPHY}}\addcontentsline{toc}{chapter}{Bibliography}\list
  {[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumi}}
    \def\newblock{\hskip .11em plus .33em minus .07em}
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=1000\relax}

\let\endthebibliography=\endlist
