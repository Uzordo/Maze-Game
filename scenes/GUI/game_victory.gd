extends CanvasLayer

@onready var menu_button = $Control/MarginContainer/VBoxContainer2/HBoxContainer/MenuButton as TextureButton
@onready var quit_button = $Control/MarginContainer/VBoxContainer2/HBoxContainer/QuitButton as TextureButton
@onready var tries_label = $Control/MarginContainer/VBoxContainer/tries_label

func _ready():
	menu_button.button_down.connect(on_menu_pressed)
	quit_button.button_down.connect(on_quit_pressed)
	
	tries_label.text = "Total Deaths: " + str(Globals.total_tries)
	
func on_quit_pressed() -> void:
	get_tree().quit()
	
func on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/GUI/main_menu.tscn")
