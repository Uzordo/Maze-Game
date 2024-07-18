extends Area2D


func _on_body_entered(body):
	if body.name == "Player":
		Globals.current_points += 1
		queue_free()
