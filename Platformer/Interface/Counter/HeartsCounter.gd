extends NinePatchRect

func _on_Interface_health_changed(health):
	$Number.text = str(health)
