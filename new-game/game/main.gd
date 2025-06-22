extends Node2D

@onready var dialogue_ui = $dialogue_ui
@onready var BG = $BG
var active_scene
var outcome : String


func _ready() -> void:
	var story = DScript.new().story
	dialogue_ui.initialize(story)
	dialogue_ui.init_start("main", "september_1")
	dialogue_ui.connect("stats_changed",stats_changed)
	dialogue_scene()

func stats_changed(_string: String):
	$HUD.stats_changed(_string)


func _on_dialogue_ui_finished(_outcome) -> void:
	if dialogue_ui.reader.is_end("main", _outcome) == true:
		Globals.change_scene(Globals.path_menu)
	else:
		outcome = _outcome
		dialogue_ui.active_key = outcome
		$Transitioner/transition_anim.play("change_scene")
		dialogue_ui.transitioning = true
		

func change_dialogue() -> void:
	dialogue_ui.init_next(outcome)
	dialogue_ui.transitioning = false

func reset_dialogue() -> void:
	dialogue_ui.change_dial_scene()


func dialogue_scene():
	var path = "res://scenes/" + dialogue_ui.active_key + ".tscn"
	scene_change(path)

func scene_change(path):
	for each in BG.get_children():
		each.queue_free()
	var __bg = load(path).instantiate()
	active_scene = __bg
	BG.add_child(__bg)

func _on_main_menu_pressed() -> void:
	Globals.change_scene(Globals.path_menu)


func _on_dialogue_ui_change_anim(_node : String,_anim: String) -> void:
	active_scene.change_anim(_node,_anim)
