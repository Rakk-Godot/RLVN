extends Control

var audio_settings_changed = false
var video_settings_changed = false

var text_speeds = [0.1,0.08,0.05,0.3,0.01]

@onready var audio: VBoxContainer = $Audio

@onready var master_slider: HSlider = $Audio/Master/HSlider
@onready var bgm_slider: HSlider = $Audio/BGM/HSlider
@onready var sfx_slider: HSlider = $Audio/SFX/HSlider


func _ready() -> void:
	hide()
	$Close.pressed.connect(hide_settings)
	update_sliders()
	initialize_music_sliders()
	for each in Globals.audio_settings_data:
		_on_music_slider_changed(Globals.audio_settings_data[each],each)


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

func initialize_music_sliders():
	for each in audio.get_children():
		if each.has_node("HSlider") == true:
			var slider : HSlider = each.get_node("HSlider")
			if slider != null:
				slider.value_changed.connect(_on_music_slider_changed.bind(each.name))




func _on_music_slider_changed(_value : float, _bus : String):
	audio_settings_changed = true
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(_bus), linear_to_db(_value))
	Globals.audio_settings_data[_bus] = _value



func update_settings():
	pass

func show_settings():
	show()

func hide_settings():
	hide()

func _on_mute_pressed() -> void:
	for each in audio.get_children():
		if each.has_node("HSlider") == true:
			var slider : HSlider = each.get_node("HSlider")
			if slider != null:
				slider.value = 0.0

func _on_confirm_pressed() -> void:
	hide()
	Globals.update_settings_data()

func _on_reset_pressed() -> void:
	Globals.reset_settings_data()
	update_sliders()
