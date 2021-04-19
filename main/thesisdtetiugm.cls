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
\RequirePackage[english,bahasa]{babel}% language
\RequirePackage{etoolbox}% conditional statement
\RequirePackage{indentfirst}
\RequirePackage{setspace}
\RequirePackage{times}% font
\RequirePackage[T1]{fontenc}% quotation
\RequirePackage{graphicx}
\RequirePackage{calc}% Simple arithmetic lib
\RequirePackage{pdfpages}% include pdf file in latex



%======================================
%% Option Declaration
%======================================
\newtoggle{lang}
\newtoggle{bachelor}
\newtoggle{master}
\newtoggle{doctoral}
% Language
\DeclareOption{bahasa}{\toggletrue{lang}}
\DeclareOption{english}{\togglefalse{lang}}
% Degree
\DeclareOption{bachelor}{\toggletrue{bachelor} \togglefalse{master} \togglefalse{doctoral}}
\DeclareOption{master}{\togglefalse{bachelor} \toggletrue{master} \togglefalse{doctoral}}
\DeclareOption{doctoral}{\togglefalse{bachelor} \togglefalse{master} \toggletrue{doctoral}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}  % pass any unknown option to the report class


%======================================
%% Option Execution
%======================================
\ExecuteOptions{bachelor,bahasa} % set default degree and language
\ProcessOptions


%======================================
%% Class & Package Loading
%======================================
\LoadClass[12pt]{report}  % this class is based on the report class
\usepackage{geometry}% easy layouting
%\usepackage{hyperref}% hyperlink
\usepackage{subcaption} % subfigure
\usepackage{tocloft}% edit font toc
\usepackage{fancyhdr}% page number
\usepackage[cmex10]{amsmath}
\usepackage{cite}
\usepackage{multirow}
\usepackage{titlesec}
\usepackage{ragged2e}% text alignment
\usepackage{algorithm}
\usepackage{algcompatible}
\usepackage{algpseudocode}
\usepackage{listings}
\usepackage{color}
\usepackage{url}
\usepackage{ifthen}
\usepackage{forloop}
\usepackage{longtable}
\usepackage{enumitem}
\usepackage[labelsep=period]{caption} % use period as label separator
\usepackage{tikz}
\usepackage{pgfplots}
\usepackage{pgf-pie}
\usetikzlibrary{calc}
\usetikzlibrary{positioning}
\usetikzlibrary{arrows}
\usetikzlibrary{shapes}

% Page break for equation
\allowdisplaybreaks

%======================================
%% Localise the Strings
%======================================
\iftoggle{lang}{
	% define new commands in bahasa
	\newcommand{\listappendixname}{DAFTAR LAMPIRAN}%
	\newcommand{\nomenclaturename}{ARTI LAMBANG DAN SINGKATAN}%
	\newcommand{\acknowledgmentname}{HALAMAN PERSEMBAHAN}%
	\newcommand{\approvalpage}{HALAMAN PENGESAHAN}
	\newcommand{\statementname}{PERNYATAAN BEBAS PLAGIASI}
	\newcommand{\dedicationpage}{HALAMAN PERSEMBAHAN}
	\AtBeginDocument{% select the language
		\selectlanguage{bahasa}
	}
}{
	% define new commands in english
	\newcommand{\listappendixname}{LIST OF APPENDICES}%
	\newcommand{\nomenclaturename}{NOMENCLATURE AND ABBREVIATION}%
	\newcommand{\approvalpage}{ENDORSEMENT PAGE}
	\newcommand{\statementname}{STATEMENT}
	\newcommand{\dedicationpage}{PAGE OF DEDICATION}
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
\pgfplotsset{compat=1.16}

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
% Using array-like to dynamically store examiner & supervisor data
% First option keeps ID, second option keeps name(1) or nip(2)
% Examiners
\newcounter{exm}
\newcommand\addexaminer[2]{%
	\stepcounter{exm}%
	\csdef{exmname\theexm}{#1}
	\csdef{exmnip\theexm}{#2}
}
\newcommand\getexaminer[2]{%
	% if second option = 1, get name
	% if second option = 2, get nip
	\ifthenelse{\equal{\detokenize{#2}}{\detokenize{1}}}
	{\csuse{exmname#1}}
	{\csuse{exmnip#1}}
}
% Supervisors/Promotors info
\newcounter{spv}
\newcommand\addsupervisor[2]{%
	\stepcounter{spv}%
	\csdef{spvname\thespv}{#1}
	\csdef{spvnip\thespv}{#2}
}
\newcommand\getsupervisor[2]{%
	% if second option = 1, get name
	% if second option = 2, get nip
	\ifthenelse{\equal{\detokenize{#2}}{\detokenize{1}}}
	{\csuse{spvname#1}}
	{\csuse{spvnip#1}}
}

% Department info
\newcommand{\@university}{Universitas Gadjah Mada}
\newcommand{\@facultyIna}{Fakultas Teknik}
\newcommand{\@facultyEng}{Faculty of Engineering}
\newcommand{\@departmentIna}{Departemen Teknik Elektro dan Teknologi Informasi}
\newcommand{\@departmentEng}{Department of Electrical Engineering and Information Technology}
\newcommand{\@graduateIna}{Program Pascasarjana}
\newcommand{\@graduateEng}{Graduate Program}
\newcommand*{\major}[1]{\newcommand{\@major}{#1}}
\newcommand*{\departmenthead}[2]{
	\newcommand{\@depheadName}{#1}
	\newcommand{\@depheadNIP}{#2}
}
\newcommand{\@city}{Yogyakarta}


%======================================
%% Cover Page
%======================================
% If Bachelor
\iftoggle{bachelor}{
	\newcommand{\printcover}[2]{
		\newgeometry{top=4cm,bottom=3cm,left=3.2cm,right=2.2cm}
		\thispagestyle{empty}
		\setcounter{page}{1}
		\pagenumbering{roman}
		\begin{center}
			\begin{singlespacing}
				\MakeUppercase{\bfseries\fontsize{14pt}{16pt}\selectfont\@title}\\
				\vspace{1.5cm}
				\textbf{#2}\\
				\vfill
				\includegraphics[width=0.5\textwidth]{#1}
				\vfill
				\iftoggle{lang}{Disusun oleh:}{Written by:}\\
				\vspace{0.4em}
				\textbf{\@authorName \\ \@authorID \\}
				\vfill
				\textbf{
					\iftoggle{lang}
					{\MakeUppercase{Program Studi \@program}}
					{\MakeUppercase{\@program \vspace{1em} Program}}\\
					\iftoggle{lang}{\MakeUppercase{\@departmentIna}}{\MakeUppercase{\@departmentEng}} \\
					\iftoggle{lang}{\MakeUppercase{\@facultyIna}}{\MakeUppercase{\@facultyEng}}
					\MakeUppercase{\@university} \\ 
					\MakeUppercase{\@city} \\ 
					\@yearsubmit	
				}
			\end{singlespacing}
		\end{center}
	}
}

% If Master
\iftoggle{master}{
	\newcommand{\printcover}[2]{
		\newgeometry{left=3cm,top=3cm,bottom=3cm,right=3cm}
		\thispagestyle{empty}%
		\setcounter{page}{1}
		\pagenumbering{roman}
		\begin{center}
			\begin{singlespacing}
				\MakeUppercase{\fontsize{14pt}{16pt}\selectfont\@title}\\
				\vspace{1.5cm}
				\textbf{#2}\\
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
}

% If Doctoral
\iftoggle{doctoral}{
	\newcommand{\printcover}[1]{
		\newgeometry{left=3.5cm,top=2.5cm,bottom=2.5cm,right=2.5cm}
		\titleformat*{\section}{\centering\normalfont\normalsize\bfseries}
		\thispagestyle{empty}%
		\setcounter{page}{1}
		\pagenumbering{roman}
		\begin{center}
			\begin{singlespacing}
				\MakeUppercase{\fontsize{14pt}{16pt}\selectfont\@title}\\
				\vspace{1.5cm}
				\iftoggle{lang}
					{Bidang Studi \@program} 
					{\@program \vspace{1em} Program}\\
				\vfill
				\includegraphics[width=0.5\textwidth]{#1}
				\vfill
				\iftoggle{lang}
					{diajukan oleh}
					{proposed by}\\\vspace{0.4em}
				\textbf{\@authorName \\ \@authorID \\}
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
}

%======================================
%% Endorsement Page
%======================================
% If Bachelor
\iftoggle{bachelor}{
	\newcommand{\printendorsementpdf}{
		%\chapter*{\approvalpage}
		\addtocounter{page}{1}
		\addcontentsline{toc}{chapter}{\approvalpage}
		\includepdf[page={1}]{contents/endorsement/endorsement.pdf}
		\addtocounter{page}{-1}
	}
	\newcommand{\printendorsement}{
		\chapter*{\approvalpage}
		\fancyhf{}
		\fancyfoot[C]{\thepage}
		\begin{center}
			\begin{singlespacing}
				\MakeUppercase{\bfseries\fontsize{14pt}{16pt}\selectfont\@title}\\
				\vspace{1cm}
				\textbf{\iftoggle{lang}{SKRIPSI}{THESIS}}\\
				\vspace{2cm}
				\iftoggle{lang}
					{Diajukan Sebagai Salah Satu Syarat untuk Memperoleh}
					{Proposed as A Requirement to Obtain}\\
				\iftoggle{lang}
					{Gelar Sarjana Teknik Program S-1}
					{Undergraduate Degree (\textit{Sarjana Teknik})}\\
				\iftoggle{lang}
					{pada \@departmentIna}
					{in \@departmentEng}\\
				\iftoggle{lang}{\@facultyIna}{\@facultyEng}\\
				\@university\\
				\vfill
				\iftoggle{lang}{Disusun oleh:}{Written by:}\\
				\vspace{1em}
				\textbf{\underline{\@authorName} \\ \@authorID \\}
				\vfill
				\iftoggle{lang}
					{Telah disetujui dan disahkan}
					{Has been approved and endorsed}\\
				\vspace{0.5cm}
				\iftoggle{lang}{Pada tanggal $\ldots\ldots$}{on $\ldots\ldots$}\\
				\vfill
				\begin{center}
					\begin{tabular}{ccc}
						\iftoggle{lang}{Pembimbing I}{Supervisor I} &\hspace{2cm} & \iftoggle{lang}{Pembimbing II}{Supervisor II} \\
						\vspace{0.3cm} & \vspace{0.3cm} & \vspace{0.3cm}\\
						\textbf{\underline{\getsupervisor{1}{1}}}& &
						\textbf{\underline{\getsupervisor{2}{1}}} \\
						\textbf{\getsupervisor{1}{2}} & & \textbf{\getsupervisor{2}{2}}\\
					\end{tabular}
				\end{center}
			\end{singlespacing}
		\end{center}
		\addcontentsline{toc}{chapter}{\approvalpage}
	}
}

% If Master
\iftoggle{master}{
	\newcommand{\printendorsementpdf}{
		%\chapter*{\approvalpage}
		\addtocounter{page}{1}
		\addcontentsline{toc}{chapter}{\approvalpage}
		\includepdf[page={1}]{contents/endorsement/endorsement.pdf}
		\addtocounter{page}{-1}
	}
	\newcommand{\printendorsement}{
	%	\chapter*{\endorsementname}%
		\fancyhf{}
		\fancyfoot[C]{\thepage}
		\begin{center}
			\begin{singlespacing}
				\textbf{\iftoggle{lang}{TESIS}{THESIS}}\\
				\vspace{1em}
				\MakeUppercase{\bfseries\fontsize{14pt}{16pt}\selectfont\@title}\\
				\vspace{0.5cm}
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
				\vspace{1em}
				\iftoggle{lang}
					{\textbf{Susunan Dewan Penguji}}
					{\textbf{Thesis Examiners}}\\
				
				\begin{center}
					\begin{tabular}{ccc}
						\iftoggle{lang}{Pembimbing I}{Supervisor I} &\hspace{2cm} & \iftoggle{lang}{Anggota Dewan Penguji Lain}{Examiners} \\
						\vspace{0.3cm} & \vspace{0.3cm} & \vspace{0.3cm}\\
						\textbf{\underline{\getsupervisor{1}{1}}}& &
						\textbf{\underline{\getexaminer{1}{1}}} \\
						\iftoggle{lang}{Pembimbing II}{Supervisor II} &\hspace{2cm} &   \\
						\vspace{0.3cm} & \vspace{0.3cm} & \vspace{0.3cm}\\
						\textbf{\underline{\getsupervisor{2}{1}}}& &
						\textbf{\underline{\getexaminer{2}{1}}} \\
					\end{tabular}
				\end{center}
				\vspace{0.5cm}
				
				\iftoggle{lang}
					{Tesis ini telah diterima sebagai salah satu persyaratan \\ untuk memperoleh gelar Magister} 
					{This thesis has been accepted as a partial fulfillment \\ for the degree of Master}\\
				\vspace{0.3cm}
				
				\iftoggle{lang}{Tanggal:}{Date: $\ldots\ldots$} \\
				\iftoggle{lang}
					{Pengelola Program Studi \@program} 
					{Program Coordinator of \@program}\\
				\vspace{1.3cm}
				\textbf{\underline{\@programcoorName}}\\
				NIP. \@programcoorNIP \\
				\vspace{0.5cm}
				
				\iftoggle{lang}{Mengetahui,\\}{} 
				\iftoggle{lang}
					{Ketua Departemen/Wakil Penanggung Jawab Program Studi}
					 {Head of Department}\\
				\iftoggle{lang}{\@departmentIna}{\@departmentEng}\\
				\vspace{1.3cm}
				\textbf{\underline{\@depheadName}}\\
				NIP. \@depheadNIP \\
				
			\end{singlespacing}			
		\end{center}
		\addcontentsline{toc}{chapter}{\approvalpage}
	}
}

% If Doctoral
\iftoggle{doctoral}{
	\newcommand{\printendorsementpdf}{
		%\chapter*{\approvalpage}
		\addtocounter{page}{1}
		\addcontentsline{toc}{chapter}{\approvalpage}
		\includepdf[page={1}]{contents/endorsement/endorsement.pdf}
		\addtocounter{page}{-1}
	}
	\newcommand{\printendorsement}{
		\chapter*{\approvalpage}
		\fancyhf{}
		\fancyfoot[C]{\thepage}
		\begin{center}
			\begin{singlespacing}
				\raggedright \hspace{2cm}Tim Promotor menyetujui laporan disertasi: \\
				\begin{center}
					\begin{tabular}{lcl}
						Nama & : & \@authorName \\
						NIM & : & \@authorID \\
						Judul & : & \@title \\
					\end{tabular}
				\end{center}
				\raggedright \hspace{2cm} yang telah diperbaiki sesuai saran dari Tim Penguji Ujian Tertutup \\
				\vspace{1cm}
				\begin{center}
					\begin{tabular}{ccc}
						Tanda Tangan & \hspace{3cm} & Tanggal\\
						\vspace{0.6cm} & \vspace{0.6cm} & \vspace{0.6cm}\\
						\textbf{\underline{\getsupervisor{1}{1}}}& &
						\ldots\ldots\ldots \\
						(Promotor) & & \\
						
						\vspace{0.6cm} & \vspace{0.6cm} & \vspace{0.6cm}\\
						\textbf{\underline{\getsupervisor{2}{1}}}& &
						\ldots\ldots\ldots \\
						(Ko-promotor) & & \\
						
						\vspace{0.6cm} & \vspace{0.6cm} & \vspace{0.6cm}\\
						\textbf{\underline{\getsupervisor{3}{1}}}& &
						\ldots\ldots\ldots \\
						(Ko-promotor) & & \\
					\end{tabular}
				\end{center}

			\end{singlespacing}			
		\end{center}
		\addcontentsline{toc}{chapter}{\approvalpage}
		\newpage
		\chapter*{\approvalpage}
		\begin{center}
			\begin{singlespacing}
					\raggedright \hspace{2cm}Tim Penguji menyetujui laporan disertasi: \\
					\begin{center}
						\begin{tabular}{lcl}
							Nama & : & \@authorName \\
							NIM & : & \@authorID \\
							Judul & : & \@title \\
						\end{tabular}
					\end{center}
					\raggedright \hspace{2cm} yang telah diperbaiki sesuai saran dari Tim Penguji Ujian Tertutup \\
					\vspace{1cm}
					\begin{center}
						\begin{longtable}{ccc}
							Tanda Tangan & \hspace{3cm} & Tanggal\\
							% Iterate through the list of examiners
							% get number of examiners from \value{exm}
							\newcounter{end}
							\forloop{end}{1}{\theend < \numexpr\value{exm}+1}{
								\vspace{0.6cm} & \vspace{0.6cm} & \vspace{0.6cm}\\
								\textbf{\underline{\getexaminer{\theend}{1}}} & &
								\ldots\ldots\ldots \\
								\ifthenelse{\theend = 1}{(Ketua Tim Penguji)}{(Anggota Tim Penguji)} & & \\
								\ifthenelse{\theend = 4} %newpage after the 4th item
								{
									\hspace{2cm}\\
									\pagebreak
									Tanda Tangan & \hspace{3cm} & Tanggal\\
								}{}
							}
							
						\end{longtable}
					\end{center}
					
				\end{singlespacing}			
			\end{center}
	}
}

%======================================
%% Scanned JPG Endorsement Page
%======================================
\newcommand{\printendorsementjpg}[1]{
	\newpage
	\fancyhf{}
	\fancyfoot[C]{\thepage}
	\begin{center}
	\vspace*{-4cm}
	\noindent\makebox[\textwidth]{\includegraphics[width=\paperwidth]{#1}}
	\end{center}
	\addcontentsline{toc}{chapter}{\approvalpage}
	\clearpage
}

%======================================
%% Dedication Page
%======================================
\newcommand{\chapterdedication}[1]{
	\newgeometry{right=3cm,left=3cm,top=3cm,bottom=3cm}
	\chapter*{\dedicationpage}%
	\input{#1}
	\addcontentsline{toc}{chapter}{\dedicationpage}
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
%% Scanned JPG Statement Page
%======================================
\newcommand{\chapterstatementjpg}[1]{
	\newpage
	\fancyhf{}
	\fancyfoot[C]{\thepage}
	\begin{center}
	\vspace*{-4cm}
	\noindent\makebox[\textwidth]{\includegraphics[width=\paperwidth]{#1}}		
	\end{center}
	\addcontentsline{toc}{chapter}{\statementname}
	\clearpage
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
% dot length
\renewcommand{\cftdotsep}{1} %default: 4.5
% Put dots for chapter entries
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
% set font chapter
\renewcommand\cftchapfont{\mdseries}
\renewcommand\cftchappagefont{\mdseries}%


% Modified list entries in TOC, LOT, LOF
\setlength{\cftbeforechapskip}{0em} % no space between list
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

%======================================
%% List
%======================================
\setlist[enumerate]{topsep=0pt,itemsep=0ex,partopsep=1ex,parsep=1ex}

%======================================
%% New command to cite equation
%% 	- equation should be started with \EQUATION <<EQUATION NAME>>
%% 	- equation should be ended with \ENDEQUATION
%%	- cite equation using \inputeq{<<PATH_TO_EQUATION_TEX>>}{<<EQUATION NAME>>}
%======================================
\newcommand{\inputeq}[2]{% #1 = file, #2 = eq name
	\long\def\EQUATION ##1#2 {}%
	\input{#1}
}
\let\ENDEQUATION\endinput

%======================================
%% Disable hyphenation unless urgent or writen manually 
%======================================
\pretolerance=10000
\tolerance=9000
\emergencystretch=0pt
\hyphenpenalty=10000
\hbadness=10000