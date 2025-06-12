class_name Achievement extends Resource

@export var achievement_name: String
@export var description: String
@export var xp_prize: int

@export var condition: Condition : set = _set_condition

var _achieved: bool = false

func _set_condition(new_value:Condition) -> void:
	condition = new_value
	condition.fullfilled.connect(_on_condition_fullfilled)

func _on_condition_fullfilled() -> void:
	_achieved = true
