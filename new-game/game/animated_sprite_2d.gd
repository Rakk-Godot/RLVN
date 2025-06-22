extends AnimatedSprite2D

var reversed : bool = false

func _ready() -> void:
	play("default")

func _on_animation_finished() -> void:
	if reversed == false:
		play_backwards("default")
		
	else:
		play("default")
	reversed = ! reversed
