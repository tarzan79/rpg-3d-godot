extends Spatial

func _on_StaticBody_body_entered(body):
    print("you win 5555 gold")
    queue_free()
