extends KinematicBody


var direction = Vector3.BACK
var velocity = Vector3.ZERO
var strafe_dir = Vector3.ZERO
var strafe = Vector3.ZERO

var aim_turn = 0

var vertical_velocity = 0
var gravity = 20

var movement_speed = 0
var walk_speed = 6
var run_speed = 5
var acceleration = 6
var angular_acceleration = 7

onready var anim = $player/Armature/AnimationPlayer

var roll_magnitude = 17

func _ready():
    direction = Vector3.BACK.rotated(Vector3.UP, $Camroot/h.global_transform.basis.get_euler().y)
    # Sometimes in the level design you might need to rotate the Player object itself
    # So changing the direction at the beginning

func _input(event):
    if event is InputEventMouseMotion:
        aim_turn = -event.relative.x * 0.015 #animates player with mouse movement while aiming (used in line 104)

func _physics_process(delta):
    var h_rot = $Camroot/h.global_transform.basis.get_euler().y
    if Input.is_action_pressed("ui_up") ||  Input.is_action_pressed("ui_down") ||  Input.is_action_pressed("ui_left") ||  Input.is_action_pressed("ui_right"):
        direction = Vector3(
                    Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right"),
                    0,
                    Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down"))
        strafe_dir = direction
        direction = direction.rotated(Vector3.UP, h_rot).normalized()
        movement_speed = walk_speed        
    else:
        movement_speed = 0
        strafe_dir = Vector3.ZERO
        
    if !anim.is_playing():
        direction = $Camroot/h.global_transform.basis.z
    
    velocity = lerp(velocity, direction * movement_speed, delta * acceleration)

    if Input.is_action_pressed("ui_accept") and is_on_floor():
        anim.play("youpi")
#        velocity.y = 40
    
    move_and_slide(velocity + Vector3.DOWN * vertical_velocity, Vector3.UP)
    
    if !is_on_floor():
        vertical_velocity += gravity * delta
    else:
        vertical_velocity = 0
        
    if movement_speed != 0:
        anim.play("Walk")
        $player.rotation.y = lerp_angle($player.rotation.y, atan2(direction.x, direction.z) - rotation.y, delta * angular_acceleration)
#        # Sometimes in the level design you might need to rotate the Player object itself
#        # - rotation.y in case you need to rotate the Player object
    else:
        print("pas bouger")
        anim.play("idle")
#        anim.play("youpi")
#        $Mesh.rotation.y = lerp_angle($Mesh.rotation.y, $Camroot/h.rotation.y, delta * angular_acceleration)
#        # lerping towards $Camroot/h.rotation.y while aiming, h_rot(as in the video) doesn't work if you rotate Player object
    
#    strafe = lerp(strafe, strafe_dir + Vector3.RIGHT * aim_turn, delta * acceleration)
    
#    $AnimationTree.set("parameters/strafe/blend_position", Vector2(-strafe.x, strafe.z))
    
#    var iw_blend = (velocity.length() - walk_speed) / walk_speed
#    var wr_blend = (velocity.length() - walk_speed) / (run_speed - walk_speed)

    #find the graph here: https://www.desmos.com/calculator/4z9devx1ky

#    if velocity.length() <= walk_speed:
#        $AnimationTree.set("parameters/iwr_blend/blend_amount" , iw_blend)
#    else:
#        $AnimationTree.set("parameters/iwr_blend/blend_amount" , wr_blend)
    
    aim_turn = 0
    
