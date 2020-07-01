NB. flip a sign to have y decrease with pixel value?
pixelR3 =: C + (DR,:-EH) +/ . *~ SUR*(EC*3 o.-:ANG) * WH%~-&(-:WH)
pixelRay=: unit @ E -~ pixelR3

NB. x corresponds to ray
NB. y to sphere (x y z r)
ray_sphere=: 4 : 0
S=. }: y [ r=. {: y
a=. +/ . *~ x              NB. a <=> R*R
b=. +: x +/ . * E - S      NB. b <=> 2*R*(E-S)
c=. (+/ . *~ E - S) - *: r NB. c <=> (E-S)^2 - r^2
disc=. (b*b)-4*a*c
select. (0,*:b) I. disc
case. 0 do. _
case. 1 do. (- b+%:disc)%2*a
case. 2 do. ((%:disc)-b)%2*a end.
)
NB. note: as nice as it would be to use p., not using it seems to be
NB. 10x speedup

NB. x again ray
NB. y is triangle
ray_triangle=: 4 : 0
'v0 v1 v2'=. y
't u v'=. (E-v0) %. (-x) ,. (v1-v0) ,. (v2-v0)
(+ _*0&=) t * (0<u) * (0<v) * (1>u+v)
)