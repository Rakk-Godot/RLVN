extends Node

@export var NOTIFIER : PackedScene
@onready var CONTAINER = $CanvasLayer/agent_container
var agent_data : Dictionary = {}
var learn_count : int = 0


var depression : float
var gpa : float
var sociallife : float

func learn_game(_choice,_result,_value):
	var _scene = Globals.current_scene
	var _good : bool = false
	var _dir : String = "Increase"
	var _title : String
	match _result:
		"gpa" : _title = "GPA"
		"sociallife" : _title = "Social Life"
		"depression" : _title = "Depression"
	if _value < 0:
		_dir = "Decrease"
	if not agent_data.has(learn_count):
		agent_data[learn_count] = {}
	if not agent_data[learn_count].has(_scene):
		agent_data[learn_count][_scene] = {}
	if not agent_data[learn_count][_scene].has(_choice):
		agent_data[learn_count][_scene][_choice] = {}
	
	if ["gpa","sociallife"].has(_result) and _value > 0:
		_good = true
	elif ["gpa","sociallife"].has(_result) and _value < 0:
		_good = false
	elif _result == "depression" and _value > 0:
		_good = false
	elif _result == "depression" and _value < 0:
		_good = true
	
	var _res : String = "Good"
	if _good == false:
		_res = "Bad"
	agent_data[learn_count][_scene][_choice][_result] = _good
	show_promt(_title + " - " + _dir + "\n" + "Result: " + _res, _choice)

func show_promt(_text: String, _choice : String) -> void:
	var _notifier_text = "Memory updated:\n" + Globals.current_scene + " - " + _choice + "\n"  + _text 
	var new_notifier = NOTIFIER.instantiate()
	CONTAINER.add_child(new_notifier)
	new_notifier.show_notification(_notifier_text)

func get_action():
	pass
	#Action (A)	A decision or move the agent can take.
	

func play_click() -> void:
	if not $click.playing:
		$click.play()
