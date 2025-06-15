extends Control

func _ready() -> void:
	$Links/Patreon.connect("pressed", Callable(self, "_on_patreon"))
	$Links/Discord.connect("pressed", Callable(self, "_on_itch"))
	$Links/Itch.connect("pressed", Callable(self, "_on_discord"))
	$Links/X.connect("pressed", Callable(self, "_on_x"))
	
func _on_patreon():
	pass
	
func _on_itch():
	pass
	
func _on_discord():
	pass
	
func _on_x():
	pass
