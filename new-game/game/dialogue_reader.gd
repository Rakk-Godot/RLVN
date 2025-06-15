extends Node

var choices_size = 5
var remember_variant = true

var story : Dictionary = {}

var curr_variant = "v1"
var prev_variant = "v1"

var og_key = null
var init_key = null
var init_class = null
var safe_key = null

var content = null

func _ready():
	randomize()

func init_pre(_story):
	story = _story.duplicate(true)
	for arc in story.keys():
		for key in story[arc].keys():
			if key.split("||").size() <= 1:
				var _content = story[arc][key]
				story[arc].erase(key)
				story[arc][key + "||v1"] = _content

func init_read(sclass, key, random=true):
	var variant = "v1"
	var delimeter = "||"
	
	safe_key = key + delimeter + variant
	
	if random:
		var story_variant_keys = []
		for _key in story[sclass].keys():
			var k = _key.split("||")
			
#			print("k[0]=" + str(k[0]) + " && key" + str(key))
			
			if k[0] == key:
				story_variant_keys.append(k[1])
				
		if story_variant_keys.size() > 0:
			variant = story_variant_keys[randi() % story_variant_keys.size()]
				
	
	og_key = key
	curr_variant = variant
	init_key = key + delimeter + variant
	init_class = sclass

func is_end(_class=init_class,_key=init_key):
	var variant = "v1"
	var delimeter = "||"
	if story[_class].has(_key + delimeter + variant):
		return false
	return true

func get_story_content(_class=init_class,_key=init_key):
	return story[_class][_key]["content"]

func get_choices():
	var choices = []
	for i in range(1,choices_size+1):
		var info = get_choice_content(i)
		if info:
			if info["text"] != "":
				choices.append(info)
	return choices

func get_outcome():
	# return whether the next is direct outcome or display of choices
	var choice_count = 0
	for i in range(1,choices_size+1):
		var info = get_choice_content(i)
		if info:
			if info["text"] != "":
				choice_count += 1
	if choice_count > 0:
		return "$choices"
	elif choice_count == 0 and story.has(init_class):
		if story[init_class].has(init_key):
			if story[init_class][init_key].has("outcome"):
				return story[init_class][init_key]["outcome"]
	return null

func get_choice_content(idx):
	var title = "choice"+str(idx)
	if story.has(init_class):
		if story[init_class].has(init_key):
			if story[init_class][init_key].has(title):
				var info = story[init_class][init_key][title]
				return {
					"title": title,
					"text": info["choice"],
					"resp": info["response"],
					"outcome": info["outcome"]
				}
	return null
