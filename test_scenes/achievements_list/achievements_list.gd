class_name AchievementsList extends Control

@export var achievements: Array[Achievement]

func _ready() -> void:
	achievements = UDS.user_data.achievements.achievements
	update_list()

func update_list():
	for child in %AchivementsContainer.get_children():
		child.queue_free()
	for achiv in achievements:
		if achiv.achieved:
			var new_achivement_presenter: AchievementPresenter = load("uid://b3k3vdpqxjmdv").instantiate()
			new_achivement_presenter.achievement = achiv
			print(achiv, new_achivement_presenter.achievement)
			%AchivementsContainer.add_child(new_achivement_presenter)

func _on_go_back_button_pressed() -> void:
	var menu: Menu = load("uid://1lj0rwr24hox").instantiate()
	SMS.get_container("Main").goto_scene(menu)
