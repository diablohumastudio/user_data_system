## Class that modifies part of UserProgress under certain conditions
class_name Condition extends Resource

enum Types {ENEMY_KILLED, LEVEL_COMPLETED, NO_NULL_NAME}
var type: Types

signal fullfilled
@export_storage var is_fullfilled: bool = false : set = _set_is_fullfilled

@export var id: String

func _set_is_fullfilled(new_value: bool) -> void:
	is_fullfilled = new_value
	fullfilled.emit()

# EVALUATE() MUST CHANGE FULLFILLED VARIABLE
func evaluate(_payload: Payload) -> void:
	pass
