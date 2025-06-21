class_name LevelProgress extends Resource

enum States {LOCKED, UNLOCKED, COMPLETED}

@export var state: States = States.LOCKED

@export var unlock_conditions: Array[CondLvCompleted] : set = _set_unlock_conditions
@export var complete_condition: CondLvCompleted : set = _set_completed_condition

@export var id: String 

func _set_completed_condition(new_value: CondLvCompleted) -> void:
	assert(new_value != null, "Condition MUST not be null in an LevelProgress.")
	complete_condition = new_value
	complete_condition.fullfilled.connect(_on_complete_condition_fullfilled)

func _set_unlock_conditions(new_value: Array[CondLvCompleted]) -> void:
	assert(new_value != null, "Condition MUST not be null in an LevelProgress.")
	unlock_conditions = new_value
	for unlock_condition in unlock_conditions:
		unlock_condition.fullfilled.connect(_on_unlock_condition_fullfilled)

func _on_unlock_condition_fullfilled():
	for unlock_condition in unlock_conditions:
		if !unlock_condition.is_fullfilled: return
	if state == States.LOCKED:
		state = States.UNLOCKED
 
func _on_complete_condition_fullfilled():
	if state == States.UNLOCKED:
		state = States.COMPLETED
