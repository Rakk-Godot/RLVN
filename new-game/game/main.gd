extends Node2D

@onready var dialogue_ui = $dialogue_ui
@onready var BG = $BG
@onready var gpa = %gpa
@onready var sociallife = %sociallife
@onready var depression = %depression
var active_scene
var outcome : String


func _ready() -> void:
	var story = DScript.new().story
	dialogue_ui.initialize(story)
	dialogue_ui.init_start("main", Globals.current_scene)
	dialogue_ui.connect("stats_changed",stats_changed)
	gpa.value = Agent.gpa
	depression.value = Agent.depression
	sociallife.value = Agent.sociallife
	dialogue_scene()

func stats_changed(_string: String,_choice):
	$HUD.stats_changed(_string,_choice)


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
	Globals.current_scene = outcome
	dialogue_ui.transitioning = false
	Agent.sociallife = sociallife.value
	Agent.gpa = gpa.value
	Agent.depression = depression.value
	Save.update_save()

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
