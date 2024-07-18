extends CanvasLayer

@onready var points_label = $Control/MarginContainer/VBoxContainer/Label

func _process(_delta):
	points_label.text = str(Globals.current_points) + "/" + str(Globals.required_points)
