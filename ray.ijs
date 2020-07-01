l2 =: +/ &.: *:
unit =: % l2

signs=: */~ @: (1 _1 $~ #)
minors=: 1&(|:\.)"2^:2
expand=: signs * -/ . * @ minors
cross=: {. @ expand @: (1 , ,:)

NB. placeholder for global camera variables
NB. E C U is eye center up
NB. ANG WH EC ASP is angle width height vector E -> C and aspect
NB. SUR EH TD DR is scale up right, unit up unit straight and unit right
'E C U ANG WH EC ASP SUR EH TD DR'=: i. 11

NB. based on y (a wh vector) generate (wh,2) grid of pixels corresponding to middles
pixels=: 0.5 + ,"0/~ & i./ @ |.

NB. flip a sign to have y decrease with pixel value?
pixelR3 =: C + (DR,:EH) +/ . *~ SUR*(EC*3 o.-:ANG) * WH%~-&(-:WH)
pixelRay=: E -~ pixelR3

setup_camera =: 3 : 0
WH=: _2{.y [ ANG=: 1r180p1 * 9{y [ 'E C U'=: _3]\9{.y
SUR=: ASP,1 [ ASP=: %/WH [ EC=: l2 E-C
DR=: unit TD cross EH [ TD=: unit C-E [ EH=: unit U
'ok'
)
