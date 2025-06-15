extends Node2D

func _ready() -> void:
	$Continue.connect("pressed", Callable(self, "_on_continue"))

func _on_continue() -> void:
	if $AnimationPlayer.is_playing() == false:
		Globals.change_scene(Globals.path_menu)
		
		
