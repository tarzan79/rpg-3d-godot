extends Spatial

var camrot_h = 0
var camrot_v = 0
var cam_v_max = 75
var cam_v_min = -55
var h_sensitivity = 0.1
var v_sensitivity = 0.1
var h_acceleration = 10
var v_acceleration = 10

func _ready():
    Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
    $h/v/Camera.add_exception(get_parent())
    
func _input(event):
    if event is InputEventMouseMotion:
        camrot_h += -event.relative.x * h_sensitivity
        camrot_v += event.relative.y * v_sensitivity
        
func _physics_process(delta):
    
    camrot_v = clamp(camrot_v, cam_v_min, cam_v_max)
    
    $h.rotation_degrees.y = lerp($h.rotation_degrees.y, camrot_h, delta * h_acceleration)
    $h/v.rotation_degrees.x = lerp($h/v.rotation_degrees.x, camrot_v, delta * v_acceleration)
    
    
    
#extends Spatial
#
#var lookSensitivity : float = 15.0
#var minLookAngle : float = -20.0
#var maxLookAngle : float = 75.0
#
#var mouseDelta : Vector2 = Vector2()
#
#onready var player = get_parent()
#
#func _ready():
#     Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
#
#func _input(event):
#    if event is InputEventMouseMotion:
#        mouseDelta = event.relative
#
#func _process(delta):
#    var rot = Vector3(mouseDelta.y, mouseDelta.x, 0) * lookSensitivity * delta
#    rotation_degrees.x += rot.x
#    rotation_degrees.x = clamp(rotation_degrees.x, minLookAngle, maxLookAngle)
#    player.rotation_degrees.y -= rot.y
#    mouseDelta = Vector2()
