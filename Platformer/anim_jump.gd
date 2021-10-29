extends Area2D

var velocity = Vector2()

func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	$AnimatedSprite.play("anim_jump")
	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.


func _on_AnimatedSprite_animation_finished():
	queue_free()
	pass # Replace with function body.
