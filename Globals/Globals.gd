extends Node

var current_points: int
var required_points: int

var total_tries: int

func set_required_points(value):
	required_points = value
	
func update_total_tries():
	total_tries += 1

func reset_current_points():
	current_points = 0
	
func reset_required_points():
	required_points = 0

func reset_total_tries():
	total_tries = 0
