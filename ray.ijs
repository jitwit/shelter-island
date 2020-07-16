NB. flip a sign to have y decrease with pixel value?
pixelR2 =: SUR * (3 o. -: ANG) * 2 * _1r2 + (%&WH)
pixelR3 =: TD + (DR,:-EH) +/ . *~ pixelR2
pixelRay=: unit @ pixelR3

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
(+ _*0&=) t * (0<:u) * (0<:v) * (1>:u+v)
)

ray_objs=: 4 : 0
'ts bs'=. y
dbs=. x ray_sphere"_ _1 bs
dts=. x ray_triangle"_ _1 ts
<./ dbs , dts
)

color_ray =: 4 : 0
'tag dat am di sp'=. y
am
)

cast_ray =: 4 : 0
dist=. _
obj =. _1
clr=. 0 0 0
for_s. y do.
  'tag dat' =. 2 {. s
  select. tag
  case. 'tri'    do. if. dist > dtri =. x ray_triangle dat
		     do. obj =. s_index [ dist =. dtri end.
  case. 'sphere' do. if. dist > dtri =. x ray_sphere   dat
		     do. obj =. s_index [ dist =. dtri end. end. end.
if. 0 <: obj do. clr =. x color_ray obj { y end.
echo N % */WH
clr
)
