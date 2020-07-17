require 'viewmat stats/bonsai'
load 'read.ijs kernel.ijs read.ijs'

SCENEID=: 0
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

read_scene=: 3 : 0
SCENE=: tok 1!:1 < 'testscenes/scene',(":y),'.test'
setup_camera scene_cam SCENE
ambient=. 0 0 0
directional=. 0 0 0 0 0 0
diffuse=. 0 0 0
specular=. 0 0 0
VERTICES=: > {:"1 SCENE {~ I. (<'vertex') = ({. |: SCENE)
OBJS=: 0 5 $ 0
AMBS=: ''
NB. TRIANGLES=: VERTICES {~ > {:"1 SCENE {~ I. (<'tri') = ({. |: SCENE)
for_c. 2 }. SCENE do.
  select. > {. c
  case. 'ambient' do. ambient=. > {: c
  case. 'diffuse' do. diffuse=. > {: c
  case. 'directional' do. directional=. > {: c
  case. 'specular' do. specular=. > {: c
  case. 'tri'    do. OBJS=: OBJS , ('tri';(VERTICES{~>{:c);ambient ; diffuse ; specular)
  case. 'sphere' do. OBJS=: OBJS , (c , ambient ; diffuse ; specular)
  fcase. do. echo c
  end.
end.
load 'ray.ijs'
)

coloring=: 3 : 0
read_scene y
N =: 0
IMAGE=: <. 255 * (pixelRay"1 pixels WH) cast_ray"2 _ OBJS
IMAGE writepng 'out.png'
viewpng 'out.png'
)
