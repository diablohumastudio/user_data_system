class_name PayLevEnemKill extends Payload

@export var enemies_killed: int = 0

func _init(_enemies_killed: int) -> void:
	enemies_killed = _enemies_killed
