class_name LevelProgress extends Resource

enum States {LOCKED, UNLOCKED, COMPLETED}

@export var state: States
@export var unlock_condition: CondPr : set = _set_unlock_condition

func _set_unlock_condition(new_value: CondPr) -> void:
	unlock_condition = new_value
	if unlock_condition:
		unlock_condition.fullfilled.connect(_on_condition_fullfilled)

func _init() -> void:
	if unlock_condition:
		unlock_condition.fullfilled.connect(_on_condition_fullfilled)
	
func _on_condition_fullfilled():
	if state == States.LOCKED:
		state = States.UNLOCKED
