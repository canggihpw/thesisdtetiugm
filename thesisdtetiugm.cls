%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Filename: thesisdtetiugm.cls
%%%  Class File  for Master Thesis at DTETI UGM
%%%  --- 
%%%  Written by Canggih Puspo Wibowo
%%%  [canggihpw@gmail.com]
%%%  ---
%%%  This class file can be freely modified
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%======================================
%% Identification
%======================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesisdtetiugm}[2018/02/08]

%======================================
%% Initial Code
%======================================
\RequirePackage[english,bahasa]{babel} % language
\RequirePackage{etoolbox}% conditional statement
\RequirePackage{indentfirst}
\RequirePackage{setspace}
\RequirePackage{times}% font
\RequirePackage[T1]{fontenc}% quotation
\RequirePackage{graphicx}
\RequirePackage{calc}%Simple arithmetic lib



%======================================
%% Option Declaration
%======================================
\newtoggle{lang}
\DeclareOption{bahasa}{\toggletrue{lang}}
\DeclareOption{english}{\togglefalse{lang}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}  % pass any unknown option to the report class


%======================================
%% Option Execution
%======================================
\ExecuteOptions{bahasa} % set default language
\ProcessOptions


%======================================
%% Class & Package Loading
%======================================
\LoadClass[12pt]{report}  % this class is based on the report class
\usepackage{geometry}% easy layouting
\usepackage{hyperref}% hyperlink
\usepackage{tocloft}% edit font toc
\usepackage{fancyhdr}% page number
\usepackage[cmex10]{amsmath}
\usepackage{cite}
\usepackage{multirow}
\usepackage{titlesec}
\usepackage{ragged2e}% text alignment
\usepackage{algorithm}
\usepackage{algpseudocode}
\usepackage{listings}
\usepackage{color}
\usepackage{url}
\bibliographystyle{IEEEtran}


%======================================
%% Localise the Strings
%======================================
\iftoggle{lang}{
	% define new commands in bahasa
	\newcommand{\listappendixname}{DAFTAR LAMPIRAN}%
	\newcommand{\nomenclaturename}{ARTI LAMBANG DAN SINGKATAN}%
	\newcommand{\acknowledgmentname}{HALAMAN PERSEMBAHAN}%
	\newcommand{\approvalname}{HALAMAN PENGESAHAN}
	\newcommand{\statementname}{PERNYATAAN}
	\AtBeginDocument{% select the language
		\selectlanguage{bahasa}
	}
}{
	% define new commands in english
	\newcommand{\listappendixname}{LIST OF APPENDICES}%
	\newcommand{\nomenclaturename}{NOMENCLATURE AND ABBREVIATION}%
	\newcommand{\approvalname}{APPROVAL}
	\newcommand{\statementname}{STATEMENT}
	\AtBeginDocument{% select the language
		\selectlanguage{english}
	}
}

% redefine commands in babel bahasa
\addto\captionsbahasa{%
	\renewcommand{\prefacename}{PRAKATA}%
	\renewcommand{\contentsname}{DAFTAR ISI}%
	\renewcommand{\listfigurename}{DAFTAR GAMBAR}%
	\renewcommand{\listtablename}{DAFTAR TABEL}%
	\renewcommand{\abstractname}{Intisari}%
	\renewcommand{\partname}{BAGIAN}%
	\renewcommand{\chaptername}{BAB}%
	\renewcommand{\appendixname}{LAMPIRAN}%
	\renewcommand{\refname}{DAFTAR PUSTAKA}%
	\renewcommand{\bibname}{DAFTAR PUSTAKA}%
	\renewcommand{\indexname}{Indek}%
	\renewcommand{\figurename}{Gambar}%
	\renewcommand{\tablename}{Tabel}%
	\renewcommand{\pagename}{Halaman}%
}

% redefine commands in babel english
\addto\captionsenglish{%
	\renewcommand{\prefacename}{PREFACE}%
	\renewcommand{\contentsname}{CONTENTS}%
	\renewcommand{\listfigurename}{LIST OF FIGURES}%
	\renewcommand{\listtablename}{LIST OF TABLES}%
	\renewcommand{\abstractname}{\emph{Abstract}}%
	\renewcommand{\partname}{PART}%
	\renewcommand{\chaptername}{CHAPTER}%
	\renewcommand{\appendixname}{APPENDIX}%
	\renewcommand{\refname}{REFERENCES}%
	\renewcommand{\bibname}{REFERENCES}%
	\renewcommand{\indexname}{Index}%
	\renewcommand{\figurename}{Figure}%
	\renewcommand{\tablename}{Table}%
	\renewcommand{\pagename}{Page}%
}

%======================================
%% General Page Layout
%======================================
\geometry{
	a4paper,
	papersize={21cm,29.7cm},
	top=4cm,
	left=4cm,
	right=3cm,
	bottom=3cm
}
\setlength{\parindent}{1.25cm}
\setlength{\parskip}{6pt}
\setlength{\footskip}{1.5cm} 
\setlength{\topskip}{1ex}


%======================================
%%  Information Setup
%======================================
% Author info
\renewcommand*{\author}[2]{
	\newcommand{\@authorName}{#1} 
	\newcommand{\@authorID}{#2}
}
% Thesis info
\renewcommand*{\title}[1]{\renewcommand{\@title}{#1}}
% Exam info
\newcommand*{\degree}[1]{\newcommand{\@degree}{#1}}
\newcommand*{\program}[3]{
	\newcommand{\@program}{#1}
	\newcommand{\@programcoorName}{#2}
	\newcommand{\@programcoorNIP}{#3}
}
% Exam info
\newcommand*{\examdate}[1]{\newcommand{\@examdate}{#1}}
\newcommand*{\approvaldate}[1]{\newcommand{\@approvaldate}{#1}}
\newcommand*{\yearsubmit}[1]{\newcommand{\@yearsubmit}{#1}}
\newcommand*{\committee}[2]{
	\newcommand{\@firstcommittee}{#1}
	\newcommand{\@secondcommittee}{#2}	
}
% Supervisors info
\newcommand*{\firstsupervisor}[1]{
	\newcommand{\@firstsupervisorName}{#1}
}
\newcommand*{\secondsupervisor}[1]{
	\newcommand{\@secondsupervisorName}{#1}
}
% Department info
\newcommand{\@university}{Universitas Gadjah Mada}
\newcommand{\@facultyIna}{Fakultas Teknik}
\newcommand{\@facultyEng}{Faculty of Engineering}
\newcommand{\@departmentIna}{Departemen Teknik Elektro dan Teknologi Informasi}
\newcommand{\@departmentEng}{Department of Electrical Engineering and Information Technology}
\newcommand{\@graduateIna}{Program Pascarjana}
\newcommand{\@graduateEng}{Graduate Program}
\newcommand*{\major}[1]{\newcommand{\@major}{#1}}
\newcommand*{\departmenhead}[2]{
	\newcommand{\@depheadName}{#1}
	\newcommand{\@depheadNIP}{#2}
}
\newcommand{\@city}{Yogyakarta}


%======================================
%% Cover Page
%======================================
\newcommand{\printcover}[1]{
	\newgeometry{left=3cm,top=3cm,bottom=3cm,right=3cm}
	\thispagestyle{empty}%
	\setcounter{page}{1}
	\pagenumbering{roman}
	\begin{center}
		\begin{singlespacing}
			\MakeUppercase{\fontsize{14pt}{16pt}\selectfont\@title}\\
			\vspace{1.5cm}
			\textbf{\iftoggle{lang}{Tesis}{Thesis}}\\
			\vspace{1cm}
			\iftoggle{lang}
				{untuk memenuhi bagian persyaratan \\ mencapai derajat Sarjana S-2}
				{submitted in partial fulfillment of the requirements \\ for the degree of master}\\
			\vspace{12pt}
			\iftoggle{lang}
				{Program Studi \@program} 
				{\@program \vspace{1em} Program}\\
			\@major \\
			\iftoggle{lang}{\@departmentIna}{\@departmentEng} \\
			\vspace{1cm}
			\vfill
			\includegraphics[width=0.5\textwidth]{#1}
			\vfill
			\iftoggle{lang}
				{diajukan oleh}
				{proposed by}\\\vspace{0.4em}
			\textbf{\@authorName \\ \@authorID \\}
			\vspace{1cm}
			\vfill
			\iftoggle{lang}{Kepada}{To}\\
			\vspace{0.4em}
			\textbf{
				\iftoggle{lang}{\MakeUppercase{\@graduateIna}}{\MakeUppercase{\@graduateEng}} \\ 
				\iftoggle{lang}{\MakeUppercase{\@facultyIna}}{\MakeUppercase{\@facultyEng}} \\ 
				\MakeUppercase{\@university} \\ 
				\MakeUppercase{\@city} \\ 
				\@yearsubmit	
			}
		\end{singlespacing}
	\end{center}
}

%======================================
%% Approval Page
%======================================
\newcommand{\printapproval}{
%	\chapter*{\approvalname}%
	\fancyhf{}
	\fancyfoot[C]{\thepage}
	\begin{center}
		\begin{singlespacing}
			\textbf{\iftoggle{lang}{TESIS}{THESIS}}\\
			\vspace{1em}
			\MakeUppercase{\bfseries\fontsize{14pt}{16pt}\selectfont\@title}\\
			\vspace{1cm}
			\iftoggle{lang}{Dipersiapkan dan disusun oleh}{Written by}\\
			\vspace{1em}
			\textbf{\underline{\@authorName} \\ \@authorID \\}
			\vspace{1em}
			\iftoggle{lang}
				{Telah dipertahankan di depan dewan penguji}
				{Has been presented} \\
			\iftoggle{lang}
				{Pada tanggal: \@examdate} 
				{on \@examdate}\\
			\iftoggle{lang}
				{\textbf{Susunan Dewan Penguji}}
				{\textbf{Thesis Committee}}\\
			
			\begin{center}
				\begin{tabular}{ccc}
					\iftoggle{lang}{Pembimbing I}{Supervisor I} &\hspace{2cm} & \iftoggle{lang}{Anggota Dewan Penguji Lain}{Committee} \\
					\vspace{0.3cm} & \vspace{0.3cm} & \vspace{0.3cm}\\
					\textbf{\underline{\@firstsupervisorName}}& &
					\textbf{\underline{\@firstcommittee}} \\
					\iftoggle{lang}{Pembimbing II}{Supervisor II} &\hspace{2cm} &   \\
					\vspace{0.3cm} & \vspace{0.3cm} & \vspace{0.3cm}\\
					\textbf{\underline{\@secondsupervisorName}}& &
					\textbf{\underline{\@secondcommittee}} \\
				\end{tabular}
			\end{center}
			\vspace{0.5cm}
			
			\iftoggle{lang}
				{Tesis ini telah diterima sebagai salah satu persyaratan \\ untuk memperoleh gelar Magister} 
				{This thesis has been accepted as a partial fulfillment \\ for the degree of Master}\\
			\vspace{0.5cm}
			
			\iftoggle{lang}{Tanggal:}{Date: $\ldots\ldots$} \\
			\iftoggle{lang}
				{Pengelola Program Studi \@program} 
				{Program Coordinator of \@program}\\
			\vspace{1.5cm}
			\textbf{\underline{\@programcoorName}}\\
			NIP. \@programcoorNIP \\
			\vspace{1cm}
			
			\iftoggle{lang}{Mengetahui,\\}{} 
			\iftoggle{lang}
				{Ketua Departemen/Wakil Penanggung Jawab Program Studi}
				 {Head of Department}\\
			\iftoggle{lang}{\@departmentIna}{\@departmentEng}\\
			\vspace{1.5cm}
			\textbf{\underline{\@depheadName}}\\
			NIP. \@depheadNIP \\
			
		\end{singlespacing}			
	\end{center}
}

%======================================
%% Statement Page
%======================================
\newcommand{\chapterstatement}[1]{
	\newgeometry{right=3cm,left=3cm,top=3cm,bottom=3cm}
	\chapter*{\statementname}%
	\input{#1}
	\addcontentsline{toc}{chapter}{\statementname}
}

%======================================
%% Preface
%======================================
\newcommand{\chapterpreface}[1]{
	\restoregeometry% Restore Geometry
	\chapter*{\prefacename}%
	\input{#1}
	\addcontentsline{toc}{chapter}{\prefacename}
}

%======================================
%% Nomenclature
%======================================
\newcommand{\chapternomenclature}[1]{
	\chapter*{\nomenclaturename}
	\input{#1}	
	\addcontentsline{toc}{chapter}{\nomenclaturename}
}

%======================================
%% Abstract
%======================================
\newcommand{\chapterabstract}[1]{
	\chapter*{ABSTRACT}
	\input{#1}
	\addcontentsline{toc}{chapter}{ABSTRACT}
}

%======================================
%% Intisari
%======================================
\newcommand{\chapterintisari}[1]{
	\chapter*{INTISARI}
	\input{#1}
	\addcontentsline{toc}{chapter}{INTISARI}	
}

%======================================
%% Table of Contents
%% List of Figures and Tables
%======================================
\setcounter{tocdepth}{3}
% Put dots for chapter entries
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
% set font chapter
\renewcommand\cftchapfont{\mdseries}
\renewcommand\cftchappagefont{\mdseries}%

% Modified list entries in TOC, LOT, LOF
\renewcommand{\cftchappresnum}{\chaptername \space}
\renewcommand\cfttabpresnum{\tablename \space}
\renewcommand\cftfigpresnum{\figurename \space}
\AtBeginDocument{
	\addtolength\cftchapnumwidth{\widthof{\bfseries \chaptername }}
	\addtolength\cfttabnumwidth{\widthof{\bfseries \tablename }}
	\addtolength\cftfignumwidth{\widthof{\bfseries \figurename }}
}

% Adding entry to TOC
\newcommand{\thetoc}{
	\newpage
	\addcontentsline{toc}{chapter}{\contentsname}
}
% Adding entry to LOT
\newcommand{\thelot}{
	\newpage
	\addcontentsline{toc}{chapter}{\listtablename}
}
% Adding entry to LOF
\newcommand{\thelof}{
	\newpage
	\addcontentsline{toc}{chapter}{\listfigurename}
}
% Put title of TOC, LOF, and LOT in top-center page
\AtBeginDocument{
	\renewcommand{\cfttoctitlefont}{\vspace{-2.5cm}\hfill\bfseries\fontsize{14pt}{16pt}\selectfont}
	\renewcommand{\cftaftertoctitle}{\hfill}
	\renewcommand{\cftlottitlefont}{\vspace{-2.5cm}\hfill\bfseries\fontsize{14pt}{16pt}\selectfont}
	\renewcommand{\cftafterlottitle}{\hfill}
	\renewcommand{\cftloftitlefont}{\vspace{-2.5cm}\hfill\bfseries\fontsize{14pt}{16pt}\selectfont}
	\renewcommand{\cftafterloftitle}{\hfill}
}

%======================================
%% Tables and Figures
%======================================
% Give padding in tabular environment
\renewcommand{\arraystretch}{1.2}

%======================================
%% Misc Styling
%======================================
%Source code style
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}

\lstdefinestyle{mystyle}{ 
	commentstyle=\color{codegreen},
	keywordstyle=\color{magenta},
	numberstyle=\tiny\color{codegray},
	stringstyle=\color{codepurple},
	basicstyle=\small,
	breakatwhitespace=false,         
	breaklines=true,                 
	captionpos=b,                    
	keepspaces=true,                 
	numbers=left,                    
	numbersep=5pt,                  
	showspaces=false,                
	showstringspaces=false,
	showtabs=false,                  
	tabsize=2
}
\lstset{style=mystyle}


%======================================
%% Chapters and Sections
%======================================
% set page number style
\AtBeginDocument{
	\fancyhf{}
	\fancyhead[R]{\thepage}
	\renewcommand{\headrulewidth}{0pt}
	\pagestyle{fancy}
	\setlength{\parindent}{1.25cm}
}
% depth of toc
\setcounter{secnumdepth}{3}
% set numbering style
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@Roman\c@chapter}
\renewcommand \thesection {\@arabic\c@chapter.\@arabic\c@section}
\renewcommand\thesubsection {\@arabic\c@chapter.\@arabic\c@section.\@arabic\c@subsection}

% set figure, table, and equation style
\@addtoreset {equation}{chapter}
\renewcommand\theequation
{\ifnum \c@chapter>\z@ \@arabic\c@chapter-\fi \@arabic\c@equation}
\renewcommand \thefigure
{\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@figure}
\renewcommand \thetable
{\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@table}

% Section style
\titlespacing\section{0pt}{12pt plus 4pt minus 2pt}{0pt plus 2pt minus 2pt}
\titlespacing\subsection{0pt}{12pt plus 4pt minus 2pt}{0pt plus 2pt minus 2pt}
\titlespacing\subsubsection{0pt}{12pt plus 4pt minus 2pt}{0pt plus 2pt minus 2pt}
\titleformat*{\section}{\raggedright\normalfont\normalsize\bfseries}
\titleformat*{\subsection}{\raggedright\normalfont\normalsize\bfseries}
\titleformat*{\subsubsection}{\raggedright\normalfont\normalsize\bfseries}


% Starting the main matter	
\newcommand{\startmain}{
	\clearpage
	\setcounter{page}{1}
	\pagenumbering{arabic}
	\onehalfspacing
	\nopagebreak
	\setlength{\parindent}{1.25cm}
}
	

% Main chapter head styling
\renewcommand{\@makechapterhead}[1]{%   
	{\parindent \z@ \centering \bfseries
	\fontsize{14pt}{16pt}\selectfont
	\chaptername \space \thechapter
	\par\nobreak
	\MakeUppercase{#1}\par\nobreak
	\vskip 20\p@
}}

% Other chapter head styling
\renewcommand{\@makeschapterhead}[1]{%
	{\parindent \z@ \centering \bfseries
		\fontsize{14pt}{16pt}\selectfont
		\par\nobreak 
		 \MakeUppercase{#1}\par\nobreak 
		 \vskip 20\p@ 
}}

% References
\newcommand{\thereferences}{
	\addcontentsline{toc}{chapter}{\bibname}
	\singlespacing
	\nopagebreak
}

% Appendix
\newcommand{\chapterappendix}[1]{
	\newpage
	% Reset counter
	\setcounter{chapter}{0}
	\setcounter{section}{0}
	\setcounter{page}{1}
	% Makes all chapter name to L
	\renewcommand{\thechapter}{L}
	\renewcommand{\thepage}{L-\arabic{page}}
	\renewcommand \thesection {L.\@arabic\c@section}
	\renewcommand\thesubsection {L.\@arabic\c@section.\@arabic\c@subsection}
	
	% Add to TOC
	\addcontentsline{toc}{chapter}{\appendixname}
%	\addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
	% Page number style
	\fancyhf{}
	\fancyfoot[C]{\thepage}
	
	\fontsize{14pt}{16pt}\selectfont
	\centering\MakeUppercase{\normalfont\bfseries \appendixname }\\
	\vspace{20pt}
	\fontsize{12}{2}\selectfont
	\onehalfspacing
	\input{#1}
}
