% Context Free Grammars

s(Z):-  append(X,Y,Z),  np(X),  vp(Y). 
 
np(Z):- append(X,Y,Z),  det(X),  n(Y). 
 
vp(Z):- append(X,Y,Z),  v(X),  np(Y). 
 
vp(Z):- v(Z). 
 
det([the]). 
det([a]). 
 
n([woman]). 
n([man]). 
 
v([shoots]).

% this isn't optimal, it reaches some stack overflow

% the consumer paradigm...

cs(X, Z) :- cnp(X, Y),  cvp(Y, Z). 
 
cnp(X, Z):- cdet(X, Y),  cn(Y, Z). 
 
cvp(X, Z):- cv(X, Y),  cnp(Y, Z). 
 
cvp(X, Z):- cv(X, Z). 
 
cdet([the|W],W). 
cdet([a|W],W). 

cn([woman|W],W). 
cn([man|W],W). 

cv([shoots|W],W).

% syntactic sugar for above
% I verified this with trace.

dcg_s  -->  dcg_np, dcg_vp. 
 
dcg_np  -->  dcg_det, dcg_n. 
 
dcg_vp  -->  dcg_v, dcg_np. 
dcg_vp  -->  dcg_v. 
 
dcg_det  -->  [the]. 
dcg_det  -->  [a]. 
 
dcg_n  -->  [woman]. 
dcg_n  -->  [man]. 
 
dcg_v  -->  [shoots].

