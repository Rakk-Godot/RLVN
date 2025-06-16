extends Node

const DEMO = "demo"
const FULL = "full"
const DELUXE = "deluxe"

@export_group("Main")
@export var version_code = "0.0.00"
@export var build_name = ""
@export var save_name = "save_data"
@export var dev_mode = false
@export var loader_paths : PackedStringArray = [Globals.path_menu]

@export_group("Links")
@export var discord = ""
@export var patreon = ""
@export var itch = ""
@export var x = ""
@export var steam = ""
@export var substar = ""
	
func _ready() -> void:
	Globals.loader_scenes = loader_paths
	Globals.version_code = version_code
	Globals.build_name = build_name

func _process(_delta: float) -> void:
	get_tree().change_scene_to_file("res://game/main_menu.tscn")
