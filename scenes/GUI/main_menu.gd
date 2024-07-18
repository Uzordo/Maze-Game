extends CanvasLayer

@onready var play_button = $Control/MarginContainer/VBoxContainer2/HBoxContainer/PlayButton as TextureButton
@onready var quit_button = $Control/MarginContainer/VBoxContainer2/HBoxContainer/QuitButton as TextureButton
@onready var margin_container = $Control/MarginContainer as MarginContainer

func _ready():
	handle_connection_signals()
	Globals.reset_total_tries()
	Globals.reset_current_points()

func on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")

func on_quit_pressed() -> void:
	get_tree().quit()
	

func handle_connection_signals() -> void:
	play_button.button_down.connect(on_play_pressed)
	quit_button.button_down.connect(on_quit_pressed)
