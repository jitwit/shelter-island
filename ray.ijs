NB. flip a sign to have y decrease with pixel value?
pixelR3 =: C + (DR,:EH) +/ . *~ SUR*(EC*3 o.-:ANG) * WH%~-&(-:WH)
pixelRay=: unit @ E -~ pixelR3

NB. x corresponds to ray
NB. y to sphere (x y z r)
ray_sphere=: 4 : 0
S=. }: y [ r=. {: y
a=. (+/ . *~ E - S) - *: r NB. a <=> (E-S)^2 - r^2
b=. +: x +/ . * E - S      NB. b <=> 2*R*(E-S)
c=. +/ . *~ x              NB. c <=> R*R
disc=. (b*b)-4*a*c
select. ((0,*:b) I. disc)
case. 0 do. 0
case. 1 do. (- b+%:disc)%2*c
case. 2 do. ((%:disc)-b)%2*c end.
)
NB. note: as nice as it would be to use p., not using it seems to be
NB. 10x speedup
