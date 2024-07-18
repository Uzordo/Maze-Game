extends Area2D

@export var next_level: String
signal change_level()

func _on_body_entered(body):
	if body.name == "Player":
		change_level.emit()
