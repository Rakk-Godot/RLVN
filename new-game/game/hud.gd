extends CanvasLayer
@onready var PC = $progress_container


func stats_changed(_string : String,_last_choice: String):
	var _stats = _string.split("_")[0]
	var _value = float(_string.split("_")[1])
	Agent.learn_game(_last_choice,_stats,_value)
	PC.get_node(_stats).value += _value
