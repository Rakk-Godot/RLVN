extends Node2D

func change_anim(_node : String,_anim : String):
	var _spirte = $sprite_parent.get_node_or_null(_node)
	if _spirte:
		_spirte.change_anim(_anim)
