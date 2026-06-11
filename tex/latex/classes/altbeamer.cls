\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{altbeamer}[Modified LaTeX beamer class]

%%% Parse options
\RequirePackage{kvoptions}
\SetupKeyvalOptions{prefix=altarticle@}
\DeclareStringOption[french]{babellanguage}
\DeclareBoolOption{unslantgreek}
\DeclareBoolOption{unslantlatin}
\DeclareBoolOption{unslantLatin}
\DeclareBoolOption{defaulttheorems}
\DeclareBoolOption{bibliography}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessKeyvalOptions*
\PassOptionsToPackage{\altarticle@babellanguage}{babel}

%%% Import packages and options
\LoadClass{beamer}
\usepackage{altcommands}
\usefonttheme{professionalfonts}
\setcounter{tocdepth}{2}
\usepackage{framed}
\usepackage{enumitem}
\let\propenumerate\relax
\newlist{propenumerate}{enumerate}{10}
\newcommand{\itemnb}[1]{(\oldstylenums{#1})}
\setlist[propenumerate]{leftmargin=0.075\linewidth,topsep=0pt,nosep,label=\itemnb{\arabic*},beginpenalty=999}
\setlist[enumerate]{topsep=0pt,nosep,label=\itemnb{\arabic*}}
\setlist[itemize]{topsep=0pt,nosep,label=$\to$}
\let\prvitemize\relax
\newlist{prvitemize}{itemize}{10}
\setlist[prvitemize]{topsep=0pt,nosep,leftmargin=*,labelsep=0pt,label=$\to{}$}
\usepackage{multicol}
\setlength\multicolsep{0pt}
\BeforeBeginEnvironment{multicols}{\par\vphantom{Ip}\vspace{-\baselineskip}}
\AfterEndEnvironment{multicols}{\par\vphantom{Ip}\vspace{-\baselineskip}}
\usepackage{tabularray}
\SetTblrInner{rowsep=1pt}
\DefTblrTemplate{caption-tag}{default}{}
\DefTblrTemplate{caption-sep}{default}{}
\DefTblrTemplate{caption-text}{default}{}
\DefTblrTemplate{contfoot-text}{default}{}
\DefTblrTemplate{conthead-text}{default}{}



%%% Sans fonts
\usepackage{sansmath}
\DeclareMathVersion{sans}
\SetSymbolFont{operators}{sans}{OT1}{cmbr}{m}{n}
\SetSymbolFont{letters}{sans}{OML}{cmbrm}{m}{it}
\SetSymbolFont{symbols}{sans}{OMS}{cmbrs}{m}{n}
\SetMathAlphabet{\mathit}{sans}{OT1}{cmbr}{m}{sl}
\SetMathAlphabet{\mathbf}{sans}{OT1}{cmbr}{bx}{n}
\SetMathAlphabet{\mathtt}{sans}{OT1}{cmtl}{m}{n}
\DeclareMathVersion{boldsans}
\SetSymbolFont{operators}{boldsans}{OT1}{cmbr}{b}{n}
\SetSymbolFont{letters}{boldsans}{OML}{cmbrm}{b}{it}
\SetSymbolFont{symbols}{boldsans}{OMS}{cmbrs}{b}{n}
\SetMathAlphabet{\mathit}{boldsans}{OT1}{cmbr}{b}{sl}
\SetMathAlphabet{\mathbf}{boldsans}{OT1}{cmbr}{bx}{n}
\SetMathAlphabet{\mathtt}{boldsans}{OT1}{cmtl}{b}{n}
\newif\IfInSansMode
\let\oldsf\sffamily
\renewcommand*{\sffamily}{\oldsf\mathversion{sans}\InSansModetrue}
\let\oldbf\bfseries
\renewcommand*{\bfseries}{\oldbf\IfInSansMode\mathversion{boldsans}\else\mathversion{bold}\fi\relax}
\renewcommand*{\boldmath}{\oldbf\IfInSansMode\mathversion{boldsans}\else\mathversion{bold}\fi\relax}
\let\oldnorm\normalfont
\renewcommand*{\normalfont}{\oldnorm\InSansModefalse\mathversion{normal}}
\let\oldrm\rmfamily
\renewcommand*{\rmfamily}{\oldrm\InSansModefalse\mathversion{normal}}
\usepackage{xstring,rotating}
\usepackage[most]{tcolorbox}
\hypersetup{colorlinks=true, urlcolor=blue, linkcolor=black}
\newcounter{thmcnt}
\setcounter{thmcnt}{0}
\newtcbtheorem{df}{Définition}{breakable,colback=black!5,colframe=black!15,coltitle=black,fonttitle=\bfseries,separator sign={~\stepcounter{thmcnt}\arabic{thmcnt}~:}}{dff}
\newtcbtheorem{prp}{Proposition}{breakable,colback=black!15,colframe=black!75,fonttitle=\bfseries,separator sign={~\stepcounter{thmcnt}\arabic{thmcnt}~:}}{prpp}
\newtcbtheorem{lm}{Lemme}{breakable,colback=black!10,colframe=black!45,fonttitle=\bfseries,separator sign={~\stepcounter{thmcnt}\arabic{thmcnt}~:}}{lmm}
\newtcbtheorem{prv}{Preuve}{breakable,colback=black!5,colframe=black,fonttitle=\bfseries,separator sign={~\arabic{thmcnt}~:}}{prvv}



%%% Beamer theme
\usetheme{Montpellier}
\setbeamertemplate{headline}
{%
    \begin{beamercolorbox}[wd=\paperwidth,colsep=1.5pt]{upper separation line head}
    \end{beamercolorbox}
    {\usebeamerfont{title in head/foot}%
    \begin{beamercolorbox}[wd=\paperwidth,ht=2.5ex,dp=1.125ex,%
      leftskip=.3cm,rightskip=.3cm plus1fil]{title in head/foot}
      \insertshorttitle
    \end{beamercolorbox}}
    {\usebeamerfont{section in head/foot}%
    \begin{beamercolorbox}[wd=\paperwidth,ht=2.5ex,dp=1.125ex,%
      leftskip=.3cm,rightskip=.3cm plus1fil]{section in head/foot}
      \ifbeamer@tree@showhooks
        \setbox\beamer@tempbox=\hbox{\insertsectionhead}%
        \ifdim\wd\beamer@tempbox>1pt%
          \hskip2pt\raise1.9pt\hbox{\vrule width0.4pt height1.875ex\vrule width 5pt height0.4pt}%
          \hskip1pt%
        \fi%
      \else%  
        \hskip6pt%
      \fi%
      \insertsectionhead
    \end{beamercolorbox}}
    \altarticle@comparestring{\insertsubsectionhead}{}{}
    {\usebeamerfont{subsection in head/foot}%
    \begin{beamercolorbox}[wd=\paperwidth,ht=2.5ex,dp=1.125ex,%
      leftskip=.3cm,rightskip=.3cm plus1fil]{subsection in head/foot}
      \ifbeamer@tree@showhooks
        \setbox\beamer@tempbox=\hbox{\insertsubsectionhead}%
        \ifdim\wd\beamer@tempbox>1pt%
          \hskip9.4pt\raise1.9pt\hbox{\vrule width0.4pt height1.875ex\vrule width 5pt height0.4pt}%
          \hskip1pt%
        \fi%
      \else%  
        \hskip12pt%
      \fi%
      \insertsubsectionhead
    \end{beamercolorbox}}
    \altarticle@comparestring{\insertsubsubsectionhead}{}{}
    {\usebeamerfont{section in head/foot}%
    \begin{beamercolorbox}[wd=\paperwidth,ht=2.5ex,dp=1.125ex,%
      leftskip=.3cm,rightskip=.3cm plus1fil]{subsubsection in head/foot}
      \ifbeamer@tree@showhooks
        \setbox\beamer@tempbox=\hbox{\insertsubsubsectionhead}%
        \ifdim\wd\beamer@tempbox>1pt%
          \hskip16.8pt\raise1.9pt\hbox{\vrule width0.4pt height1.875ex\vrule width 5pt height0.4pt}%
          \hskip1pt%
        \fi%
      \else%  
        \hskip12pt%
      \fi%
      \insertsubsubsectionhead
    \end{beamercolorbox}}
    \begin{beamercolorbox}[wd=\paperwidth,colsep=1.5pt]{lower separation line head}
    \end{beamercolorbox}
}
\setbeamertemplate{navigation symbols}{\scriptsize\color{\numbercolour}\insertframenumber/\inserttotalframenumber}
\usecolortheme{dove}
\setbeamerfont{title}{series=\bfseries,family=\sffamily,size=\Huge,parent=structure}
\DeclareFontFamily{T1}{cmssp}{}
\DeclareFontShape{T1}{cmssp}{m}{n}{<->ecss1000}{}
\DeclareFontShape{T1}{cmssp}{m}{it}{<->ecsi1000}{}
\DeclareFontShape{T1}{cmssp}{b}{n}{<->ecsx1000}{}
\DeclareFontShape{T1}{cmssp}{bx}{n}{<->ecsx1000}{}
\DeclareFontShape{T1}{cmssp}{b}{it}{<->ecso1000}{}
\DeclareFontShape{T1}{cmssp}{bx}{it}{<->ecso1000}{}
\setbeamerfont{frametitle}{series=\bfseries\boldmath,family=\sffamily}
\renewcommand{\sfdefault}{cmssp}
\DeclareEmphSequence{\slshape}


\gdef\appendixtotalframenumber{0}
\def\mainend{-1}
\let\appendixorig\appendix
\def\appendix{
    \xdef\mainend{\theframenumber}
    \immediate\write\@auxout{\string\global\string\@namedef{mainendframenumber}{\mainend}}
    \appendixorig
    \headcommand{\gdef\inserttotalframenumber{\appendixtotalframenumber}}%
    \setcounter{framenumber}{0}
}
\def\pageatend{
    \xdef\appendixend{\theframenumber}
    \ifnum\mainend>0%
        \immediate\write\@auxout{\string\global\string\@namedef{appendixtotalframenumber}{\appendixend}}%
        \immediate\write\@auxout{\string\global\string\@namedef{inserttotalframenumber}{\mainend}}%
        \immediate\write\@auxout{\string\@writefile{nav}{\noexpand \headcommand{%
            \noexpand\gdef\noexpand\inserttotalframenumber{\mainend}}}}%
        \immediate\write\@auxout{\string\@writefile{nav}{\noexpand \headcommand{%
            \noexpand\gdef\noexpand\appendixtotalframenumber{\appendixend}}}}%
    \else
    \fi
}
\AtEndDocument{\pageatend}



%%% Theorems
\newcommand{\textref}[1]{\ref{t@#1}}
\newcommand{\thmref}[1]{\ifcsdef{r@t@#1}{\textref{#1}}{\autoref{#1}}}
\newcommand{\thmnameref}[1]{{\def\@displaythmname{true}\ifcsdef{r@t@#1}{\textref{#1}}{\autoref{#1}}}}
\def\@displaythmname{}
\robustify{\@displaythmname}
\newif\ifthmname
\thmnametrue

\newcommand{\incrementcounter}[2]{%
    \altarticle@comparestring{\arabic{#1}}{\arabic{#2}}{\relax}{\refstepcounter{#2}\incrementcounter{#1}{#2}}%
}

\newcommand{\createtheorem}[6]{%
    \@ifundefined{c@thms#5counter}{
        \newcounter{thms#5counter}
    }{}
    \setcounter{thms#5counter}0
    \@ifundefined{c@#1}{%
        \newcounter{#1}%
    }{}%
    \@ifundefined{c@#1star}{%
        \newcounter{#1star}%
    }{}%
    \if\relax\detokenize{#5}\relax%
    \else%
        \counterwithin{thms#5counter}{#5}
        \counterwithin{#1}{#5}%
      \fi%
    \setcounter{#1}{0}%
    \expandafter\let\csname #1autorefname\endcsname\relax%
    \expandafter\let\csname #1starautorefname\endcsname\relax%
    \expandafter\let\csname #1\endcsname\relax%
    \expandafter\let\csname @#1star\endcsname\relax%
    \expandafter\let\csname @#1startmp\endcsname\relax%
    \expandafter\let\csname @#1startmptmp\endcsname\relax%
    \expandafter\let\csname @#1\endcsname\relax%
    \expandafter\let\csname @#1tmp\endcsname\relax%
    \expandafter\let\csname @#1tmptmp\endcsname\relax%
    \expandafter\newcommand\csname #1autorefname\endcsname{#4}%
    \expandafter\newcommand\csname #1starautorefname\endcsname{#4}%
    \expandafter\newcommand\csname #1\endcsname{%
        \@ifstar%
            {\csname @#1startmptmptmp\endcsname}%
            {\csname @#1tmptmptmp\endcsname}%
    }%
    \expandafter\newcommand\csname @#1tmptmptmp\endcsname[1][]{%
        \def\thmoptargI{##1}%
        \csname @#1tmptmp\endcsname%
    }%
    \expandafter\newcommand\csname @#1tmptmp\endcsname[1][]{%
        \def\thmoptargII{##1}%
        \csname @#1tmp\endcsname%
    }%
    \expandafter\newcommand\csname @#1tmp\endcsname[1][]{%
        \def\thmoptargIII{##1}%
        \csname @#1\endcsname%
    }%
    \expandafter\newcommand\csname @#1\endcsname[2][]{%
        \par%
        \ifdefempty{\thmoptargI}{%
            \def\argI{##2}%
        }{%
            \def\argI{\thmoptargI}%
        }%
        \ifdefempty{\thmoptargIII}{%
            \def\tocargII{##2}%
            \def\argII{##2}%
        }{%
            \def\tocargII{\thmoptargIII}%
            \def\argII{\labelcomparestring{\toggleboldmath}{true}{##2}{\thmoptargIII}}%
        }%
        \altarticle@comparestring{#6}{true}{%
            \stepcounter{thms#5counter}%
            \incrementcounter{thms#5counter}{#1}%
        }{%
            \refstepcounter{#1}%
        }%
        \if\relax\detokenize{##2}\relax%
            \textbf{\boldmath#2 \csname the#1\endcsname{}~:}\ifdefempty{\argI}{}{\label{#3 \argI}}{} %
        \else%
            \altarticle@comparestring{##1}{true}{%
                \textbf{\boldmath#2 \csname the#1\endcsname{}\ifthmname{} (\textsl{##2})\fi~:}\ifdefempty{\argI}{}{\label{#3 \argI}}{} %
            }{%
                \textbf{\boldmath#2 \csname the#1\endcsname{}\ifthmname{} (\textsl{##2})\fi~:}\ifdefempty{\argI}{}{\label{#3 \argI}\def\@currentlabel{\altarticle@comparestring{\@displaythmname}{true}{#4 }{}\thmoptargII\argII}\label{t@#3 \argI}}\addcontentsline{to#1}{thm}{\ignorespaces{\noexpand\expandafter\noexpand\MakeUppercase\thmoptargII\tocargII}}{} %
            }%
        \fi%
    }%
    \expandafter\newcommand\csname @#1startmptmptmp\endcsname[1][]{%
        \def\thmoptargI{##1}%
        \csname @#1startmptmp\endcsname%
    }%
    \expandafter\newcommand\csname @#1startmptmp\endcsname[1][]{%
        \def\thmoptargII{##1}%
        \csname @#1startmp\endcsname%
    }%
    \expandafter\newcommand\csname @#1startmp\endcsname[1][]{%
        \def\thmoptargIII{##1}%
        \csname @#1star\endcsname%
    }%
    \expandafter\newcommand\csname @#1star\endcsname[2][]{%
        \par%
        \refstepcounter{#1star}%
        \ifdefempty{\thmoptargI}{%
            \def\argI{##2}
        }{%
            \def\argI{\thmoptargI}%
        }%
        \ifdefempty{\thmoptargIII}{%
            \def\tocargII{##2}
            \def\argII{##2}
        }{%
            \def\tocargII{\thmoptargIII}
            \def\argII{\labelcomparestring{\toggleboldmath}{true}{##2}{\thmoptargIII}}%
        }%
        \if\relax\detokenize{##2}\relax%
            \textbf{\boldmath#2~:}{} %
        \else%
            \altarticle@comparestring{##1}{true}{%
                \textbf{\boldmath#2\ifthmname{} (\textsl{##2})\fi~:}{} %
            }{%
                \textbf{\boldmath#2\ifthmname{} (\textsl{##2})\fi~:}\ifdefempty{\argI}{}{\def\@currentlabel{\thmoptargII\argII}\label{t@#3 \argI}}{}\addcontentsline{to#1}{thm}{\ignorespaces{\noexpand\expandafter\noexpand\MakeUppercase\thmoptargII\tocargII}}{} %
            }%
        \fi%
    }%
}
%% Proof
\newenvironment{preuve}[2][]%
{%
    \par%
    \altarticle@comparestring{#1}{}%
        {\def\argI{\textbf{\boldmath Preuve (\textsl{\thmref{#2}})~:}}}%
        {\def\argI{\textbf{\boldmath Preuve (\textsl{\thmref{#2}}#1)~:}}}%
    \begin{leftbartitle}{\argI}%
        \def\footnotetext{\savefootnote}%
        \small%
        \setlength{\belowdisplayskip}{0pt}\setlength{\belowdisplayshortskip}{0pt}\setlength{\abovedisplayskip}{0pt}\setlength{\abovedisplayshortskip}{0pt}%
        \let\textitemize\itemize%
        \let\itemize\prvitemize%
}{%
    \end{leftbartitle}%
}%
\def\proof{\preuve}
%% Code adapted from framed.sty
\chardef\FrameRestore=\catcode`\| % for debug
\catcode`\|=\catcode`\% % (debug: insert space after backslash)

\OuterFrameSep=-4.5pt
\FrameSep=0pt

\def\AltMakeFramed#1{\par
 % measure added width and height; call result \width and \height
 \fb@sizeofframe\FrameCommand
 \let\width\fb@frw \let\height\fb@frh
 % insert pre-penalties and skips
 \begingroup
 \skip@\lastskip
 \if@nobreak\else 
    \penalty9999 % updates \page parameters
    \ifdim\pagefilstretch=\z@ \ifdim\pagefillstretch=\z@
       % not infinitely stretchable, so encourage a page break here
       \edef\@tempa{\the\skip@}%
       \ifx\@tempa\zero@glue \penalty-30
       \else \vskip-\skip@ \penalty-30 \vskip\skip@
    \fi\fi\fi
    \penalty\z@
    % Give a stretchy breakpoint that will always be taken in preference
    % to the \penalty 9999 used to update page parameters.  The cube root
    % of 10000/100 indicates a multiplier of 0.21545, but the maximum 
    % calculated badness is really 8192, not 10000, so the multiplier
    % is 0.2301. 
    \advance\skip@ \z@ plus-.5\baselineskip
    \advance\skip@ \z@ plus-.231\height
    \advance\skip@ \z@ plus-.231\skip@
    \advance\skip@ \z@ plus-.231\OuterFrameSep
    \vskip-\skip@ \penalty 1800 \vskip\skip@
 \fi
 %\addvspace{\OuterFrameSep}%
 \endgroup
 % clear out pending page break
 \penalty\@M \vskip 2\baselineskip \vskip\height
 \penalty9999 \vskip -2\baselineskip \vskip-\height
 \penalty9999 % updates \pagetotal
|\message{After clearout, \pagetotal=\the\pagetotal, \pagegoal=\the\pagegoal. }%
 \fb@adjheight 
 \setbox\@tempboxa\vbox\bgroup
   #1% Modifications to \hsize (can use \width and \height)
   \textwidth\hsize \columnwidth\hsize
}

\def\endMakeFramed{\par
     \kern\z@
     \hrule\@width\hsize\@height\z@ % possibly bad
     \penalty-100 % (\hrule moves depth into height)
 \egroup
%%%   {\showoutput\showbox\@tempboxa}%
 \begingroup 
   \fb@put@frame\FrameCommand\FirstFrameCommand
 \endgroup
 \@minipagefalse % In case it was set and not cleared
}

% \fb@put@frame takes the contents of \@tempboxa and puts all, or a piece,
% of it on the page with a frame (\FrameCommand, \FirstFrameCommand,
% \MidFrameCommand, or \LastFrameCommand).  It recurses until all of 
% \@tempboxa has been used up. (\@tempboxa must have zero depth.)
% #1 = attempted framing command, if no split
% #2 = framing command if split
% First iteration: Try to fit with \FrameCommand. If it does not fit,
% split for \FirstFrameCommand.
% Later iteration: Try to fit with \LastFrameCommand. If it does not
% fit, split for \MidFrameCommand.
\def\fb@put@frame#1#2{\displayfootnotes\relax
 \ifdim\pagegoal=\maxdimen \pagegoal\vsize \fi
|   \message{=============== Entering putframe ====================^^J
|     \pagegoal=\the\pagegoal,  \pagetotal=\the\pagetotal. }%
 \ifinner
   \fb@putboxa#1%
   \fb@afterframe
 \else
  \dimen@\pagegoal \advance\dimen@-\pagetotal % natural space left on page
  \ifdim\dimen@<2\baselineskip % Too little room on page
|   \message{Page has only \the\dimen@\space room left; eject. }%
    \eject \fb@adjheight \fb@put@frame#1#2%
  \else % there's appreciable room left on the page
     \fb@sizeofframe#1%
|    \message{\string\pagetotal=\the\pagetotal,
|        \string\pagegoal=\the\pagegoal,
|        \string\pagestretch=\the\pagestretch,
|        \string\pageshrink=\the\pageshrink,
|        \string\fb@frh=\the\fb@frh. \space}
|    \message{^^JBox of size \the\ht\@tempboxa\space}%
     \begingroup % temporarily set \dimen@ to be...
     \advance\dimen@.8\pageshrink  % maximum space available on page
     \advance\dimen@-\fb@frh\relax % max space available for frame's contents
%%% LOOKS SUBTRACTED AND ADDED, SO DOUBLE ACCOUNTING!
     \expandafter\endgroup
     % expand \ifdim, then restore \dimen@ to real room left on page
     \ifdim\dimen@>\ht\@tempboxa % whole box does fit
|       \message{fits in \the\dimen@. }%
        % ToDo: Change this to use vsplit anyway to capture the marks
        % MERGE THIS WITH THE else CLAUSE!!!
        \fb@putboxa#1%
        \fb@afterframe
     \else % box must be split
|       \message{must be split to fit in \the\dimen@. }%
        % update frame measurement to use \FirstFrameCommand or \MidFrameCommand
        \fb@sizeofframe#2%
        \setbox\@tempboxa\vbox{% simulate frame and flexiblity of the page:
           \vskip \fb@frh \@plus\pagestretch \@minus.8\pageshrink
           \kern137sp\kern-137sp\penalty-30
           \unvbox\@tempboxa}%
        \edef\fb@resto@set{\boxmaxdepth\the\boxmaxdepth 
                           \splittopskip\the\splittopskip}%
        \boxmaxdepth\z@ \splittopskip\z@
|       \message{^^JPadded box of size \the\ht\@tempboxa\space split to \the\dimen@}%
        % Split box here
        \setbox\tw@\vsplit\@tempboxa to\dimen@
|       \toks99\expandafter{\splitfirstmark}%
|       \toks98\expandafter{\splitbotmark}%
|       \message{Marks are: \the\toks99, \the\toks98. }%
        \setbox\tw@\vbox{\unvbox\tw@}% natural-sized
|       \message{Natural height of split box is \the\ht\tw@, leaving 
|          \the\ht\@tempboxa\space remainder. }%
        % If the split-to size > (\vsize-\topskip), then set box to full size.
        \begingroup
        \advance\dimen@\topskip
        \expandafter\endgroup
        \ifdim\dimen@>\pagegoal
|         \message{Frame is big -- Use up the full column. }%
          \dimen@ii\pagegoal
          \advance\dimen@ii -\topskip
          \advance\dimen@ii \FrameHeightAdjust\relax
        \else  % suspect this is implemented incorrectly:
          % If the split-to size > feasible room_on_page, rebox it smaller.
          \advance\dimen@.8\pageshrink
          \ifdim\ht\tw@>\dimen@
|           \message{Box too tall; rebox it to \the\dimen@. }%
            \dimen@ii\dimen@
          \else % use natural size
            \dimen@ii\ht\tw@
          \fi
        \fi
        % Re-box contents to desired size \dimen@ii
        \advance\dimen@ii -\fb@frh
        \setbox\tw@\vbox to\dimen@ii \bgroup
        % remove simulated frame and page flexibility:
        \vskip -\fb@frh \@plus-\pagestretch \@minus-.8\pageshrink
        \unvbox\tw@ \unpenalty\unpenalty
        \ifdim\lastkern=-137sp % whole box went to next page
|          \message{box split at beginning! }%
           % need work here???
           \egroup \fb@resto@set \eject % (\vskip for frame size was discarded) 
           \fb@adjheight
           \fb@put@frame#1#2% INSERTED ???
        \else % Got material split off at the head
           \egroup \fb@resto@set
           \ifvoid\@tempboxa % it all fit after all
|             \message{box split at end! }%
              \setbox\@tempboxa\box\tw@
              \fb@putboxa#1%
              \fb@afterframe
           \else % it really did split
|             \message{box split as expected. Its reboxed height is \the\ht\tw@. }%
              \ifdim\wd\tw@>\z@
                \wd\tw@\wd\@tempboxa
                \centerline{#2{\box\tw@}}%  ??? \centerline bad idea
              \else
|               \message{Zero width means likely blank. Don't frame it (guess)}%
                \box\tw@
              \fi
              \hrule \@height\z@ \@width\hsize
              \eject
              \fb@adjheight
              \fb@put@frame\LastFrameCommand\MidFrameCommand
  \fi\fi\fi\fi\fi
}

\def\fb@putboxa#1{%
  \ifvoid\@tempboxa
    \PackageWarning{framed}{Boxa is void -- discard it. }%
  \else
|   \message{Frame and place boxa. }%
|   %{\showoutput\showbox\@tempboxa}%
    \centerline{#1{\box\@tempboxa}}%
  \fi
}

\def\fb@afterframe{%
    \nointerlineskip \null %{\showoutput \showlists}
    \penalty-30 \vskip\OuterFrameSep \relax
}

% measure width and height added by frame (#1 = frame command)
% call results \fb@frw and \fb@frh
% todo: a mechanism to handle wide frame titles 
\newdimen\fb@frw
\newdimen\fb@frh
\def\fb@sizeofframe#1{\begingroup
 \setbox\z@\vbox{\vskip-5in \hbox{\hskip-5in 
   #1{\hbox{\vrule \@height 4.7in \@depth.3in \@width 5in}}}%
   \vskip\z@skip}%
|  \message{Measuring frame addition for \string#1 in \@currenvir\space 
|    gives ht \the\ht\z@\space and wd \the\wd\z@. }%
|  %{\showoutput\showbox\z@}%
 \global\fb@frw\wd\z@ \global\fb@frh\ht\z@
 \endgroup
}

\def\fb@adjheight{%
  \vbox to\FrameHeightAdjust{}% get proper baseline skip from above.
  \penalty\@M \nointerlineskip
  \vskip-\FrameHeightAdjust
  \penalty\@M} % useful for tops of pages

\edef\zero@glue{\the\z@skip}

\catcode`\|=\FrameRestore

% Provide configuration commands:
\providecommand\FrameCommand{%
 \setlength\fboxrule{\FrameRule}\setlength\fboxsep{\FrameSep}%
 \fbox}
\@ifundefined{FrameRule}{\newdimen\FrameRule \FrameRule=\fboxrule}{}
\@ifundefined{FrameSep} {\newdimen\FrameSep  \FrameSep =0pt}{}
\providecommand\FirstFrameCommand{\FrameCommand}
\providecommand\MidFrameCommand{\FrameCommand}
\providecommand\LastFrameCommand{\FrameCommand}

% Height of frame above first baseline when frame starts a page:
\providecommand\FrameHeightAdjust{6pt}

% \FrameRestore has parts of \@parboxrestore, performing a similar but 
% less complete restoration of the default layout.  See how it is used in
% the "settings" argument of \MakeFrame.  Though not a parameter, \hsize 
% should be set to the desired total line width available inside the
% frame before invoking \FrameRestore.  
\def\FrameRestore{%
   \let\if@nobreak\iffalse
   \let\if@noskipsec\iffalse
   \let\-\@dischyph
   \let\'\@acci\let\`\@accii\let\=\@acciii
   %  \message{FrameRestore:
   %    \@totalleftmargin=\the \@totalleftmargin,
   %    \rightmargin=\the\rightmargin, 
   %    \@listdepth=\the\@listdepth.  }%
   % Test if we are in a list (or list-like paragraph)
   \ifnum \ifdim\@totalleftmargin>\z@ 1\fi  
          \ifdim\rightmargin>\z@ 1\fi
          \ifnum\@listdepth>\z@ 1\fi 0>\z@
     %     \message{In a list: \linewidth=\the\linewidth, \@totalleftmargin=\the\@totalleftmargin,
     %       \parshape=\the\parshape, \columnwidth=\the\columnwidth, \hsize=\the\hsize, 
     %       \labelwidth=\the\labelwidth. }%
     \@setminipage % snug fit around the item.  I would like this to be non-global.
     % Now try to propageate changes of width from \hsize to list parameters.
     % This is deficient, but a more advanced way to indicate modification to text 
     % dimensions is not (yet) provided; in particular, no separate left/right
     % adjustment.
     \advance\linewidth-\columnwidth \advance\linewidth\hsize
     \parshape\@ne \@totalleftmargin \linewidth
   \else % Not in list
     \linewidth=\hsize
     %\message{No list, set \string\linewidth=\the\hsize. }%
   \fi
   \sloppy
}
%% Environment for proofs
\newlength\prooftitleline%
\setlength{\prooftitleline}{\dimexpr\linewidth-\FrameSep-5.5pt\relax}%
\newcommand\leftbartitleframe[2]{%
    \vbox{\nobreak\vspace{\OuterFrameSep}%
    \hbox to \prooftitleline{\hskip\FrameSep\hbox{\strut{#1}}\hfil}%
    \nobreak \nointerlineskip%
    \hbox{\hskip\FrameSep\hspace{0.04\linewidth}\vline\hspace{0.01\linewidth}%
        {\small#2}%
    \hskip\FrameSep}%
    \vskip\FrameSep%
    }%
}
\newcommand\leftbartitleframecont[1]{%
    \vbox{\nobreak\vspace{\OuterFrameSep}\nointerlineskip%
    \hbox{\hskip\FrameSep\hspace{0.04\linewidth}\vline\hspace{0.01\linewidth}%
        {\small#1}%
    \hskip\FrameSep}%
    \vskip\FrameSep%
    }%
}
\newenvironment{leftbartitle}[1]{%
    \def\FrameCommand{\leftbartitleframe{#1}}%
    \def\FirstFrameCommand{\leftbartitleframe{#1}}%
    \def\MidFrameCommand{\leftbartitleframecont}%
    \def\LastFrameCommand{\leftbartitleframecont}%
    \AltMakeFramed{\advance\hsize-\width \FrameRestore}%
}{\endMakeFramed}
%% Default theorems
\ifaltarticle@defaulttheorems
    \createtheorem{axiome}{Axiome}{axi}{axiome}{section}{true}
    \createtheorem{corollaire}{Corollaire}{cor}{corollaire}{section}{true}
    \createtheorem{definition}{Définition}{def}{définition}{section}{true}
    \createtheorem{lemme}{Lemme}{lm}{lemme}{section}{true}
    \createtheorem{notation}{Notation}{not}{notation}{section}{true}
    \createtheorem{proposition}{Proposition}{prop}{proposition}{section}{true}
    \createtheorem{remarque}{Remarque}{rem}{remarque}{section}{true}
    \createtheorem{theoreme}{Théorème}{thm}{théorème}{section}{true}
\fi
%% Theorem table
\newcommand*\l@thm{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\theoremtable[2]{%
    \section*{#1%
        \@mkboth{%
           \noexpand\expandafter\noexpand\MakeUppercase#1}{\noexpand\expandafter\noexpand\MakeUppercase#1}}%
    \@starttoc{to#2}%
    }



%%% Figures
\altarticle@comparestring\altarticle@babellanguage{french}{
    \renewenvironment{table}
        {\@float{tableau}}
        {\end@float}
    \def\ext@tableau{lot}
    \newcommand*\l@tableau{\@dottedtocline{1}{1.5em}{2.3em}}
}{}
\def\@space{ }
\let\caption\relax
\newcommand{\caption}[2][]{%
    \par%
    \@ifundefined{c@\@captype}{%
        \newcounter{\@captype}%
        \setcounter{\@captype}0%
    }{}%
    \global\expandafter\edef\csname \@captype autorefname\endcsname{\@captype}%
    \if\relax\detokenize{#1}\relax%
        \def\argI{#2}%
    \else%
        \def\argI{#1}%
    \fi%
    \refstepcounter{\@captype}%
    \label{\@captype\@space\argI}\addcontentsline{\csname ext@\@captype\endcsname}{\@captype}{\protect\numberline{\csname the\@captype\endcsname}{\ignorespaces{\expandafter\MakeUppercase\argI}}}\expandafter\MakeUppercase\@captype{} \csname the\@captype\endcsname{} -- \textsl{#2}%
}
\let\subcaption\relax
\newcommand{\subcaption}[2][]{%
    \@ifundefined{l@sub\@captype}{%
        \def\l@sub\@captype{\@dottedtocline{2}{3.8em}{3.2em}}%
    }{}%
    \@ifundefined{c@sub\@captype}{%
        \newcounter{sub\@captype}%
        \counterwithin{sub\@captype}{\@captype}%
        \setcounter{sub\@captype}0%
        \global\expandafter\edef\csname sub\@captype autorefname\endcsname{\@captype}%
    }{}%
    \if\relax\detokenize{#1}\relax%
        \def\argI{ #2}%
    \else%
        \def\argI{ #1}%
    \fi%
    \addtocounter{\@captype}{1}%
    \refstepcounter{sub\@captype}%
    \label{sub\@captype\argI}\addcontentsline{\csname ext@\@captype\endcsname}{sub\@captype}{\protect\numberline{\csname the\@captype\endcsname}{\ignorespaces{\noexpand\expandafter\noexpand\MakeUppercase\argI}}}\expandafter\MakeUppercase\@captype{} \csname thesub\@captype\endcsname{} -- \textsl{#2}%
    \addtocounter{\@captype}{-1}%
}



%%% Footnotes
\let\kernFFN\relax
\newcommand{\kernFFN}{{ }}
\let\insertfootnotemarkFB\relax
\newcommand\insertfootnotemarkFB
  {\rule\z@\footnotesep%
   \makebox[\parindentFFN][l]{\hfill\@thefnmark\dotFFN}%
   \kernFFN
  }

\newcounter{footnotemarkcounter}
\setcounter{footnotemarkcounter}0
\newcounter{footnotetextcounter}
\setcounter{footnotetextcounter}0
\newcommand{\footnotetextcounterautorefname}{note}

\renewcommand{\footnotemark}{\refstepcounter{footnotemarkcounter}\label{footnotemark \thefootnotemarkcounter}{\textsuperscript{\textit{\oldstylenums{\ref{footnotetext \thefootnotemarkcounter}}}}}}
\let\oldfootnotetext\footnotetext
\renewcommand{\footnotetext}[2][]{{\addtocounter{footnotetextcounter}{1}\def\thefootnote{\textit{\oldstylenums{\ref{footnotemark \thefootnotetextcounter}}}}\oldfootnotetext[\thefootnotetextcounter]{\addtocounter{footnotetextcounter}{-1}\refstepcounter{footnotetextcounter}\label{footnotetext \thefootnotetextcounter}\altarticle@comparestring{#1}{}{}{\label{footnote #1}}#2}}}
\renewcommand{\footnote}{\footnotemark\footnotetext}

% Collect notes in environments
\def\savedfootnotes{}%
\def\@savedfootnotes{}%
\newcommand{\savefootnote}[1]{\xdef\savedfootnotes{\expandonce{\savedfootnotes{\noexpand{\ifnum\fpeval{\thepage+1}>\getpagerefnumber{footnotemark \fpeval{\thefootnotetextcounter+1}}\relax\footnotetext{#1}\else\savefootnote{#1}\fi}}}}}
\newcommand{\displayfootnotes}{{\edef\@savedfootnotes{\expandonce{\savedfootnotes}}\xdef\savedfootnotes{}\@savedfootnotes}}



%%% Set lenghts
\AtBeginDocument{
    \setlength{\belowdisplayskip}{0pt}
    \setlength{\belowdisplayshortskip}{0pt}
    \setlength{\abovedisplayskip}{0pt}
    \setlength{\abovedisplayshortskip}{0pt}
    \setlength{\parindent}{0pt}
}
\setlength{\dotsep}{5.5pt}
\setlength{\dotlift}{1.5pt}
\setlength{\matsep}{5pt}
\setlength{\matmin}{25pt}




%%% Sans operators
\let\serifsum\oldsum
\let\serifprod\oldprod
\newcommand*{\oldsum}{\DOTSB\mathop{\mathpalette{\sans@op\oldsum{0.9}}\sans@sum}\slimits@}
\newcommand*{\oldprod}{\DOTSB\mathop{\mathpalette{\sans@op\oldprod{0.8}}\sans@prod}\slimits@}
\newcommand*{\sans@op}[4]{%
    \sbox0{\m@th$\m@th#3#1$}%
    \unitlength\ht0
    \advance\unitlength\dp0
    \vcenter{%
        \hbox{%
            \begin{picture}(#2,1)
                \linethickness{%
                    \ifx#3\displaystyle2\fontdimen8\textfont\else
                    \ifx#3\textstyle1.7\fontdimen8\textfont\else
                    \ifx#3\scriptstyle1.6\fontdimen8\scriptfont\else
                    1.6\fontdimen8\scriptscriptfont\fi\fi\fi 3}
                \roundcap
                \roundjoin
                #4
            \end{picture}%
        }%
    }%
}
\newcommand*{\sans@sum}{%
    \polyline(0.83,0.07)(0.08,0.07)(0.45,0.5)(0.08,0.93)(0.83,0.93)%
}
\newcommand*{\sans@prod}{%
    \put(0.05,0.93){\line(1,0){0.7}}%
    \put(0.19,0.07){\line(0,1){0.86}}%
    \put(0.61,0.07){\line(0,1){0.86}}%
}