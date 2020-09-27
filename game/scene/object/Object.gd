extends MeshInstance

var isActive = false

func _physics_process(delta):
    if isActive && Input.is_action_just_pressed("ui_accept"):
        give_money()
        queue_free()

func _on_StaticBody2_area_entered(area):
    print("objet area entered")
    isActive = true

func action():
    isActive = true
    
func give_money():
    print("you win 5 gold")
