extends Node

const DEMO = "demo"
const FULL = "full"
const DELUXE = "deluxe"

@export_group("Main")
@export var version_code = "0.0.00"
@export_enum(DEMO, FULL, DELUXE) var version_type = FULL
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
	Save.save_name = save_name
	Save.link_discord = discord
	Save.link_patreon = patreon
	Save.link_itch = itch
	Save.link_twitter = x
	Save.link_steam = steam
	Save.link_substar = substar
	
	Globals.loader_scenes = loader_paths
	Globals.version_code = version_code
	Globals.version_type = version_type
	Globals.build_name = build_name
	
	Globals.dev_mode = dev_mode
	
	if version_type == DEMO:
		Globals.demo_mode = true
		Globals.deluxe_mode = false
		Globals.version_name = "free"
	elif version_type == FULL:
		Globals.demo_mode = false
		Globals.deluxe_mode = false
		Globals.version_name = "full"
	elif version_type == DELUXE:
		Globals.demo_mode = false
		Globals.deluxe_mode = true
		Globals.version_name = "deluxe"
	else:
		Globals.version_name = "unknown"
	
	if dev_mode == true:
		Globals.version_name = "developer"
	
func _process(_delta: float) -> void:
	get_tree().change_scene_to_file("res://game/disclaimer.tscn")
