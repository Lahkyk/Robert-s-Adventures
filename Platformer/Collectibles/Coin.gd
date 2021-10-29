extends Area2D

signal coin_collected

func _on_Coin_body_entered(body):
	if body.name == "player":
		emit_signal("coin_collected")
		queue_free()
	pass # Replace with function body.
