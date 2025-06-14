class_name CondAchieTotEnemKill extends Condition

@export var enemies_to_kill: int

func evaluate() -> void:
	var enemies_killed: int = UDS.user_data.progress.total_enemies_death
	if enemies_killed >= enemies_to_kill :
		is_fullfilled = true
