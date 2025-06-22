extends Node

var agent_data : Dictionary = {}
var learn_count : int = 0


var depression : float
var gpa : float
var sociallife : float

func learn_game(_choice,_result,_value):
	#Agent	The learner or decision-maker (e.g., a character in a game).
	print(_choice, " : ", _result, " : ", _value)
	var _scene = Globals.current_scene
	var _good : bool = false

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
	agent_data[learn_count][_scene][_choice][_result] = _good
	print(agent_data)

func get_action():
	pass
	#Action (A)	A decision or move the agent can take.
	
