class_name LevelBtn extends Button

@export var level: Level 

var game: Game = load(GC.SCREENS_UIDS.GAME).instantiate()

func _ready() -> void:
	set_disabled_mode()
	pass

func set_disabled_mode():
	if level.progress.state == LevelProgress.States.LOCKED:
		disabled = true

func _on_pressed() -> void:
	game.level = level
	SMS.get_container("Main").goto_scene(game)
