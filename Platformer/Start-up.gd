extends Control

func _ready():

	pass 


#func _physics_process(delta):
#	if $Start.is_hovered() == true :
#		$Start.grab_focus()
#	if $Quit.is_hovered() == true :
#		$Quit.grab_focus()
#	pass

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
		pass


func _on_Start_pressed():
	if get_tree().change_scene("res://world.tscn") != OK :
		print("erreur lancement niveau")
	pass # Replace with function body.


func _on_Quit_pressed():
	get_tree().quit()
	pass # Replace with function body.

