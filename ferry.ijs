require 'viewmat stats/bonsai'
load 'kernel.ijs read.ijs'

SCENEID=: 1

NB. placeholder for global camera variables
NB. E C U is eye center up
NB. ANG WH EC ASP is angle width height vector E -> C and aspect
NB. SUR EH TD DR is scale up right, unit up unit straight and unit right
'E C U ANG WH EC ASP SUR EH TD DR'=: i. 11

setup_camera =: 3 : 0
WH=: _2{.y [ ANG=: 1r180p1 * 9{y [ 'E C U'=: _3]\9{.y
SUR=: ASP,1 [ ASP=: %/WH [ EC=: l2 E-C
DR=: unit TD cross EH [ TD=: unit C-E [ EH=: unit U
'ok'
)

init=: 3 : 0
load'test.ijs'
SCENE=: test_tok 1
setup_camera scene_cam SCENE
load'ray.ijs'
)

init''

simplest=: 3 : 0
obj=. 0 0 0 0.3
((unit@pixelRay)"1 pixels WH) ray_sphere"1 _ obj
)

