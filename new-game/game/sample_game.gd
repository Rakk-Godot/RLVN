extends Node2D

var active_button = null

func _ready() -> void:
	for each in $Buttons.get_children():
		each.connect("button_up", Callable(self, "_on_button_up"))
		each.connect("button_down", Callable(self, "_on_button_down").bind([each]))

func _process(_delta: float) -> void:
	if active_button != null:
		active_button.global_position = get_global_mouse_position() - (active_button.get_global_rect().size/2.0)

func _on_main_menu_pressed() -> void:
	Globals.change_scene(Globals.path_menu)

func _on_button_up() -> void:
	active_button = null

func _on_button_down(_button) -> void:
	active_button = _button[0]
