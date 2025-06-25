class_name LevelProgress extends Resource

enum States {LOCKED, UNLOCKED, COMPLETED}

@export var state: States = States.LOCKED

@export var unlock_conditions: Array[CondLvCompleted] : set = _set_unlock_conditions
@export var complete_condition: CondLvCompleted : set = _set_completed_condition

@export var id: String 

func _set_completed_condition(new_value: CondLvCompleted) -> void:
	if !UDS.current_user_data: return
	assert(new_value != null, "Condition MUST not be null in an LevelProgress.")
	if _get_condition_copy_from_user_data(new_value):
		complete_condition = _get_condition_copy_from_user_data(new_value)
	else: complete_condition = new_value.duplicate()
	complete_condition.fullfilled.connect(_on_complete_condition_fullfilled)

func _set_unlock_conditions(new_value: Array[CondLvCompleted]) -> void:
	if !UDS.current_user_data: return
	assert(new_value != null, "Condition MUST not be null in an LevelProgress.")
	unlock_conditions = new_value
	for unlock_condition in new_value:
		if _get_condition_copy_from_user_data(unlock_condition):
			unlock_condition = _get_condition_copy_from_user_data(unlock_condition)
		else: 
			unlock_condition = unlock_condition.duplicate()
		unlock_condition.fullfilled.connect(_on_unlock_condition_fullfilled)

func _get_condition_copy_from_user_data(condition: Condition) -> Condition:
	var copy_condition: Condition = null
	for saved_condition in UDS.get_property(UDS.PROPERTIES.CONDITIONS) as Array[Condition]:
		if saved_condition.id == condition.id:
			copy_condition = saved_condition
	return copy_condition

func _on_unlock_condition_fullfilled():
	for unlock_condition in unlock_conditions:
		if !unlock_condition.is_fullfilled: return
	if state == States.LOCKED:
		state = States.UNLOCKED
 
func _on_complete_condition_fullfilled():
	if state == States.UNLOCKED:
		state = States.COMPLETED
