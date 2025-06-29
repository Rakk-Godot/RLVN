extends Node2D


var pos_depression : int
var pos_gpa : int
var pos_sociallife : int
var neg_depression : int
var neg_gpa : int
var neg_sociallife : int


func _ready() -> void:
	
	var story_dict = DScript.new().story
	var new_story = story_dict["main"]
	var temp_array : Array = []
	var depression_max : int
	var gpa_max : int
	var social_life_max : int
	
	for _date in new_story.keys():
		var current_depression : int = 0
		var current_gpa : int = 0
		var current_social_life : int = 0
		for _type in new_story[_date]:

			
			if _type == "content":
				temp_array == new_story[_date][_type]
				
			elif _type.contains("choice"):
				temp_array = new_story[_date][_type]["response"]
				
			for each in temp_array:

				
				if each.find("||") >= 0:
					var _split = each.split("||")
					for _ss in _split:
						if _ss.begins_with("gpa"):
							var _var = int(_ss.split("_")[1])
							if _var >= 0:
								pos_gpa += _var
								if _var > current_gpa:
									current_gpa = _var
								
							else:
								neg_gpa += abs(_var)
						elif _ss.begins_with("depression"):
							var _var = int(_ss.split("_")[1])
							if _var >= 0:
								pos_depression += _var
								if _var > current_depression:
									current_depression = _var
							else:
								neg_depression += abs(_var)
							
						elif _ss.begins_with("sociallife"):
							var _var = int(_ss.split("_")[1])
							if _var >= 0:
								pos_sociallife += _var
								if _var > current_social_life:
									current_social_life = _var
							else:
								neg_sociallife += abs(_var)
		depression_max += current_depression
		gpa_max += current_gpa
		social_life_max += current_social_life
			
	print("depression_max: " ,depression_max, "     gpma_max: ", gpa_max, "     social_life_max: ", social_life_max )
	print("pos_depression:",pos_depression,"     pos_gpa: ", pos_gpa, "        pos_sociallife: ",pos_sociallife, "        neg_depression: " ,neg_depression,"        neg_gpa: ",neg_gpa,"           neg_sociallife: ",neg_sociallife)
