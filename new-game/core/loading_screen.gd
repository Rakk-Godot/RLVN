extends Control

signal done

var rng = RandomNumberGenerator.new()

var queue_path = null

var secs = 0
var tsecs = 28
var max_secs = 30
var delay = 0.03

func _ready():
	hide()

func start_load(_path):
	if queue_path == null:
		queue_path = _path
		if Globals.loader_scenes.has(queue_path):
			rng.randomize()
			show()
			tsecs = max_secs - rng.randi_range(1, 3)
			$ProgressBar.max_value = max_secs
			$ProgressBar.value = secs
			$Timer.start(delay)
		else:
			get_tree().change_scene_to_file(queue_path)
			end_load()
	else:
		print("trying to load while loading something else")

func end_load():
	$Timer.stop()
	queue_path = null
	hide()
	secs = 0
	emit_signal("done")

func _on_timer_timeout() -> void:
	if queue_path != null:
		secs += 1
		$ProgressBar.value = secs
		
		if secs > tsecs:
			get_tree().change_scene_to_file(queue_path)
		
		if secs >= max_secs:
			end_load()
