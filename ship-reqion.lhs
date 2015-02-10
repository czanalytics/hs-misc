\documentclass{article}

%include lhs2TeX.fmt
%include lhs2TeX.sty
%include spacing.fmt

% Use: lhs2TeX ship-region.lhs > tmp.tex; latex tmp.tex; dvipdf tmp.dvi
% Use: ghci -optL -q > :load ship-region.lhs
% Use: ghc -optL -q ship-region.lhs > ./ship-region

\begin{document}

These notes are based on

E.Carlson et al.: {\it An Experiment Using Haskell 
to Prototype "Geometric Region Servers" for Navy Command and Control} (1993),
Intermetrics Report @IR-MA-1390@ /
Research Report @YALEU/DCS/RR-1031@.

\begin{verbatim}
(C) Copyright  Intermetrics 1993
Condition of Use, Duplication and Distribution:

Permission to use, copy modify and distribute the software contained in this volume for any
personal, educational, goverment or commercial use without fee is hereby granted provided
that:

a) This copyright notice is retained in both source code and supporting documentation.

b) Modified versions of this software are redistributed only if accompanied by a complete history
of modification made. The intention here is to give appropriate credite to those involved, while 
simulataneously ensuring that any recipient can determine the origin of the software.

c) The same conditions are also applied to any software systerm and/or documentation derived either
full or in part from this document.

This software, analysis and documentation are provided "as is" without express or implied
warranty.
\end{verbatim}

Prototype 3 p A-2

\begin{code}
data Vector a = Pt a a deriving (Eq, Show)
type Point = Vector Float
type Velocity = Vector Float

origin :: Point
origin = Pt 0 0
\end{code}

These definitions can be extended to 3D.

\begin{code}
instance Num a => Num (Vector a) where
     Pt x y + Pt u v = Pt (x+u) (y+v)
\end{code}

\begin{code}
loc1 :: Point
loc1 = Pt 1 2

newLoc :: Point -> Point -> Point
newLoc p1 p2 = p1 + p2

--loc2 = newLoc origin loc1
\end{code}



\begin{code}
main :: IO ()
main = print (newLoc origin loc1)
\end{code}


\end{document}