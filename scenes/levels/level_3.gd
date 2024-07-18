extends Main

func _ready():
	Globals.required_points = get_level_points()
	Globals.reset_current_points()

func _on_change_level_change_level():
	if Globals.required_points == Globals.current_points:
		LevelTransition.change_level("res://scenes/levels/level_4.tscn")
