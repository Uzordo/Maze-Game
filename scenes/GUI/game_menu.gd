extends CanvasLayer

@onready var play_button = $MarginContainer/VBoxContainer2/HBoxContainer/PlayButton as TextureButton
@onready var menu_button = $MarginContainer/VBoxContainer2/HBoxContainer/MenuButton as TextureButton

func _ready():
	play_button.button_down.connect(on_play_pressed)
	menu_button.button_down.connect(on_menu_pressed)
	
func on_play_pressed() -> void:
	hide()
	get_tree().paused = false

func on_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/GUI/main_menu.tscn")
