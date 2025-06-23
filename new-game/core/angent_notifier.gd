extends Panel


func show_notification(_text : String):
	$Details.text = _text
	$AnimationPlayer.play("start")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "start":
		queue_free()
