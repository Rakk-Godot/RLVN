extends Control

signal done

var showing := false
var code = null

var pause_override = false

func _ready() -> void:
	show()
	$ui/Panel.hide()
	$ui/Panel/Confirm.connect("pressed", Callable(self, "_on_confirm"))
	$ui/Panel/Decline.connect("pressed", Callable(self, "_on_decline"))
	$ui/Panel/Decline2.connect("pressed", Callable(self, "_on_decline"))
	
func show_action(_code, _text, _notif=false,_c="Confirm",_d="Decline"):
	code = _code
	$ui/Panel/RichTextLabel.text = _text
	$ui/Panel.show()
	showing = true
	
	pause_override = false
	
	if get_tree().paused == true:
		pause_override = true
	else:
		get_tree().paused = true
	
	disable_all(false)
	$ui/Panel/Confirm.show()
	$ui/Panel/Confirm.text = _c
	$ui/Panel/Decline.show()
	$ui/Panel/Decline2.hide()
	$ui/Panel/Decline.text = _d
	
	if _notif == true:
		$ui/Panel/Confirm.hide()
		$ui/Panel/Decline.hide()
		$ui/Panel/Decline2.show()
		$ui/Panel/Decline2.text = $ui/Panel/Decline.text
	
func disable_all(disable):
	$ui/Panel/Confirm.disabled = disable
	$ui/Panel/Decline.disabled = disable
	$ui/Panel/Decline2.disabled = disable
	
func _on_confirm():
	disable_all(true)
	showing = false
	if pause_override == false:
		get_tree().paused = false
	$ui/Panel.hide()
	emit_signal("done", code, true)
	
func _on_decline():
	disable_all(true)
	showing = false
	if pause_override == false:
		get_tree().paused = false
	$ui/Panel.hide()
	emit_signal("done", code, false)
