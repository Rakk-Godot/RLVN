extends Node

const SETTINGS = "settings"

const path_menu = "res://game/main_menu.tscn"

const WINDOW_MODES : Array[String] = [
	"Windowed",
	"Borderless",
	"Fullscreen",
]

const RESOLUTION_OPTIONS : Dictionary[String, Vector2i] = {
	"1152 x 648" : Vector2i(1152, 648),
	"1280 x 720" : Vector2i(1280, 720),
	"1920 x 1080" : Vector2i(1920, 1080), 
}

var version_code : String
var version_name : String
var version_type : String
var build_name : String

var dev_mode : bool
var demo_mode : bool
var deluxe_mode : bool
var loader_scenes = []

var queue_path : String
var game_data = {}

var text_speed = 0.05
var audio_settings_data = {
	"Master" : 1.0,
	"BGM" : 1.0,
	"SFX" : 1.0
}
var video_settings_data = {
	"window_mode" : 0,
	"resolution" : 1,
}

@onready var loader = $HUD/loading_screen
@onready var anim = $HUD/Anim

func _ready() -> void:
	Input.set_custom_mouse_cursor(load("res://assets/cursor.png"))
	load_settings_data()
	
func reset_data():
	pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("screenshot"):
		var img = get_viewport().get_texture().get_image()
		img.save_png("user://screenshot-" + str(randi()) + ".png")

func change_scene(_path):
	get_tree().paused = true
	queue_path = _path
	anim.play("outro")

func _on_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "outro":
		loader.start_load(queue_path)

func _on_loading_screen_done() -> void:
	get_tree().paused = false
	anim.play("intro")

func reset_settings_data():
	text_speed = 0.05
	audio_settings_data = {
		"Master" : 1.0,
		"BGM" : 1.0,
		"SFX" : 1.0
	}
	video_settings_data = {
		"window_mode" : 1,
		"resolution" : 1,
	}
	
func get_settings_data():
	return {
		"text_speed" : text_speed,
		"video_settings_data" : video_settings_data,
		"audio_settings_data" : audio_settings_data,
	}
	
func update_settings_data():
	var settings_data = get_settings_data()
	Save._game_save(SETTINGS, settings_data)
	
	_on_window_mode_select(settings_data["video_settings_data"]["window_mode"])
	_on_resolution_select(settings_data["video_settings_data"]["resolution"])

func load_settings_data():
	var settings_data = Save._game_load(SETTINGS)
	if settings_data == null:
		update_settings_data()
		
	settings_data = Save._game_load(SETTINGS)
	text_speed = settings_data["text_speed"]
	video_settings_data = settings_data["video_settings_data"]
	audio_settings_data = settings_data["audio_settings_data"]
	
	_on_window_mode_select(video_settings_data["window_mode"])
	_on_resolution_select(video_settings_data["resolution"])

func _on_window_mode_select(mode_index : int):
	match mode_index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		1:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		2:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
	
	video_settings_data["window_mode"] = mode_index
	center_window()

func _on_resolution_select(resolution_index : int):
	DisplayServer.window_set_size(RESOLUTION_OPTIONS.values()[resolution_index])
	video_settings_data["resolution"] = resolution_index
	center_window()
	
func center_window():
	var window = get_window()
	var current_screen = window.current_screen
	var screen_rect = DisplayServer.screen_get_usable_rect(current_screen)
	var window_size = window.get_size_with_decorations()
	if window.is_embedded() == false:
		window.position = screen_rect.position + ((screen_rect.size / 2) - (window_size / 2))

func is_even(num):
	return ((int(num/2)*2)==num)

func is_diviby(num,count): # is 10(num) divisible by 5(count)
	return ((num%count)==0)
