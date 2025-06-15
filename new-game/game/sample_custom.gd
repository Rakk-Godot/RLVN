extends Node2D

func _ready() -> void:
	var convo_arr = ["fuck you1", "bitch"]
	var outcome_key = ""
	var filters = {"bitch":"fuck"}
	var choices = {"choice1": {"text":"First choice","outcome":"none"},"choice2": {"text":"2nd choice","outcome":"none"}}
	$dialogue_ui.init_talk(convo_arr, outcome_key, filters, choices)

func _on_dialogue_ui_finished(_outcome) -> void:
	$dialogue_ui.hide_dialogue()
