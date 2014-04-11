\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{imuthesis}[2014/4/10 v0.1beta Inner Mongolia University Thesis document class]

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


% 页眉页脚
\fancypagestyle{plain}{\fancyhf{}\renewcommand{\headrulewidth}{0pt}}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\includegraphics[height=0.04\textheight]{img/emblem}\hspace{1em}}
\fancyhead[C]{\songti\zihao{-3}内蒙古大学本科毕业论文(设计)}
\fancyhead[R]{\songti\zihao{5}第 \thepage 页}

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

%重定义一些标题格式（ctex def）

%% 一级标题（Chapter）
\CTEXsetup[titleformat={\zihao{3}\heiti}]{chapter} %章节标题3号黑体


%\def\CTEX@chapter@format{\centering}
%\def\CTEX@chapter@nameformat{\huge\bfseries}
%\def\CTEX@chapter@aftername{\quad}
%\def\CTEX@chapter@titleformat{\huge\bfseries}
%\def\CTEX@chapter@beforeskip{50\p@}
%\def\CTEX@chapter@afterskip{40\p@}
%\def\CTEX@chapter@indent{\z@}



\renewcommand\maketitle{
    \cleardoublepage
    \begin{titlepage}
        \zihao{5}\heiti{}学校代码\underline{\makebox[20mm]{\@UniversityId}}\hspace{8cm}
        \zihao{5}\heiti{}学号\underline{\makebox[20mm]{\@StudentId}}

        \zihao{5}\heiti{}分~类~号~\underline{\makebox[20mm]{\@CLC}}\hspace{8cm}
        \zihao{5}\heiti{}密级\underline{\makebox[20mm]{\@Security}}
        \vspace{5cm}
        \begin{center}
            {
                \zihao{-0}\heiti{}本科毕业论文(设计)
                \vspace{1cm}

                \fbox{\zihao{2}\heiti{}\@ThesisTitle}
                \vspace{4cm}

                \zihao{-3}\heiti{}院(系)名称~\underline{\makebox[50mm]{\@College}}

                \zihao{-3}\heiti{}专~业~名~称~~\underline{\makebox[50mm]{\@Major}}

                \zihao{-3}\heiti{}年\hspace{15mm}级~~\underline{\makebox[50mm]{\@Grade}}

                \zihao{-3}\heiti{}学~生~姓~名~~\underline{\makebox[50mm]{\@Author}}

                \zihao{-3}\heiti{}指~导~老~师~~\underline{\makebox[50mm]{\@Tutor}}

                \vspace{4cm}
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



