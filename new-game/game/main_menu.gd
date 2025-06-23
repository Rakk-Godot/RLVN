extends Node2D

@onready var ab = $action_box
@onready var settings = $settings

func _ready() -> void:
	ab.connect("done", Callable(self, "_action_done"))
	$Menu/NewGame.connect("pressed", Callable(self, "_on_new_game"))
	$Menu/LoadGame.connect("pressed", Callable(self, "_on_load_game"))
	$Menu/Settings.connect("pressed", Callable(self, "_on_settings"))
	$Menu/QuitGame.connect("pressed", Callable(self, "_on_quit"))
	$VersionLabel.text = "v" + Globals.version_code + " (" + Globals.version_name + " version)"
	$Menu/LoadGame.disabled = !Save.exists()
	
func newgame():
	Save.update_save(true)
	initialize_game()
	
func loadgame():
	Save.continue_save()
	initialize_game()
	
func initialize_game():
	$Menu/LoadGame.disabled = !Save.exists()
	Globals.change_scene("res://game/Main.tscn")
	
func _on_new_game():
	Agent.play_click()
	if Save.exists() == true:
		ab.show_action("newgame", 'Starting a new game will delete your current save file. \nAre you sure you want to start a new game?')
	else:
		newgame()
	
func _on_load_game():
	Agent.play_click()
	loadgame()
	
func _on_settings():
	Agent.play_click()
	settings.show_settings()
	
func _on_quit():
	Agent.play_click()
	get_tree().quit()
	
func _action_done(_code:String,_action:bool):
	if _code == "newgame":
		if _action == true:
			newgame()
