extends Node2D
class_name Main

@onready var level_points = $Test/LevelPoints

func get_level_points() -> int:
	return level_points.get_child_count()

