extends CanvasLayer
@onready var PC = $progress_container


func stats_changed(_string : String):
	PC.get_node(_string.split("_")[0]).value += float(_string.split("_")[1])
