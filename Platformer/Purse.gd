extends Node

signal rupees_changed(count)
signal five_coins_collected

export(int) var coins = 0

func _ready():
	emit_signal("rupees_changed", coins)

func _collect_coin():
	coins += 1
	emit_signal("rupees_changed", coins)
	$CoinCollected.play()
	if coins == 5:
		emit_signal("five_coins_collected")
