extends Control

func _ready():
	$Resume.grab_focus()
	pass 


func _physics_process(_delta):
	if $Resume.is_hovered() == true :
		$Resume.grab_focus()
	if $Restart.is_hovered() == true :
		$Restart.grab_focus()
	if $Quit.is_hovered() == true :
		$Quit.grab_focus()
	pass

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		$Resume.grab_focus()
		get_tree().paused = not get_tree().paused
		visible = not visible
		pass


func _on_Quit_pressed():
	if get_tree().change_scene("res://Start-up.tscn") != OK :
		print("erreur changement de scene")
	get_tree().paused = not get_tree().paused
	pass # Replace with function body.


func _on_Resume_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible
	pass # Replace with function body.
	

func _on_Restart_pressed():
	if get_tree().reload_current_scene() != OK :
		print("erreur reload scene")
	get_tree().paused = not get_tree().paused
	pass # Replace with function body.


func _on_Pause_mouse_exited():
	emit_signal("unpause_true")
	pass # Replace with function body.


