class_name Game extends Control

@export var level: Level

func _ready() -> void:
	%LevelLabel.text = level.level_name

func _on_win_button_pressed() -> void:
	level.progress.state = LevelProgress.States.COMPLETED
	UDS.update_reducers()

func _on_go_back_button_pressed() -> void:
	var menu: Menu = load(GC.SCREENS_UIDS.MENU).instantiate()
	SMS.get_container("Main").goto_scene(menu)

func _on_kill_enemy_button_pressed() -> void:
	UDS.user_data.progress.total_enemies_death += 1
	%DeathEnemiesLabel.text = str(UDS.user_data.progress.total_enemies_death)
