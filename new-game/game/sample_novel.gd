extends Node2D

@onready var dialogue_ui = $dialogue_ui
@onready var BG = $BG


func _ready() -> void:
	var story = DScript.new().story
	dialogue_ui.initialize(story)
	dialogue_ui.init_start("sample1", "september_1")
	dialogue_ui.connect("stats_changed",stats_changed)


	dialogue_scene()

func stats_changed(_string: String):
	$HUD.stats_changed(_string)


func _on_dialogue_ui_finished(_outcome) -> void:
	if dialogue_ui.reader.is_end("sample1", _outcome) == true:
		Globals.change_scene(Globals.path_menu)
	else:
		dialogue_ui.init_next(_outcome)
		dialogue_scene()

func dialogue_scene():
	var path = "res://scenes/" + dialogue_ui.active_key + ".tscn"
	scene_change(path)

func scene_change(path):
	for each in BG.get_children():
		each.queue_free()
	var __bg = load(path).instantiate()
	BG.add_child(__bg)

func _on_main_menu_pressed() -> void:
	Globals.change_scene(Globals.path_menu)
