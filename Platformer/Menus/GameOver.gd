extends Control

func _ready():
	$Restart.grab_focus()
	pass 


func _physics_process(_delta):
	if $Restart.is_hovered() == true :
		$Restart.grab_focus()
	if $Quit.is_hovered() == true :
		$Quit.grab_focus()
	pass

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if get_tree().change_scene("res://Start-up.tscn") != OK :
			print("erreur reload scene")
		pass


func _on_Quit_pressed():
	if get_tree().change_scene("res://Start-up.tscn") != OK :
		print("erreur reload scene")
	pass # Replace with function body.


func _on_Restart_pressed():
	if get_tree().change_scene("res://world.tscn") != OK :
		print("erreur reload scene")
	pass # Replace with function body.



