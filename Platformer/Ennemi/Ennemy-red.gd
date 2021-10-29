extends KinematicBody2D

var velocity = Vector2()

var direction = 1 #1 is right, -1 is left

var is_dead = false

func _ready():
	pass

func dead():

	is_dead = true
	velocity = Vector2(0,0)
	$AnimatedSprite.play("Dead")
	$CollisionPolygon2D.call_deferred("set_disabled",true)	
	$Timer.start()

func _physics_process(_delta):
	if is_dead == false :
		
		if direction == 1:
			$AnimatedSprite.flip_h = false
		else: 
			$AnimatedSprite.flip_h = true


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
