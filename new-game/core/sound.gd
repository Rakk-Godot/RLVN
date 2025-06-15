extends Node

@export var crossfade_duration: float = 1.0
@export var volume_increase: float
@export var volume_decrease: float
@export_enum("-10.0:-10", "-50.0:-50", "-81.0:-81") var lowest_volume : int

var active_audio = null
var next_audio = null
var audio_override = null

var start_volume = 0.0
var override = false

var elapsed_time : int = 0
var sound_ending = false

var is_crossfade = false

var crossfade_pivot = null

@onready var fadein_timer: Timer = $FadeinTimer
@onready var fadeout_timer: Timer = $FadeoutTimer
@onready var elapsed_timer: Timer = $ElapsedTimer

func _ready() -> void:
	#play("res://assets/audio/bgm_1.mp3")
	#crossfade("res://assets/audio/bgm_1.mp3", "res://assets/audio/bgm_gallery.mp3")
	#update_audio_info()
	lowest_volume = float(lowest_volume)

func play(current_audio : String):
	if ResourceLoader.exists(current_audio) == true:
		elapsed_time = 0
		var audio = create_audio()
		audio.stream = load(current_audio)
		audio.play()
		elapsed_timer.start()
		if audio_override == null:
			next_audio = audio
		else:
			active_audio = audio
		crossfade_pivot = audio.stream.get_length()

func create_audio():
	var audio = AudioStreamPlayer.new()
	add_child(audio)
	audio.finished.connect(_on_audio_finished.bind(audio))
	return audio

func _on_audio_finished(_audio : AudioStreamPlayer):
	_audio.queue_free()
	
func update_audio_info():
	if active_audio != null:
		if is_crossfade == true:
			crossfade_pivot = crossfade_pivot - crossfade_duration

func crossfade(current_audio : String, override_audio = null, from_position : float = 0.0,
			volume_db : float = -81.0, pitch_scale : float = -1.0):
	is_crossfade = true
	audio_override = override_audio
	play(current_audio)
	
	if override_audio != null:
		override = true
	else:
		next_audio.volume_db = volume_db
	start_volume = active_audio.volume_db

func custom_crossfade(current_audio : AudioStreamPlayer, override_audio = null, from_position : float = 0.0,
			volume_db : float = -81.0, pitch_scale : float = -1.0):
	is_crossfade = true
	audio_override = override_audio
	active_audio = current_audio
	
	if override_audio != null:
		override = true
	else:
		next_audio.volume_db = volume_db
	start_volume = active_audio.volume_db
	fade_out()
	fade_in()

func fade_in():
	if audio_override != null:
		crossfade(audio_override, null, 0.0, -30.0)
		audio_override = null
		is_crossfade = false 
		fadein_timer.start()
			
func fade_out():
	if active_audio != null and active_audio.playing == true and fadeout_timer.is_stopped() == true:
		fadeout_timer.start()

func active_audio_ending() -> bool:
	return elapsed_time >= crossfade_pivot

func _on_fadeout_timer_timeout() -> void:
	if active_audio != null:
		if active_audio.volume_db > lowest_volume:
			active_audio.volume_db -= volume_decrease

func _on_elapsed_timer_timeout() -> void:
	elapsed_time += 1
	
	if (is_crossfade == true and active_audio_ending()) or override == true:
		fade_out()
		fade_in()

func _on_fadein_timer_timeout() -> void:
	if next_audio != null:
		if next_audio.volume_db <= -10.0:
			next_audio.volume_db += volume_increase
