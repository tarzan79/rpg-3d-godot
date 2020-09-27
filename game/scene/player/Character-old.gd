#extends KinematicBody
#
#
#var moveSpeed : float = 5.0
#var jumpForce : float = 6.0
#var gravity : float = 25.0
#
#var vel : Vector3 = Vector3()
#
#onready var camera = get_node("CameraOrbit")
##onready var attackRayCast = get_node("AttackRayCast")
#
## called every physics step (60 times a second)
#func _physics_process(delta):
#
#    vel.x = 0
#    vel.z = 0
#
#    var input = Vector3()
#
#
#    # movement inputs
#    if Input.is_action_pressed("ui_up"):
#        input.z += 1
#    if Input.is_action_pressed("ui_down"):
#        input.z -= 1
#    if Input.is_action_pressed("ui_left"):
#        input.x += 1
#    if Input.is_action_pressed("ui_right"):
#        input.x -= 1
#
# # normalize the input vector to prevent increased diagonal speed  
#    input = input.normalized()
#
# # get the relative direction
#    var dir = (transform.basis.z * input.z + transform.basis.x * input.x)
#
# # apply the direction to our velocity
#    vel.x = dir.x * moveSpeed
#    vel.z = dir.z * moveSpeed
#
# # gravity
#    vel.y -= gravity * delta
#
#    if Input.is_action_pressed("ui_accept") and is_on_floor():
#        vel.y = jumpForce
#
# # move along the current velocity
#    vel = move_and_slide(vel, Vector3(0,1,0), true)
#    if vel != Vector3(0.0,0.0,0.0):
#        $Mesh/AnimationPlayer.play("Run")
#    else:
#        $Mesh/AnimationPlayer.stop(true)
#
