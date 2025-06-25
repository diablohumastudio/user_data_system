class_name Menu extends Control

func _ready() -> void:
	%MusicVolumeLabel.text = str(UDS.get_property(UDS.PROPERTIES.MUSIC_VOLUME))

func _on_goto_achievement_list_btn_pressed() -> void:
	var achivement_list: AchievementsList = load(GC.SCREENS_UIDS.ACHIEVEMENT_LIST).instantiate()
	SMS.get_container("Main").goto_scene(achivement_list)

func _on_goto_market_btn_pressed() -> void:
	var allies_market: AlliesMarket = load(GC.SCREENS_UIDS.ALLIES_MARKET).instantiate()
	SMS.get_container("Main").goto_scene(allies_market)

func _on_save_btn_pressed() -> void:
	UDS.save_data_to_disk()

func _on_go_back_btn_pressed() -> void:
	var welcome_menu_user = load(GC.SCREENS_UIDS.WELCOME_MENU_USER).instantiate()
	SMS.get_container("Main").goto_scene(welcome_menu_user)
