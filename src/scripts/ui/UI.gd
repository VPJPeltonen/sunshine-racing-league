extends Control

signal start_race
signal power_use_change(change)

func _on_StartButton_pressed():
	emit_signal("start_race")
	$StartButton.hide()

func _on_PowerUse_value_changed(value):
	emit_signal("power_use_change",value)
