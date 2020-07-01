require 'viewmat'
load 'read.ijs ray.ijs'

NB. y is one of 1 2 3
test_tok =: 3 : 0
tok 1!:1 < 'testscenes/scene',(":y),'.test'
)

test_view_rays =: 3 : 0
setup_camera scene_cam scene=. test_tok y

(cam camera)"1 pixs 640 480
)