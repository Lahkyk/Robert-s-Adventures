extends StaticBody2D

signal sendEndConditionsStatus(status)

var endConditionsCompleted = false

func _on_Purse_five_coins_collected():
	endConditionsCompleted = true
	pass

func _on_player_requestEndConditionsStatus():
	emit_signal("sendEndConditionsStatus", endConditionsCompleted)
	pass
