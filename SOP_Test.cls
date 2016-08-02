% SOP Template Document Class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{SOP2}[2016/07/31 v0.3 Modified article class for standard operating procedures]
% http://stackoverflow.com/questions/581916/how-do-you-extend-article-document-class-in-latex

% Passes and class options to the underlying article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}

% Redefine the page margins
\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}

% Modifications to the section titles
\RequirePackage{titlesec}
%\renewcommand{\thesection}{\Roman{section}}

\titleformat{\section}{\normalfont\bfseries}{\makebox[2em][l]{\thesection{}.}}{0pt}{}

% Subsection Option
\titleformat{\subsection}{\normalfont\bfseries}{}{0pt}{}
\titleformat{\subsection}{\normalfont\bfseries}{\makebox[2em][l]{\thesubsection{}.}}{0pt}{}

% Create Numbered Paragraphs for Each Section

%\setlegth{\hangindent=0.7cm} % Paragraphs w/hanging indent
\newenvironment{poemcontent}{\everypar{\hangafter=1 \setlength{\hangindent}{2em}}}{\par}

% Create Numbered Paragraphs for Each Section
\newcounter{paranum}[section] 
\renewcommand{\theparanum}{\thesection.\arabic{paranum}} 
\newcommand{\NP}{\vspace{10pt}\noindent\refstepcounter{paranum}\textbf{\theparanum}\[2em] }

\def\D{\par\noindent\makebox[0em][l]{\refstepcounter{paranum}}\textbf{\theparanum}\hangindent2em}

% Modification of title block
\RequirePackage{titling}
\RequirePackage{multirow}
\newcommand{\approved}[1]{\newcommand{\theapproved}{#1}}
\newcommand{\SOPno}[1]{\newcommand{\theSOPno}{#1}}
% Ref: http://tex.stackexchange.com/questions/3988/titlesec-versus-titling-mangling-thetitle
\let\oldtitle\title
\renewcommand{\title}[1]{\oldtitle{#1}\newcommand{\mythetitle}{#1}}
\renewcommand{\maketitle}{%
\begin{tabular}{|c|p{2in}|l|l|} \hline
\multirow{3}{*}{\includegraphics[width=2cm]{../pomona.jpg}} & \multicolumn{1}{p{2.5in}|}{\centering Environmental Analysis Teaching and Research Laboratory} & Date: \thedate & Number: \theSOPno \\ \cline{2-4}
& \multicolumn{1}{p{2.5in}|}{\centering Standard Operating Procedure } & \multicolumn{2}{p{2.5in}|}{Title: \mythetitle} \\ \cline{2-4}
& Approved By: \theapproved & \multicolumn{2}{l|}{Revision Date: \quad / \quad / \quad} \\ \hline
\end{tabular}
}

% For "Page N of M"
\RequirePackage{lastpage}
% For easier construction of page headers/footers
\RequirePackage{fancyhdr}
\fancypagestyle{plain}{ % for first page
\fancyhf{}
\fancyfoot[L]{\framebox{Author: \theauthor}\\ \jobname{}.tex} 
\fancyfoot[R]{\framebox{Page: \thepage{} of \pageref*{LastPage}}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}

\pagestyle{fancy} % for other pages
\fancyhf{}
\fancyhead[R]{%
\begin{tabular}{|c|c|} \hline %
Revision Date: & Number: \\
\quad / \quad / \quad & \\ \hline
\end{tabular}%
}
\fancyfoot[L]{\framebox{Author: \theauthor}}
\fancyfoot[R]{\framebox{Page: \thepage{} of \pageref*{LastPage}}} % \pageref* if we use hyperref, \pageref otherwise
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% For easier customization of itemized, enumerated, and other lists
\RequirePackage{enumitem}
% For hyperlinked cross-references
\RequirePackage{hyperref}
% Ensure first page is correct style
\thispagestyle{plain}
% That's all, folks!
\endinput