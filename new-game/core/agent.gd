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

func get_action(_choice):
	var action_detected = {
	}
	for each in agent_data:
		if agent_data[each].has(Globals.current_scene):
			if agent_data[each][Globals.current_scene].has(_choice):
				for _key in agent_data[each][Globals.current_scene][_choice]:
					action_detected[_key] = agent_data[each][Globals.current_scene][_choice][_key]
	var _good = true
	var dialouge_list = {
		"sociallife" : {
			true : ["This choice has increased my Social Life stat","My Social Life meter will go up","Choosing to join in really improved my social life"],
			false: ["This choice has decreased my Social Life stat.","My Social Life meter will go down","Spending time alone again has lowered my social life"],
		},
		"gpa" : {
			true : ["My GPA will go up","This choice will increase my GPA stat.","Focusing on school will raise my GPA"],
			false: ["My GPA will go down","This choice will decrease my GPA stat.","My GPA suffered because of this choice"],
		},
		"depression" : {
			true : ["This decision helps lower my Depression level","This choice eased some of the weight I’ve been carrying","Doing this helped me feel less overwhelmed"],
			false: ["This decision will raise my Depression level","This choice adds to my emotional burden","I know this will make my depression worse"],
		},
	}
	
	var idx = 0
	var _and = " and "
	var final_text : String
	for each in action_detected:
		if idx > 0:
			final_text += _and
		final_text += dialouge_list[each][action_detected[each]][randi() % 3]
		idx += 1
	if final_text != "":
		final_text += "."
	return final_text

func game_ended() -> String:
	var end_text : String
	var dead = false
	if gpa >= 70:
		end_text += "You Graduated from College!"
	elif gpa > 90:
		end_text += "You Graduated from College with Honor!"
	
	if depression > 70 and gpa >= 70:
		dead = true
		end_text += "\nBut after Several Months, you commit suicide due to depression"
	elif  depression > 70 and gpa < 70:
		dead = true
		end_text += "\nAnd you commit suicide due to depression"

	if dead == true:
		if sociallife > 80:
			end_text += "\n\nYou make a lot of friends, they come to your funeral!"
		else:
			end_text += "\n\nNone of your school mate go to your funeral,\nbecause you failed your social life"
	else:
		end_text += "\n\nYou did't supper any depression!"
		
		if sociallife > 80:
			end_text += "\n\nYou live a happy life because you got a lot of friends!"
		elif sociallife > 60:
			end_text += "\n\nYou have few friend but your still happy with them!"
	print("sociallife: " ,sociallife, "gpa: ", gpa, "depression: ", depression )
	Globals.reset_stats()
	return end_text

func play_click() -> void:
	if not $click.playing:
		$click.play()
