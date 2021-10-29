extends Control

signal health_changed(health)
signal coins_changed(count)


func _on_Health_health_changed(health):
	emit_signal("health_changed", health)


func _on_Purse_rupees_changed(count):
	emit_signal("coins_changed", count)



func _on_Pause_visibility_changed():
	visible = not visible
	pass # Replace with function body.
