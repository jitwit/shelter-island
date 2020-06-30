l2 =: +/ &.: *:
unit =: % l2

signs=: */~ @: (1 _1 $~ #)
minors=: 1&(|:\.)"2^:2
expand=: signs * -/ . * @ minors
cross=: {. @ expand @: (1 , ,:)


NB. camera operator takes 12 vector describing eye center up as well
NB. as fov (vert) and wh. produces function that given pixel x,y
NB. provides ray direction from eye
camera =: 1 : 0
cam2=. 2 {. cam=. camera_orf m
'eye to up fov'=. _3 ]\ m
'al w h'=. fov
asp=. %/ wh=. w,h
dist=. l2 cent =. eye - to
hy=. dist * 3 o. 1r360p1 * al
scl=. hy * asp,1
pixxy=. scl * wh %~ y - -: wh
NB. world(?) coordinates corresponding to ray hitting screen
NB. determined by camera of pixel y
to + pixxy +/ . * cam2
)

NB. take camera/scene 12 vector description
camera_orf =: 3 : 0
'eye to up fov'=. _3 ]\ y
'al w h'=. fov
cen=. eye - to NB. idk
rig=. cen cross up
upv=. rig cross cen
unit"1 upv , rig ,: cen
)