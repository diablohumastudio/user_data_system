class_name UserProgress extends Node

var level_1_progress: LevelProgress = preload("uid://dhwtydfmuewub")
var level_2_progress: LevelProgress = preload("uid://bh33cxg53545a")
var level_3_progress: LevelProgress = preload("uid://c6b0k605uumfl")

@export_storage var level_progresses: Array[LevelProgress] = [level_1_progress, level_2_progress, level_3_progress]
