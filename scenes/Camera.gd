extends Camera

export var distance = 8.0
export var height = 6.0

var MOUSE_SENSITIVITY = 5


func _ready():
    set_physics_process(true)
    set_as_toplevel(true) 
    
    
func _physics_process(delta):
    var target = get_parent().get_global_transform().origin
    var pos = get_global_transform().origin
    var up = Vector3(0,1,0)
    
    var offset = pos -target
    
    offset = offset.normalized() * distance
    offset.y = height
    
    pos = target + offset
    
    look_at_from_position(pos,target, up)


func _input(event):
    if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
        get_parent().rotate_x(deg2rad(event.relative.y * MOUSE_SENSITIVITY))
        self.rotate_y(deg2rad(event.relative.x * MOUSE_SENSITIVITY * -1))

        var camera_rot = get_parent().rotation_degrees
        camera_rot.x = clamp(camera_rot.x, -70, 70)
        get_parent().rotation_degrees = camera_rot
