class_name Game extends Control

@export var level: Level
var enemies_killed: int = 0

func _ready() -> void:
	%LevelLabel.text = level.level_name
	%DeathEnemiesLabel.text = str(UDS.get_property(UDS.PROPERTIES.TOT_ENEM_DEATHS))

func _on_win_button_pressed() -> void:
	level.progress.state = LevelProgress.States.COMPLETED
	ACS.set_action(Action.new(Condition.Types.LEVEL_COMPLETED))

func _on_go_back_button_pressed() -> void:
	var menu: Menu = load(GC.SCREENS_UIDS.MENU).instantiate()
	SMS.get_container("Main").goto_scene(menu)

func _on_kill_enemy_button_pressed() -> void:
	enemies_killed += 1
	UDS.increase_total_enemies_death()
	%DeathEnemiesLabel.text = str(UDS.get_property(UDS.PROPERTIES.TOT_ENEM_DEATHS))
	ACS.set_action(Action.new(Condition.Types.ENEMY_KILLED, PayLevEnemKill.new(enemies_killed)))
