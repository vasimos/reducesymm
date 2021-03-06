siminos/00ReadMe.txt
$Author$
$Date$
--------------------------------------------------------

Evangelos Siminos thesis, publications and working notes
========================================================

thesis/
	pdflatex thesis
	
rpo_ks/
    Cvitanovi\'c, Davidchack and Siminos
    "State space geometry of a spatio-temporally chaotic
     Kuramoto-Sivashinsky flow"

CLE/00ReadMe.txt
    Siminos and Cvitanovi\'c
    "Continuous symmetry reduction
        and return maps for higher-dimensional flows"

bibtex/siminos.bib
	one bibliography for all projects

figs/
    one directory for thesis and blog figures .eps figures
    needed for compatibility with articles, ChaosBook.
    When creating a new version, please use the SAME name (so
    it propagates to publications etc. as well, without messing
    around with renaming it)

Fig/
    copied from ChaosBook.org (do not edit here)

figsSrc/
	one directory for source programs for all figures
	(or .txt files explain how to regenerate them if needed
     from the other repository, siminos????, with code)

inputs/
	one directory for all Siminos specific macros

jobs/
	Siminos eternal job search info.

thesis/
	Siminos Thesis
tex/
	customized tex and bibtex style files

WWW/
    (renamed so in Predrag's setup)
    Siminos home pages (tres elegantes)
	repository siminoswww

presentations/
    all symmetry reduction talks and posters
    Tufts10/    Predrag seminar, 2010-04-02

scripts/
    potentially useful scripts

blog/
    all matters pertaining to symmetry reduction reading

lyapunov/
    all matters pertaining to 'covariant Lyapunov vectors'

froehlich/
    Stefan Froehlich blog, papers

chao/
    Chao's blog

CV/
	Siminos CV

2ChaosBook/2CB.tex
    staging ground for insertions to ChaosBook.org

---------------------------------------------------------------
TO FIX:

---------------------------------------------------------------
NOTES:

-- maths classification for a paper about Lorenz system:
   MSC: Primary: 37C45, 37D40; Secondary: 37D45


Time stamp:
----------

To have svn time-stamp file "someFile.type", include the contents of
	thesis/chapter/svnHeader.txt
into the file, and then
	svn propset svn:keywords "Date Author" someFile.type

----------------------------------------------------------------
HISTORY:
						Predrag Jul 26 2008
    created this file

----------------------------------------------------------------
FIXED:
						Evangelos Dec 4 2010	
	emaildict for correct reply-to address

-- made ...
