extends Control

signal finished
signal stats_changed
signal change_anim

@export var auto = false

var char_speed = 0.05
var codes = ["[center]", "\n", "[color=#fff125]", "[/color]", "[animation]"]

@onready var content_node = $UI/Content
@onready var reader = $dialogue_reader

var current_tween = null

var story : Dictionary

var active_arc : String
var active_key : String
var prev_key : String

var content_arr = []
var content_idx = 0
var choice_outcome = null
var choice_response = false

var is_choices_active = false
var filters = {}
var active = false
var outcome_key = null
var custom_choices = {}
var disabled_keyboard = false
var transitioning : bool = false

var last_choice : String
var current_button = null


func _process(delta: float) -> void:
	$agent_helper.visible = Agent.learn_count > 0
	if Agent.learn_count == 0:
		$agent_helper.hide()


func _ready() -> void:
	clear_helper()
	for choice in $UI/Choices.get_children():
		choice.connect("pressed", Callable(self, "_on_choice").bind(choice))
	choices_visible(false)
	$UI/BaseClick.connect("pressed", Callable(self, "_on_next_click"))
	content_node.visible_characters = 0
	hide()

func clear_helper() -> void:
	$UI/helper.hide()
	$UI/helper/proceed.disabled = true
	$UI/helper/helper_text.text = ""
	$UI/helper/helper_text.visible_ratio = 0
	
func show_helper(_text) -> void:
	$UI/helper.show()
	$UI/helper/helper_text.text = _text
	$UI/helper/anim.play("show_text")

func _on_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "show_text":
		$UI/helper/proceed.disabled = false

func _on_proceed_pressed() -> void:
	action_button(current_button)
	clear_helper()


func initialize(_story):
	story = _story
	reader.init_pre(story)

func init_start(arc, key, _filters={}):
	reader.init_read(arc, key)
	active_arc = arc
	filters = _filters
	init_next(key)
	
func init_talk(content, key, _filters={}, _choices={}):
	reset_content()
	outcome_key = key
	custom_choices = _choices
	filters = _filters
	content_arr = content
	play_content()
	active = true
	
func init_next(_key, from_last=false):
	var f = filters.duplicate()
	reset_content()
	filters = f.duplicate()
	if active_key != null:
		prev_key = active_key
	reader.init_read(reader.init_class, _key)
	active_key = _key
	content_arr = reader.get_story_content()
	if from_last == true:
		content_idx = content_arr.size()-1
	play_content()
	active = true

func reset_content():
	outcome_key = null
	custom_choices = {}
	filters = {}
	content_arr = []
	content_idx = 0
	
func hide_dialogue():
	reset_content()
	choices_visible(false)
	hide()

func _on_choice(button):
	Agent.play_click()
	clear_helper()
	if Agent.learn_count > 0 and $agent_helper.button_pressed == true:
		var _text = Agent.get_action(button.choice_text)
		if _text != "":
			show_helper(_text)
			current_button = button
		else:
			action_button(button)
	else:
		action_button(button)

func action_button(button):
	current_button = null
	if current_tween == null:
		if custom_choices.is_empty():
			choices_visible(false)
			choice_outcome = button.outcome
			if button.response.size() > 0:
				last_choice = button.choice_text
				choice_response = true
				content_arr = button.response
				content_idx = 0
				play_content()
			else:
				choice_next()
		else:
			active = false
			emit_signal("finished", button.outcome)





func choice_next():
	if auto == true:
		init_next(choice_outcome)
	else:
		active = false
		emit_signal("finished", choice_outcome)

func choices_visible(_visible):
	for choice in $UI/Choices.get_children():
		choice.visible = _visible
	is_choices_active = _visible

func show_choices():
	var choices = reader.get_choices()
	var idx = 1
	for each in choices:
		var button = $UI/Choices.get_node(each["title"])
		button.text = each["text"]
		button.choice_text = "choice" + str(idx)
		button.response = each["resp"]
		button.outcome = each["outcome"]
		button.show()
		idx += 1
	is_choices_active = true

func show_custom_choices(_arr):
	for each in _arr.keys():
		var button = $UI/Choices.get_node(each)
		button.text = _arr[each]["text"]
		button.outcome = _arr[each]["outcome"]
		button.show()
	is_choices_active = true

func content_end():
	if outcome_key != null:
		if custom_choices.is_empty() == false:
			show_custom_choices(custom_choices)
		else:
			active = false
			emit_signal("finished", outcome_key)
	elif choice_response == true:
		choice_next()
		choice_response = false
		choice_outcome = null
	else:
		var outcome = reader.get_outcome()
		if outcome == "$choices":
			show_choices()
		elif outcome == null and outcome_key == null:
			active = false
			emit_signal("finished", outcome)
		else:
			if auto == true:
				init_next(outcome)
			else:
				if outcome_key == null:
					active = false
					emit_signal("finished", outcome)

func _on_next_click():
	next_slide()

func _input(_event: InputEvent) -> void:
	if disabled_keyboard == false and transitioning == false:
		if Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_accept"):
			next_slide()
		if Input.is_action_just_pressed("ui_left"):
			prev_slide()

func prev_slide():
	choices_visible(false)
	if current_tween != null:
		current_tween.kill()
		content_node.visible_ratio = 1.0
		tween_done()
	else:
		if content_idx > 0:
			content_idx -= 1
			play_content()
		else:
			if prev_key != null and prev_key != "":
				init_next(prev_key, true)

func next_slide():
	if current_tween != null:
		current_tween.kill()
		content_node.visible_ratio = 1.0
		tween_done()
	else:
		if content_idx < content_arr.size()-1:
			content_idx += 1
			play_content()
		else:
			content_end()

func play_content():
	show()
	var content = content_arr[content_idx]
	if content.find("$$") >= 0:
		var __name = content.split("$$")[0]
		content = content.split("$$")[1]
		$UI/Charname.text = __name
		$UI/Charname.show()
	else:
		$UI/Charname.text = ""
		$UI/Charname.hide()

	if content.find("||") >= 0:
		var all_content = content
		var split_content := Array(all_content.split("||"))
		var new_content = split_content[0]
		content = new_content
		split_content.erase(new_content)
		for each in split_content:
			emit_signal("stats_changed",each,last_choice)

	if content.find("%%") >= 0:
		var _anim = content.split("%%")[1]
		var _node = _anim.split("_")[0]
		var _emo = _anim.split("_")[1]
		emit_signal("change_anim",_node,_emo)
		content = content.split("%%")[0]

	content_node.visible_characters = 0
	content_node.text = content
	for each in filters.keys():
		content_node.text = content_node.text.replace(each, filters[each])
	content_node.show()
	tween_content(content)


func change_dial_scene() -> void:
	content_node.text = ""
	$UI/Charname.text = ""
	$UI/Charname.hide()
	for each in $UI/Choices.get_children():
		each.hide()

func tween_content(_content):
	if current_tween != null:
		current_tween.kill()
	var length = get_length(_content)
	var tween = get_tree().create_tween()
	tween.tween_property(content_node, "visible_characters", length, length * char_speed)
	tween.tween_callback(self.tween_done)
	current_tween = tween

func tween_done():
	current_tween = null

func get_length(text):
	var t = text
	for each in codes:
		t = t.replace(each, "")
	return t.length()
