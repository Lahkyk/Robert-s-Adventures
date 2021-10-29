extends Area2D

const SPEED = 500

var velocity = Vector2()
var direction = 1



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_fireball_direction(dir):
	direction = dir
	if dir == -1:
		$AnimatedSprite.flip_h = true
		$CollisionShape2D.position.x *= -1
	
	
	
func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)
	$AnimatedSprite.play("shoot")
	pass



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.


func _on_fireball_body_entered(body):
	if "Ennemy-purple" in body.name :
		body.dead()
	elif 'Ennemy-red' in body.name:
		body.dead()
	queue_free()
	pass # Replace with function body.
