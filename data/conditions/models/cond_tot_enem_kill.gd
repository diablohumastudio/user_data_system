class_name CondTotEnemKill extends Condition

@export var enemies_to_kill: int

func _init() -> void:
	type = Types.ENEMY_KILLED

func evaluate(_payload: Payload) -> void:
	var enemies_killed: int = UDS.user_data.progress.total_enemies_death
	if enemies_killed >= enemies_to_kill :
		is_fullfilled = true
