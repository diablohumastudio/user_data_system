class_name Condition extends Resource

signal fullfilled
var is_fullfilled: bool = false : set = _set_is_fullfilled

func _set_is_fullfilled(new_value: bool) -> void:
	is_fullfilled = new_value
	fullfilled.emit()

# EVALUATE() MUST CHANGE FULLFILLED VARIABLE
func evaluate():
	pass
