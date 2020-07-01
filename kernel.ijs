NB. core functionality
l2 =: +/ &.: *:
unit =: % l2

signs=: */~ @: (1 _1 $~ #)
minors=: 1&(|:\.)"2^:2
expand=: signs * -/ . * @ minors
cross=: {. @ expand @: (1 , ,:)

NB. based on y (a wh vector) generate (wh,2) grid of pixels corresponding to middles
pixels=: 0.5 + ,"0/~ & i./ @ |.