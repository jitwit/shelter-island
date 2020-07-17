NB. flip a sign to have y decrease with pixel value?
pixelR2 =: SUR * (3 o. -: ANG) * 2 * _1r2 + (%&WH)
pixelR3 =: TD + (DR,:-EH) +/ . *~ pixelR2
pixelRay=: E ,: unit @ pixelR3
NB. x corresponds to ray
NB. y to sphere (x y z r)
ray_sphere=: 4 : 0
'or di'=. x
S=. }: y [ r=. {: y
a=. +/ . *~ di              NB. a <=> R*R
b=. +: di +/ . * or - S     NB. b <=> 2*R*(E-S)
c=. (+/ . *~ or - S) - *: r NB. c <=> (E-S)^2 - r^2
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
'or di'=. x
'v0 v1 v2'=. y
't u v'=. (or-v0) %. (-di) ,. (v1-v0) ,. (v2-v0)
(+ _*0&=) t * (0<:u) * (0<:v) * (1>:u+v)
)

ray_distance=: 4 : 0
'tag dat' =. 2 {. y
select. tag
case. 'tri'    do. x ray_triangle dat
case. 'sphere' do. x ray_sphere   dat
end.
)

normal=: 4 : 0
'tag dat' =. 2 {. y
select. tag
case. 'tri' do. unit cross/ (}: -"1 _ {:) dat
case. 'sphere' do. unit x - }: dat 
end.
)

NB. I=A+E+∑iViLic0+c1r+c2r2(Dmax(N⋅L,0)+Smax(N⋅H,0)s)
color_ray =: 4 : 0
'tag dat am di sp'=. y
am
NB. d =. x ray_distance y
NB. n =. (E + d*x) normal y
NB. dir=. (3 {. di) * n +/ . * 
)

cast_ray =: 4 : 0
clr=. 0 0 0 [ obj =. _1 [ dist=. _
for_s. y do.
  if. dist > d =. x ray_distance s
  do. obj =. s_index [ dist =. d end.
end. if. 0 <: obj do. clr =. x color_ray obj { y end. clr
)
