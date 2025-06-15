extends Control

var audio_settings_changed = false
var video_settings_changed = false

var text_speeds = [0.1,0.08,0.05,0.3,0.01]

@onready var audio: VBoxContainer = $TabContainer/Audio
@onready var windowmode_options: OptionButton = $TabContainer/Video/WindowMode/OptionButton
@onready var resolution_options: OptionButton = $TabContainer/Video/Resolution/OptionButton
@onready var tab_container: TabContainer = $TabContainer

@onready var master_slider: HSlider = $TabContainer/Audio/Master/HSlider
@onready var bgm_slider: HSlider = $TabContainer/Audio/BGM/HSlider
@onready var sfx_slider: HSlider = $TabContainer/Audio/SFX/HSlider
@onready var text_speed_slider: HSlider = $TabContainer/Game/TextSpeed/HSlider



func _ready() -> void:
	visible = not visible
	$Close.pressed.connect(hide_settings)
	update_sliders()
	initialize_music_sliders()
	initialize_video_options()
	update_video_settings()

func update_sliders():
	for each in Globals.audio_settings_data:
		if audio.has_node(NodePath(each)):
			var slider: HSlider = audio.get_node(each + "/HSlider")
			slider.value = Globals.audio_settings_data[each]
	
	var text_speed_index = 0
	for each in text_speeds:
		if Globals.text_speed == each:
			break
		else:
			text_speed_index += 1
	text_speed_slider.value = text_speed_index

func initialize_music_sliders():
	for each in audio.get_children():
		if each.has_node("HSlider") == true:
			var slider : HSlider = each.get_node("HSlider")
			if slider != null:
				slider.value_changed.connect(_on_music_slider_changed.bind(each.name))
	

func initialize_video_options():
	windowmode_options.item_selected.connect(Callable(Globals, "_on_window_mode_select"))
	windowmode_options.item_selected.connect(_on_window_mode_select)
	resolution_options.item_selected.connect(Callable(Globals, "_on_resolution_select"))
	resolution_options.item_selected.connect(_on_resolution_select)

func update_video_settings():
	tab_container.current_tab = 0
	
	windowmode_options.clear()
	resolution_options.clear()
	
	for each in Globals.WINDOW_MODES:
		windowmode_options.add_item(each)
	
	for each in Globals.RESOLUTION_OPTIONS:
		resolution_options.add_item(each)
		
	update_active_window_mode(Globals.video_settings_data["window_mode"])
	update_active_resolution(Globals.video_settings_data["resolution"])
	
func _on_music_slider_changed(_value : float, _bus : String):
	audio_settings_changed = true
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(_bus), linear_to_db(_value))
	Globals.audio_settings_data[_bus] = _value

func update_settings():
	pass

func show_settings():
	show()
	update_video_settings()
	
func hide_settings():
	hide()

func _on_mute_pressed() -> void:
	for each in audio.get_children():
		if each.has_node("HSlider") == true:
			var slider : HSlider = each.get_node("HSlider")
			if slider != null:
				slider.value = 0.0

func _on_window_mode_select(_index : int):
	if _index == 2:
		update_active_resolution(_index)
		resolution_options.disabled = true
	elif [0, 1].has(_index) == true:
		resolution_options.disabled = false
	
func _on_resolution_select(_index : int):
	DisplayServer.window_set_size(Globals.RESOLUTION_OPTIONS.values()[_index])
	if _index < 2:
		pass
	
func update_active_window_mode(_index : int):
	windowmode_options.select(_index)

func update_active_resolution(_index : int):
	resolution_options.select(_index)

func _on_confirm_pressed() -> void:
	hide()
	Globals.text_speed = text_speeds[text_speed_slider.value]
	Globals.update_settings_data()

func _on_reset_pressed() -> void:
	Globals.reset_settings_data()
	update_sliders()
