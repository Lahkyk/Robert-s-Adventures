extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Health_health_depleted():
	if get_tree().change_scene("res://Menus/GameOver.tscn") != OK :
		print("erreur changement de scene")
	visible = not visible
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LevelEnd_sendEndConditionsStatus(status):
	if status == true: #the player reached the end and he collected enough coins
		if get_tree().change_scene("res://Menus/LvLComplete.tscn") != OK :
			print("erreur changement de scene")
		print("the end")
	else: #the player reached the end but doesn't have enough coins		
		print("You must collect 5 coins")
	pass # Replace with function body.
