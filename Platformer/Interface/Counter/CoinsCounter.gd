extends NinePatchRect

func _on_Interface_coins_changed(count):
	$Number.text = str(count)+"/5"
