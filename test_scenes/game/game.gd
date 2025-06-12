class_name Game extends Control

@export var level: Level

func _ready() -> void:
	%LevelLabel.text = level.level_name

func _on_win_button_pressed() -> void:
	UDS.on_level_completed(level)

func _on_go_back_button_pressed() -> void:
	var menu: Menu = load("uid://1lj0rwr24hox").instantiate()
	SMS.get_container("Main").goto_scene(menu)
