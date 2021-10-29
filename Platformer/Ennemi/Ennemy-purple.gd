extends KinematicBody2D

const GRAVITY = 40
const SPEED = 250
const FLOOR = Vector2(0, -1)

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
		velocity.x = SPEED * direction
		
		if direction == 1:
			$AnimatedSprite.flip_h = true
		else: 
			$AnimatedSprite.flip_h = false
			
		$AnimatedSprite.play("Walk");
		
		velocity.y += GRAVITY
		
		velocity = move_and_slide(velocity, FLOOR)
	
	if is_on_wall():
		direction = direction * (-1)
		$RayCast2D.position.x *= (-1)
	
	if $RayCast2D.is_colliding() == false:
		direction = direction * (-1)
		$RayCast2D.position.x *= (-1)


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
