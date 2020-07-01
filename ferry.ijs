require 'viewmat stats/bonsai'
load 'kernel.ijs read.ijs'

SCENEID=: 1
VERTICES=: ''
TRIANGLES=: ''
SPHERES=: ''

NB. placeholder for global camera variables
NB. E C U is eye center up
NB. ANG WH EC ASP is angle width height vector E -> C and aspect
NB. SUR EH TD DR is scale up right, unit up unit straight and unit right
'E C U ANG WH EC ASP SUR EH TD DR'=: i. 11

setup_camera =: 3 : 0
WH=: _2{.y [ ANG=: 1r180p1 * 9{y [ 'E C U'=: _3]\9{.y
SUR=: ASP,1 [ ASP=: %/WH [ EC=: l2 E-C
EH=: unit TD cross~ [ DR=: unit U cross~ [ TD=: unit C-E
'ok'
)

init=: 3 : 0
load'test.ijs'
SCENE=: test_tok SCENEID
setup_camera scene_cam SCENE
VERTICES=: > {:"1 SCENE {~ I. (<'vertex') = ({. |: SCENE)
TRIANGLES=: VERTICES {~ > {:"1 SCENE {~ I. (<'tri') = ({. |: SCENE)
load'ray.ijs'
)

read_scene=: 3 : 0
SCENE=: test_tok SCENEID
setup_camera scene_cam SCENE
ambient=. 3 # 0.2
directional=. ''
diffuse=. ''
specular=. ''
VERTICES=: > {:"1 SCENE {~ I. (<'vertex') = ({. |: SCENE)
TRIANGLES=: VERTICES {~ > {:"1 SCENE {~ I. (<'tri') = ({. |: SCENE)
for_c. 2 }. SCENE do.
  echo c
end.

)

init''

simplest=: 3 : 0
NB. sph=. 0 0 0 0.3
tri=. 0 { TRIANGLES
NB. ((unit@pixelRay)"1 pixels WH) ray_sphere"1 _ sph
((unit@pixelRay)"1 pixels WH) ray_triangle"1 _ tri
)

