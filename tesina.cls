%% Clase para la producción de tesinas para la asignatura Proyecto de Investigacion e Innovacion en Ingenieria Estructural (PIIIE)
%%
%% Clase modificada por J. M. P\'erez Zerpa a partir de la clase UdelarTeX creada por los docentes del IET Pablo Castrillo y Mihdí Caballero con el apoyo de la Comision Academica de Posgrado (CAP). La clase UdelaRTex est\'a disponible en http://tesis.posgrados.udelar.edu.uy/TallerTesis/UdelaRTeX
% varias opciones de UdelaRTeX no son utilizadas para la tesina.
%%
%% {1417}
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%
\def\fileversion{v0.1}
\def\filedate{2019/07/08}
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{tesina}[\filedate\ \fileversion\ Class for undergraduate thesis.]
\LoadClass[12pt,a4paper]{book}


% =========================
% ==== INICIO PAQUETES ====
% =========================

\RequirePackage{color}
\RequirePackage[perpage]{footmisc}

\RequirePackage{hyphenat}
\RequirePackage[toc]{appendix}
\RequirePackage{lastpage}
\RequirePackage[english,spanish,es-nodecimaldot]{babel}
\RequirePackage[utf8x]{inputenc}
\RequirePackage{amsmath,amssymb}
\RequirePackage{ifthen}
\RequirePackage{graphicx}
\RequirePackage{float}
%\RequirePackage{caption}
\RequirePackage[font=small,labelfont=bf]{caption}
\RequirePackage{setspace}
\RequirePackage{mathptmx}
\RequirePackage{tabularx}
\RequirePackage{eqparbox}
\RequirePackage{ltxcmds}
\RequirePackage{titletoc}
\RequirePackage[colorlinks=false,
            citecolor=blue,
            urlcolor=magenta,
            linkcolor=red,
            citebordercolor={0 0 1},
            urlbordercolor={0 1 1},
            linktocpage,
            hyperfootnotes=true
            ]{hyperref} %[colorlinks]
\RequirePackage[a4paper,bindingoffset=0.0cm,vcentering=true,%
top=3.5cm,bottom=3cm,left=4.0cm,right=3.0cm]{geometry} %showframe para ver los margins
\RequirePackage[pagewise]{lineno}
\RequirePackage[printwatermark]{xwatermark}
\RequirePackage{xcolor}
\RequirePackage[nottoc]{tocbibind}

\DeclareFontShape{OT1}{cmr}{bx}{sc}{<-> cmbcsc10}{} % Magia por error con 0T1 --> http://tex.stackexchange.com/questions/37618/a-problem-with-textsc

%======================
%==== FIN PAQUETES ====
%======================

\DeclareOption{oneside}{
\setboolean{@twoside}{false}}

\DeclareOption{twoside}{
\setboolean{@twoside}{true}}

\newboolean{linenumbers}
\newboolean{watermark}

\DeclareOption{linenumbers}{
\setboolean{linenumbers}{true}}

\DeclareOption{watermark}{
\setboolean{watermark}{true}}

%================================
%==== INICIO NUEVOS COMANDOS ====
%================================

\addto\captionsspanish{\renewcommand{\tablename}{Tabla}}
\addto\captionsspanish{\renewcommand{\listtablename}{Lista de tablas}}
\addto\captionsspanish{\renewcommand{\listfigurename}{Lista de figuras}}
\addto\captionsspanish{\renewcommand{\contentsname}{Tabla de contenidos}}
\addto\captionsspanish{\renewcommand{\bibname}{Referencias bibliográficas}}

%%==== APACITE ====
%\renewcommand{\BOthers}[1]{et al.\hbox{}}
%\renewcommand{\BBAA}{\&}% Letra que va entre los autores en las referencias
%\renewcommand{\BBAB}{and}% Entre autores en el texto
%%=================

%==== Tolerancias ====
\tolerance=10000 % Pueden ser modificadas
\hbadness=10000 % Pueden ser modificadas
%=====================

%=============================
%==== FIN NUEVOS COMANDOS ====
%=============================


%=============================
%==== INICIO INTERLINEADO ====
%=============================

\onehalfspacing % separación entre lineas (interlineado)

\let\oldenumerate\enumerate %cambiar el entorno enumerate
\renewcommand{\enumerate}{
  \oldenumerate
  \setlength{\itemsep}{1pt} %separación entre items
  \setlength{\parskip}{0pt} 
  \setlength{\parsep}{0pt}
}

\let\olditemize\itemize %cambiar el entorno itemize
\renewcommand{\itemize}{
  \olditemize
  \setlength{\itemsep}{1pt} %separación entre items
  \setlength{\parskip}{0pt} 
  \setlength{\parsep}{0pt}
}

\let\olddescription\description %cambiar el entorno itemize
\renewcommand{\description}{
  \olddescription
  \setlength{\itemsep}{1pt} %separación entre items
  \setlength{\parskip}{0pt} 
  \setlength{\parsep}{0pt}
}

%==========================
%==== FIN INTERLINEADO ====
%==========================


\DeclareOption{udelar}{%
	\newcommand{\@university}{UdelaR}
}
\DeclareOption{utec}{%
	\newcommand{\@university}{UTEC}
}

%==== Opción de Maestría para la clase ===
\DeclareOption{msc}{%
  \newcommand{\@degree}{M.Sc.}
  \newcommand{\@degreename}{Maestr{\'i}a}
  \newcommand{\local@degname}{Magister}
  \newcommand\local@doctype{Tesis}
}
%=========================================
%==== Opción de Examen de Doctorado para la clase ===
\DeclareOption{dscexam}{%
  \newcommand{\@degree}{D.Sc.}
  \newcommand{\@degreename}{Doctorado}
  \newcommand{\local@degname}{Doctor}
  \newcommand\local@doctype{Examen de Calificaci{\'o}n}
}
%====================================================
%==== Opción de Doctorado para la clase ===
\DeclareOption{dsc}{%
  \newcommand{\@degree}{Dr.}
  \newcommand{\@degreename}{Doctorado}
  \newcommand{\local@degname}{Doctor}
  \newcommand\local@doctype{Tesina}
}
%==========================================

%==== Titulo y subtitulo ====
\renewcommand\title[1]{%
  \global\def\local@title{#1}%
}
\newcount\@subtitle\@subtitle0
\newcommand\subtitle[1]{%
  \global\def\local@subtitle{#1}%
  \global\advance\@subtitle by 1
}
%============================

%==== Logo institución ====

\newcount\@institutelogo\@institutelogo0
\newcommand\institutelogo[1]{%
  \global\def\@instituteslogos{#1}
  \global\advance\@institutelogo by 1
}

%==========================

%==== Autor, director de tesis, codirectores y director académico ====
\renewcommand\author[2]{% Comando para el autor
  \global\def\@authname{#1}
  \global\def\@authsurn{#2}
}

\newcommand\authors[2]{% Comando para el autor
	\global\def\@authnames{#1}
	\global\def\@authsurns{#2}
}

\newcommand\authort[2]{% Comando para el autor
	\global\def\@authnamet{#1}
	\global\def\@authsurnt{#2}
}


%==== Pongo si quiero que sea un posgrado "en" algo o "de" algo ====
\newcommand\escritura[1]{% Comando para el tipo de posgrado
	\global\def\@tipoescritura{#1}
}

% Creo la opcion de tener varios directores de carrera
\newcommand\local@directorstring{Tutor}
\newcommand\foreign@directorstring{Advisor}

\newcount\@director\@director0
\newcommand\tutor[4]{% Comando para los directores
	\global\@namedef{UdelarDirectorTitle:\expandafter\the\@director}{#1}
	\global\@namedef{UdelarDirectorName:\expandafter\the\@director}{#2}
	\global\@namedef{UdelarDirectorSurname:\expandafter\the\@director}{#3}
	\global\@namedef{UdelarDirectorDegree:\expandafter\the\@director}{#4}
	\global\advance\@director by 1
	\ifnum\@director>1
	\renewcommand\local@directorstring{Directores}
	\renewcommand\foreign@directorstring{Directors}
	\fi
}


\newcommand\local@codirectorstring{Cotutor}
\newcommand\foreign@codirectorstring{Co-advisor}

\newcount\@codirector\@codirector0
\newcommand\cotutor[4]{% Comando para los codirectores
  \global\@namedef{UdelarCoAdvisorTitle:\expandafter\the\@codirector}{#1}
  \global\@namedef{UdelarCoAdvisorName:\expandafter\the\@codirector}{#2}
  \global\@namedef{UdelarCoAdvisorSurname:\expandafter\the\@codirector}{#3}
  \global\@namedef{UdelarCoAdvisorDegree:\expandafter\the\@codirector}{#4}
  \global\advance\@codirector by 1
  \ifnum\@codirector>1
    \renewcommand\local@codirectorstring{Codirectores}
    \renewcommand\foreign@codirectorstring{Co-dvisors}
  \fi
}

\newcount\@directoracademico\@directoracademico0
\newcommand\referenteexterno[4]{% Comando para el director académico
  \global\def\@academicotitle{#1}
  \global\def\@academiconame{#2}
  \global\def\@academicosurn{#3}
  \global\def\@academicodegree{#4}
  \global\advance\@directoracademico by 1
}
%=====================================================================

%==== Examinadores ====
\newcount\@examiner\@examiner0
\newcommand\examiner[4]{% Acá se definen los examinadores del tribunal
  \global\@namedef{UdelarExaminerTitle:\expandafter\the\@examiner}{#1}
    \global\@namedef{UdelarExaminerName:\expandafter\the\@examiner}{#2}
    \global\@namedef{UdelarExaminerSurname:\expandafter\the\@examiner}{#3}
    \global\@namedef{UdelarExaminerDegree:\expandafter\the\@examiner}{#4}
  \global\advance\@examiner by 1
}
%======================

%==== Variables del posgrado ====
\ProcessOptions\relax
\newcommand\graduatename[1]{% Nombre del posgrado
  \global\def\local@graduatename{#1}
}

\newcount\@institute\@institute0
\newcounter{institute}
\newcommand\institute[2]{% Acá se definen los institutos del posgrado
  \global\@namedef{InstituteName:\expandafter\the\@institute}{#1}
  \global\@namedef{AbbrevInstituteName:\expandafter\the\@institute}{#2}
  \global\advance\@institute by 1
  \global\addtocounter{institute}{1}
}

\count1=0
\global\def\local@maininstitute{\csname InstituteName:\the\count1 \endcsname}
\global\def\local@abbrevmaininstitute{\csname AbbrevInstituteName:\the\count1\endcsname}

\newcount\@seconduniversity\@seconduniversity0
\newcounter{seconduniversity}
\newcommand\seconduniversity[1]{% Acá se definen los institutos del posgrado
	\global\@namedef{SecondUniversityName:\expandafter\the\@seconduniversity}{#1}
	\global\advance\@seconduniversity by 1
	\global\addtocounter{seconduniversity}{1}
}

\newcount\@thirduniversity\@thirduniversity0
\newcounter{thirduniversity}
\newcommand\thirduniversity[1]{% Acá se definen los institutos del posgrado
	\global\@namedef{ThirdUniversityName:\expandafter\the\@thirduniversity}{#1}
	\global\advance\@thirduniversity by 1
	\global\addtocounter{thirduniversity}{1}
}


\newcommand\graduatelocation[2]{% Nombre del posgrado
  \global\def\local@cityname{#1}
  \global\def\local@countryname{#2}
}

%================================

%=== Fecha ====
\renewcommand\date[3]{% Fecha
  \day=#1
  \month=#2
  \year=#3
}
\newcommand\local@monthname{\ifcase\month\or
  Enero\or Febrero\or Marzo\or Abril\or Mayo\or Junio\or
  Julio\or Agosto\or Setiembre\or Octubre\or Noviembre\or Diciembre\fi}
\newcommand\foreign@monthname{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi}
%==============

%==== Palabras claves ====
\newcounter{keywords}
\newcommand\keyword[1]{% Palabras claves en español
  \global\@namedef{UdelarKeyword:\expandafter\the\c@keywords}{#1}
  \global\addtocounter{keywords}{1}
}
%
\newcounter{foreignkeywords}
\newcommand\foreignkeyword[1]{% Palabras claves en inglés
  \global\@namedef{UdelarForeignKeyword:\expandafter\the\c@foreignkeywords}{#1}
  \global\addtocounter{foreignkeywords}{1}
}

%=========================

%==== Página I ====
\renewcommand\maketitle{%
  \ifthenelse{\boolean{watermark}}{\newwatermark[allpages,color=gray!50,angle=35,scale=3,xpos=0,ypos=0]{En revisión}}{}
  \begin{titlepage}
  \pagenumbering{roman}
  \pagestyle{empty}
  \setcounter{page}{1}
  \hspace{-0.5cm}
  \ifthenelse{\equal{\@university}{UdelaR}}{
  	\includegraphics[height=0.07\textheight]{imagenes/logo_udelar}
  }{
  \ifthenelse{\equal{\@university}{UTEC}}{
  	\includegraphics[height=0.15\textheight]{imagenes/logo_UTEC}
}{}}
  	 \hfill
			  \includegraphics[height=0.07\textheight]{imagenes/logo_institucion1}  \hspace{5mm}
			  \includegraphics[height=0.075\textheight]{imagenes/logo_institucion2}
	  \vspace{1.05cm}
	  \begin{center}
	      \vspace*{3cm}
	      \doublespacing
		  \nohyphens{\huge{\local@title}}\par
		  \vspace*{0.3cm}
		  \ifnum\@subtitle>0
			  \nohyphens{\Large{\local@subtitle}}\par
		  \fi
		  \vspace*{2cm}
		  \nohyphens{\large{\@authname\ \@authsurn}}\par
	 \nohyphens{\large{\@authnames\ \@authsurns}}\par
	    				\ifthenelse{\not\(\isundefined{\@authnamet}\)}{
\nohyphens{\large{\@authnamet\ \@authsurnt}}\par}{}
	  \end{center}
	  \vspace{\fill}
	  \begin{center}
	  Programa de grado \@tipoescritura~\local@graduatename\\
	  \count1=0
	  \count2=1
 	  \nohyphens{\@whilenum \count1<\@institute \do {
 	  \ifnum\count2<\value{institute}
	 		\csname InstituteName:\the\count1\endcsname,
 	  \else
	 		\csname InstituteName:\the\count1\endcsname\\
 	  \fi
      \advance\count1 by 1
 	  \advance\count2 by 1}}
	\ifnum\@seconduniversity>0
		\ifnum\@thirduniversity>0
			Universidad de la Rep{\'u}blica - \csname SecondUniversityName:\the\count1\endcsname - \csname ThirdUniversityName:\the\count1\endcsname \\
		\else
			Universidad de la Rep{\'u}blica - \csname SecondUniversityName:\the\count1\endcsname \\
		\fi
	\else 
		\ifnum \@thirduniversity>0
			Universidad de la Rep{\'u}blica - \csname ThirdUniversityName:\the\count1\endcsname \\
		\else
			Universidad de la Rep{\'u}blica  \\
	    \fi
	\fi
	
	  \frontpage@bottomtext
	  \end{center}
  \end{titlepage}
  \global\let\maketitle\relax%
\global\let\and\relax}
%====================

%==== Páginas II, III y IV ====
\renewcommand\frontmatter{%
\thispagestyle{empty}
  \@mainmatterfalse
  \pagenumbering{roman}
  \setcounter{page}{2}
  \makefrontpage
}

\newcommand\makefrontpage{%
\cleardoublepage
\pagestyle{empty}
  \hspace{-0.5cm} \includegraphics[height=0.07\textheight]{imagenes/logo_udelar} \hfill
\includegraphics[height=0.07\textheight]{imagenes/logo_institucion1}  \hspace{5mm}
\includegraphics[height=0.075\textheight]{imagenes/logo_institucion2}
\vspace{1.05cm}
\begin{center}
     \doublespacing
	 \nohyphens{\huge{\local@title}}\par
	 \vspace*{0.3cm}
	 \ifnum\@subtitle>0
	 \nohyphens{\Large{\local@subtitle}}\par
	 \fi
	 \vspace*{1cm}
	 \nohyphens{\large{\@authname\ \@authsurn}}\par
	 \nohyphens{\large{\@authnames\ \@authsurns}}\par
	 %
	 \ifthenelse{\not\(\isundefined{\@authnamet}\)}{
	 	%
	 \nohyphens{\large{\@authnamet\ \@authsurnt}}\par
 }{}
%
\end{center}
\vspace*{1cm}
\begin{flushright}
	\begin{minipage}{9.5cm}
		\frontcover@maintext
		
		\vspace{7.5mm}
%		Director de tesis: \\
%		\hspace*{0.3cm}\nohyphens{\@directordegree\ \@directortitle\ \@directorname\ \@directorsurn}
%		\vspace{5mm}
		%
		\ifnum\@director>0
			\local@directorstring: \\
			\count1=0
			\nohyphens{\@whilenum \count1<\@director \do {
			\hspace*{0.3cm}\csname UdelarDirectorDegree:\the\count1 \endcsname\space\csname UdelarDirectorTitle:\the\count1 \endcsname\space\csname UdelarDirectorName:\the\count1 \endcsname\space\csname UdelarDirectorSurname:\the\count1 \endcsname
			\\
			\advance\count1 by 1}}
		\fi
		
		\ifnum\@codirector>0
			\local@codirectorstring: \\
			\count1=0
			\nohyphens{\@whilenum \count1<\@codirector \do {
			\hspace*{0.3cm}\csname UdelarCoAdvisorDegree:\the\count1 \endcsname\space\csname UdelarCoAdvisorTitle:\the\count1 \endcsname\space\csname UdelarCoAdvisorName:\the\count1 \endcsname\space\csname UdelarCoAdvisorSurname:\the\count1 \endcsname
			\\
			\advance\count1 by 1}}
		\fi
		
		\ifnum\@directoracademico>0
			Referente externo: \\
			\hspace*{0.3cm}\nohyphens{\@academicodegree\ \@academicotitle\ \@academiconame\ \@academicosurn}
		\fi
	\end{minipage}\par
\end{flushright}
\vspace*{\fill}	  
\frontpage@bottomtext
\pagestyle{empty}
\cleardoublepage
\makecatalog
\cleardoublepage
\pagestyle{plain}
\begin{center}
	INTEGRANTES DEL TRIBUNAL DE DEFENSA DE TESINA
\end{center}
\vspace*{15mm}
\begin{flushright}
\count1=0
\nohyphens{\@whilenum \count1<\@examiner \do {
\eqparbox{signture@list}{\rule{0.6\textwidth}{.4pt}}\\
%\eqparbox{signture@list}{\hrulefill}\\ 
\eqparbox{signture@list}%
{
\vspace{0.5cm}
\ \ \ \csname 
UdelarExaminerDegree:\the\count1 \endcsname\space\csname 
UdelarExaminerTitle:\the\count1 \endcsname\space\csname 
UdelarExaminerName:\the\count1 \endcsname\space\csname 
UdelarExaminerSurname:\the\count1 \endcsname\\\\\\ \ \ \ %
}
\advance\count1 by 1}}
\end{flushright}
\vspace*{\fill}
\frontpage@bottomtext
}



\newcommand\makecatalog{%
  
   \begin{center}
   	\setlength{\fboxsep}{5mm}
   	\framebox[120mm][c]{\makebox[5mm][c]{}%
   		\begin{minipage}[c]{105mm}
   			\setlength{\parindent}{5mm}
   			\noindent\sloppy\nohyphens\@authsurn,
   			\nohyphens\@authname\par
   			\nohyphens{\local@title\ / \@authname\ \@authsurn,  \@authnames\ \@authsurns%
   				\ifthenelse{\not\(\isundefined{\@authnamet}\)}{
   					 , \@authnamet\ \@authsurnt}.\ -\ \local@cityname:
   				Universidad de la República, Facultad de Ingeniería, \number\year.}\par
   				{\footnotesize \pageref{front:pageno}},
   				\pageref{LastPage}
   				p.\@ifundefined{r@cat:lofflag}{}{\pageref{cat:lofflag}} $30$ cm.\par
   				\local@directorstring:
   				\count1=0
   				\nohyphens{\csname UdelarDirectorName:\the\count1 \endcsname\space\csname UdelarDirectorSurname:\the\count1 \endcsname}.\par
   				\ifnum\@codirector>0
   				\local@codirectorstring:
   				\count1=0
   				\nohyphens{\csname UdelarCoAdvisorName:\the\count1 \endcsname\space\csname UdelarCoAdvisorSurname:\the\count1 \endcsname}.\par
   				Tesina de grado - Universidad de la República. Facultad de Ingeniería, Instituto de Estructuras y Transporte, Programa de
   				grado, \local@graduatename, \number\year.\par
   				Referencias bibliográficas: p. \pageref{bib:begin} -- \pageref{bib:end}.\par
   				\count1=0
   				\count2=1
   				\nohyphens{\@whilenum \count1<\value{keywords} \do {%
   						\ifnum\count2<\value{keywords}
   						\number\count2.~\csname UdelarKeyword:\the\count1 \endcsname,
   						\else
   						\number\count2.~\csname UdelarKeyword:\the\count1 \endcsname.
   						\fi
   						\advance\count1 by 1
   						\advance\count2 by 1}} 
   				I.~	\nohyphens\@authsurns, \nohyphens\@authnames.
   				\ifthenelse{\not\(\isundefined{\@authnamet}\)}{   				
   				II.~\nohyphens\@authsurnt, \nohyphens\@authnamet.
   				III.~Universidad de la República, Facultad de Ingeniería, Instituto de
   				Estructuras y Transporte.
   			}{II.~Universidad de la República, Facultad de Ingeniería, Instituto de
   			Estructuras y Transporte.}
   		\end{minipage}}
   	\end{center}
\vspace*{\fill}}
%============================

%==== Parte de la página II y III ====
\newcommand\frontcover@maintext{
  Tesina presentada como parte de los requisitos para la finalizaci\'on de Carrera  \local@graduatename del de la Universidad de la Rep{\'u}blica.}


\newcommand\frontpage@bottomtext{%
  \begin{center}
  {\local@cityname\ -- \local@countryname}\par
  {\local@monthname\ de \number\year}
  \end{center}%
}
%=====================================

%==== Página V, puede ir o no ====
\newcommand\dedication[1]{
  \gdef\@dedic{#1}
    \cleardoublepage
    \vspace*{\fill}
    \begin{flushright}
      \begin{minipage}{60mm}
        \raggedleft  \normalsize \@dedic
      \end{minipage}
    \end{flushright}
}
%=================================

%==== Página VII, puede ir o no ====
\newcommand\epigrafe[2]{
  \gdef\@epig{#1}
  \gdef\@epigs{#2}
    \cleardoublepage
    \begin{flushright}
      \begin{minipage}{60mm}
      \begin{flushright}
        \textit{\@epig} 
        \vspace{0.5cm}
        
        \@epigs
        \end{flushright}
      \end{minipage}
    \end{flushright}
}
%===================================

%==== Página VIII, Resumen en español ====
\newenvironment{abstract}{%
  \cleardoublepage
  \thispagestyle{plain}
  \begin{center}
  	RESUMEN
  \end{center}
  \vspace*{20mm}
  }{
\vspace*{20mm}
\ifnum\value{keywords}>1
\noindent
Palabras claves:\\ 
\else
\noindent
Palabra clave:\\
\fi
\count1=0
\count2=1
\nohyphens{\@whilenum \count1<\value{keywords} \do {%
\ifnum\count2<4
	\ifnum\count2<\value{keywords}
	\csname UdelarKeyword:\the\count1 \endcsname,
	\else
	\csname UdelarKeyword:\the\count1 \endcsname.
	\fi
\else
	\ifnum\count2<\value{keywords}
	\csname UdelarKeyword:\the\count1 \endcsname,
	\else
	\csname UdelarKeyword:\the\count1 \endcsname.
	\fi
\fi
\advance\count1 by 1
\advance\count2 by 1}}
\vspace*{\fill}}
%=========================================
  
%==== Página IX, Resumen en ingles ====
\newenvironment{foreignabstract}{ %
  \cleardoublepage
  \thispagestyle{plain}
  \begin{otherlanguage}{english}
  \begin{center}
  	ABSTRACT
  \end{center}
   \vspace*{20mm}
\end{otherlanguage}}{%
\vspace*{20mm}
\ifnum\value{foreignkeywords}>1
\noindent
Keywords:\\ 
\else
\noindent
Keyword:\\
\fi
\count1=0
\count2=1
\nohyphens{\@whilenum \count1<\value{foreignkeywords} \do {%
\ifnum\count2<4
	\ifnum\count2<\value{foreignkeywords}
	\csname UdelarForeignKeyword:\the\count1 \endcsname,
	\else
	\csname UdelarForeignKeyword:\the\count1 \endcsname.
	\fi
\else
	\ifnum\count2<\value{foreignkeywords}
	\csname UdelarForeignKeyword:\the\count1 \endcsname,
	\else
	\csname UdelarForeignKeyword:\the\count1 \endcsname.
	\fi
\fi
\advance\count1 by 1
\advance\count2 by 1}}
\vspace*{\fill}}
%========================================

%==== Página X, lista de figuras, puede ir o no ====
\renewcommand\listoffigures{%
	\if@twoside
	  \cleardoublepage
	  \fi
	\udelar@hasLof
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
      \addcontentsline{toc}{chapter}{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
}
%===================================================

%==== Página XI, lista de tablas, puede ir o no ====    
\renewcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
      \addcontentsline{toc}{chapter}{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
}
%===================================================


%==== Contenido general del texto ===
\renewcommand\mainmatter{%
  \ifthenelse{\boolean{linenumbers}}{\linenumbers}{\nolinenumbers}
  \if@twoside
  \clearpage
  \fi
  \udelar@mainBegin
  \cleardoublepage
  \@mainmattertrue
  \pagestyle{plain}
  \pagenumbering{arabic}
}
%====================================

%==== Final del texto ====
\renewcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
    
\fi
\udelar@bibBegin}
%=========================
    
%==== Algunos labels importantes ====
\AtBeginDocument{%
  \ltx@ifpackageloaded{hyperref}{
  	\def\udelar@bibBegin{%
        \immediate\write\@auxout{%
          \string\newlabel{bib:begin}{{}{\arabic{page}}{}{page.\arabic{page}}{}}}}%
    \def\udelar@bibEnd{%
      \immediate\write\@auxout{%
        \string\newlabel{bib:end}{{}{\arabic{page}}{}{page.\arabic{page}}{}}}}%
    \def\udelar@mainBegin{%
          \immediate\write\@auxout{%
            \string\newlabel{front:pageno}{{}{\Roman{page}}{}{page.\Roman{page}}{}}}}%
    \def\udelar@hasLof{%
      \immediate\write\@auxout{%
        \string\newlabel{cat:lofflag}{{}{:~il.;}{}{page.\Roman{page}}{}}}}%
  }{%
    \def\udelar@bibEnd{%
      \immediate\write\@auxout{%
      \string\newlabel{bib:end}{{}{\arabic{page}}{}}}}%
    \def\udelar@bibBegin{%
      \immediate\write\@auxout{%
      \string\newlabel{bib:begin}{{}{\arabic{page}}{}}}}%
    \def\udelar@mainBegin{%
      \immediate\write\@auxout{%
        \string\newlabel{front:pageno}{{}{\Roman{page}}{}}}}%
    \def\udelar@hasLof{%
      \immediate\write\@auxout{%
        \string\newlabel{cat:lofflag}{{}{:~il.;}{}}}}%
  }%
}
%====================================

%==== Bibliografía ====


\newdimen\bibindent%
\setlength\bibindent{1.5em}%
\renewenvironment{thebibliography}[1]%
     {\onehalfspacing%
      \chapter*{\bibname}%
      \addcontentsline{toc}{chapter}{\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\setlength{\labelwidth}{0ex}%
            \setlength{\leftmargin}{0.0ex}%
            \setlength{\itemindent}{-2.5ex}%
            \advance\leftmargin\labelsep%
            \@openbib@code%
            \usecounter{enumiv}%
            \let\p@enumiv\@empty%
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy%
      \clubpenalty4000%
      \@clubpenalty \clubpenalty%
      \widowpenalty4000%
      \sfcode`\.\@m}%
     {\def\@noitemerr%
       {\@latex@warning{Empty `thebibliography' environment}}%
\endlist}
\newcommand\bibend{\udelar@bibEnd}
%======================

%==== Glosario ====
\newcommand\glosario{%
	\printnoidxglossary[sort=case,type=glosario]\addcontentsline{toc}{chapter}{Glosario} 
}
%==================

\newcount\@apenarabicnumbering\@apenarabicnumbering0
\newcommand\apenarabicnumbering{%
  \global\advance\@apenarabicnumbering by 1
}

\newcount\@anexarabicnumbering\@anexarabicnumbering0
\newcommand\anexarabicnumbering{%
  \global\advance\@anexarabicnumbering by 1
}

%==== Apéndices ====
\newcommand\apenmatter{%
	\appendix
	\renewcommand\appendixpagename{APÉNDICES}
	\renewcommand\appendixtocname{\textbf{Apéndices}}
	\appendixpage
	\ifnum\@apenarabicnumbering>0
	\renewcommand{\thechapter}{\arabic{chapter}}
	\fi
	\titlecontents{chapter}% <section-type>
		[13pt]% <left>
		{}% <above-code>
		{ Apéndice\ \thecontentslabel\quad}% <numbered-entry-format>
		{}% <numberless-entry-format>
		{\titlerule*[1pc]{.}\contentspage}% <filler-page-format>
}


%===================

%==== Anexos ==== % Editado 21/09/2016 Pablo Castrillo
\newcommand{\annexname}{Anexo}
\newcommand\anexmatter{\par
	\setcounter{chapter}{0}
	\setcounter{section}{0}
	\appendix
	\renewcommand\appendixpagename{ANEXOS}
	\renewcommand\appendixtocname{\textbf{Anexos}}
	\renewcommand\appendixname{Anexo}
	\titlecontents{chapter}% <section-type>
	[0pt]% <left>
	{\vspace*{0.45cm}}% <above-code>
	{\thecontentslabel\quad}% <numbered-entry-format>
	{}% <numberless-entry-format>
	{\bfseries\hfill\contentspage}% <filler-page-format>
	\appendixpage
	\ifnum\@anexarabicnumbering>0
	\renewcommand{\thechapter}{\arabic{chapter}}
	\else
	\renewcommand{\thechapter}{\Alph{chapter}}
	\fi
	\titlecontents{chapter}% <section-type>
	[13pt]% <left>
	{}% <above-code>
	{ Anexo\ \thecontentslabel\quad}% <numbered-entry-format>
	{}% <numberless-entry-format>
	{\titlerule*[1pc]{.}\contentspage}% <filler-page-format>
	\renewcommand{\theHchapter}{\annexname.\thechapter}
}
%===================

%% End of file `tesina.cls'.
