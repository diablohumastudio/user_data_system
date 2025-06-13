class_name ReduAchievTotEnemKill extends Reducer

@export var target: Achievement
@export var enemies_to_kill: int

func evaluate() -> void:
	var enemies_killed: int = UDS.user_data.progress.total_enemies_death
	if enemies_killed >= enemies_to_kill :
		target.achieved = true
