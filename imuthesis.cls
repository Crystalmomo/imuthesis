\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{imuthesis}[2014/4/10 v0.1beta Inner Mongolia University Thesis documenfancyt class]

% 传递参数到ctexbook
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

% 设置页面尺寸为A4，默认字号（正文）为小4号，单面印刷
\LoadClass[fntef,a4paper,fancyhdr,cs4size,oneside]{ctexbook}

% 提供图形支持宏包
\RequirePackage{graphicx}

% 页面布局宏包
\RequirePackage{geometry}

% 页边距和页面尺寸
\geometry{top=30mm,bottom=25mm,left=30mm,right=20mm}

% 去掉目录、引证等处的颜色
\RequirePackage[colorlinks=false]{hyperref}

% 代码支持
\RequirePackage{listings}

% 图像绘制支持
\RequirePackage{tikz}

% 代码高亮支持
\RequirePackage{xcolor}

% ifthen宏包
\RequirePackage{ifthen}

% 代码注释标记

\newcounter{coderemarks}
\setcounter{coderemarks}{1}
\newcounter{codevar}
\setcounter{codevar}{1}
 
\newcommand{\circlemark}[1]{%
    \tikz\node[
        text=white,
        font=\sffamily\bfseries,
        inner sep=0mm,
        draw,
        circle,
        fill=black
    ]{#1};
}

\newcommand{\makeremark}[1]{%
    \circlemark{
        \arabic{coderemarks}
    }%
    \global \expandafter
    \def \csname codebox\the\value{coderemarks}\endcsname{#1}%
    \stepcounter{coderemarks}
}

\newcommand{\showremarks}{%
    \begin{list}
        {
            \circlemark{
                \arabic{codevar}
            }
        } %
        {} %
        \whiledo{\value{codevar} < \value{coderemarks}}{ %
            \item \expandafter\csname codebox\the\value{codevar}\endcsname %
            \stepcounter{codevar}
        } %
    \end{list} %
    \setcounter{coderemarks}{1}%
    \setcounter{codevar}{1}%
}

\definecolor{keywordcolor}{rgb}{0.8,0.1,0.5}
\definecolor{webgreen}{rgb}{0,.5,0}

\lstset{
    language=C++,
    basicstyle=\footnotesize \linespread{0.4} \selectfont, 
    keywordstyle=\color{keywordcolor}\bfseries, 
    identifierstyle=, 
    commentstyle=\color{blue} \textit, 
    stringstyle=\ttfamily, 
    showstringspaces=false,
    captionpos=t,
    escapeinside={/*\#}{\#*/}
}

\renewcommand{\lstlistingname}{代码}
% ----

% 1.5倍行距
\linespread{1.5}

% 段间距
\setlength{\parskip}{0.5\baselineskip}

%重定义一些标题格式（ctex）

%% 一级标题（Chapter）
\CTEXsetup[titleformat={\zihao{3}\heiti}]{chapter}  %章标题3号黑体
\CTEXsetup[nameformat={\zihao{3}\heiti}]{chapter}   %章名3号黑体
% \CTEXsetup[afterskip=0em]{chapter}

%% 二级标题（Section）
\CTEXsetup[format={}]{section}      %取消缺省样式
\CTEXsetup[titleformat={\zihao{-4}\heiti}]{section}  
\CTEXsetup[nameformat={\zihao{-4}\heiti}]{section}
% \CTEXsetup[afterskip=0em]{section}

%% 三级标题（Subsection）
\CTEXsetup[format={}]{subsection}    %取消缺省样式
\CTEXsetup[titleformat={\zihao{-4}\heiti}]{subsection}
\CTEXsetup[nameformat={\zihao{-4}\heiti}]{subsection}
% \CTEXsetup[afterskip=0em]{subsection}


% 页眉页脚
\fancypagestyle{plain}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{1pt}
    \fancyhead[L]{\includegraphics[height=0.04\textheight]{img/emblem}\hspace{1em}}
    \fancyhead[C]{\songti\zihao{-3}内蒙古大学本科毕业论文(设计)}
    \fancyhead[R]{\songti\zihao{5}第 \thepage 页}
}
\pagestyle{plain}



% 文档信息
\newcommand\setUniversityId[1]{\def\@UniversityId{#1}} %学校代码
\newcommand\setCLC[1]{\def\@CLC{#1}} %分类号
\newcommand\setStudentId[1]{\def\@StudentId{#1}} %学号
\newcommand\setSecurity[1]{\def\@Security{#1}}   %密级
\newcommand\setCollege[1]{\def\@College{#1}}     %学院
\newcommand\setThesisTitle[1]{\def\@ThesisTitle{#1}} %论文题目
\newcommand\setThesisTitleEng[1]{\def\@ThesisTitleEng{#1}}  %英文题目
\newcommand\setMajor[1]{\def\@Major{#1}}         %专业
\newcommand\setGrade[1]{\def\@Grade{#1}}         %年级
\newcommand\setAuthor[1]{\def\@Author{#1}} %学生姓名
\newcommand\setAuthorEng[1]{\def\@AuthorEng{#1}}  %学生英文名
\newcommand\setTutor[1]{\def\@Tutor{#1}} %指导教师
\newcommand\setTutorEng[1]{\def\@TutorEng{#1}}  %教师英文名
\newcommand\setYear[1]{\def\@Year{#1}}          %日
\newcommand\setMonth[1]{\def\@Month{#1}}        %月
\newcommand\setDate[1]{\def\@Date{#1}}          %日
\newcommand\setKeywords[1]{\def\@Keywords{#1}}  %关键字
\newcommand\setKeywordsEng[1]{\def\@KeywordsEng{#1}}    %英文关键字

% 信息默认留空，防止编译不通过
\setUniversityId{}
\setCLC{}
\setStudentId{}
\setSecurity{}
\setCollege{}
\setThesisTitle{}
\setThesisTitleEng{}
\setMajor{}
\setGrade{}
\setAuthor{}
\setAuthorEng{}
\setTutor{}
\setTutorEng{}
\setYear{}
\setMonth{}
\setDate{}
\setKeywordsEng{}


\renewcommand\maketitle{
    \cleardoublepage
    \begin{titlepage}
        \zihao{5}\heiti{}学校代码\underline{\makebox[20mm]{\@UniversityId}}\hspace{8cm}
        \zihao{5}\heiti{}学号\underline{\makebox[20mm]{\@StudentId}}

        \zihao{5}\heiti{}分~类~号~\underline{\makebox[20mm]{\@CLC}}\hspace{8cm}
        \zihao{5}\heiti{}密级\underline{\makebox[20mm]{\@Security}}
        \vspace{4cm}
        \begin{center}
            {
                \zihao{-0}\heiti{}本科毕业论文(设计)

                \fbox{\zihao{2}\heiti{}\@ThesisTitle}
                \vspace{0.5cm}

                \zihao{-3}\heiti{}院(系)名称~\underline{\makebox[50mm]{\@College}}

                \zihao{-3}\heiti{}专~业~名~称~~\underline{\makebox[50mm]{\@Major}}

                \zihao{-3}\heiti{}年\hspace{15mm}级~~\underline{\makebox[50mm]{\@Grade}}

                \zihao{-3}\heiti{}学~生~姓~名~~\underline{\makebox[50mm]{\@Author}}

                \zihao{-3}\heiti{}指~导~老~师~~\underline{\makebox[50mm]{\@Tutor}}

                \vspace{1cm}
                \zihao{-3}\heiti{}{\@Year}年{\@Month}月{\@Date}日

            }
        \end{center}
    \end{titlepage}
}

% 用于开始不标号的一章
\newcommand{\specialchapter}[1]{%
    \chapter*{#1}%\markboth{#1}{}
    \addcontentsline{toc}{chapter}{#1}\phantomsection%
}

% 排版中文摘要页
\newenvironment{cabstract}{
    \chapter*{\zihao{-3}\@ThesisTitle}
    %\markboth{\@ThesisTitle}{}
    \zihao{3}\heiti{}摘要\zihao{-4}\songti{}
}{
    \vspace{1cm}
    \zihao{4}\heiti{}关键词~~\zihao{-4}\songti{}\@Keywords
}

% 排版英文摘要页
\newenvironment{eabstract}{
    \chapter*{\zihao{-3}\@ThesisTitleEng}

    \begin{center}
        {\zihao{-4}\@AuthorEng}

        {\zihao{-4}Directed by \@TutorEng}
    \end{center}

    \zihao{3}\tnr{}\textbf{Abstract}\zihao{4}\tnr{}
}{
    \vspace{1cm}
    \zihao{4}\heiti{}\textbf{Keywords}~~\zihao{-4}\songti{}\@KeywordsEng
}

% 处理不浮动的页面
\makeatletter 
  \newcommand\figcaption{\def\@captype{figure}\caption} 
  \newcommand\tabcaption{\def\@captype{table}\caption} 
\makeatother

% 一些实用的小工具~
% 上标引用
\newcommand{\supercite}[1]{\textsuperscript{\cite{#1}}}

%快速输入度(°)
\newcommand{\degree}{$^{\circ}$}




