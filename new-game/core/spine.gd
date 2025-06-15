extends Node

func get_animation_name(_spineprite: SpineSprite) -> String:
	var anim_name : String = ""
	if is_instance_valid(_spineprite):
		var track_entry = _spineprite.get_animation_state().get_current(0)
		if track_entry:
			anim_name = track_entry.get_animation().get_name()
	return anim_name

func set_spine_animation(_spinesprite : SpineSprite,_animname: String, _loop: bool = true, _time :int = 0) -> void:
	if is_instance_valid(_spinesprite):
		var set_anim = _spinesprite.get_animation_state()
		set_anim.set_animation(_animname,_loop,_time)

func set_skin(_spinesprite : SpineSprite, _skinname: String) -> void:
	if is_instance_valid(_spinesprite):
		_spinesprite.get_skeleton().set_skin_by_name(_skinname)
