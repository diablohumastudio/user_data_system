extends Control

@onready var achievement_box_pksc: PackedScene = load("res://global_systems/achievement_achieved_presenter/achievement_box/achievement_box.tscn")

func _ready() -> void:
	for achievement in UDS.user_data.achievements.achievements:
		achievement.achieved.connect(_on_achievement_achieved)
	for child in %HBoxContainer.get_children():
		child.queue_free()

func _on_achievement_achieved(achievement: Achievement) -> void:
	var new_achievement_box : AchievementBox = achievement_box_pksc.instantiate()
	new_achievement_box.achievement_name = achievement.achievement_name
	%HBoxContainer.add_child(new_achievement_box)
	await get_tree().create_timer(3).timeout
	new_achievement_box.queue_free()
