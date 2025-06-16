class_name UserData extends Resource

@export_storage var user_name: String
@export_storage var allies_inventory: UserAllyInventory = UserAllyInventory.new()
@export_storage var progress: UserProgress = UserProgress.new()
@export_storage var achievements: UserAchievements = UserAchievements.new()
@export_storage var settings: UserSettings = UserSettings.new()
#TODO @export_storage var stats: UserStats = UserStats.new()
