class_name AchievementsList extends Control

@export var achievements: Array[Achievement]

func _ready() -> void:
	achievements = UDS.user_data.achievements.achievements
	update_list()

func update_list():
	for child in %AchivementsContainer.get_children():
		child.queue_free()
	for achiv in achievements:
		var new_achivement_presenter: AchievementPresenter = load(GC.SCREENS_UIDS.ACHIEVEMENT_PRESENTER).instantiate()
		new_achivement_presenter.achievement = achiv
		%AchivementsContainer.add_child(new_achivement_presenter)

func _on_go_back_button_pressed() -> void:
	var menu: Menu = load(GC.SCREENS_UIDS.MENU).instantiate()
	SMS.get_container("Main").goto_scene(menu)
