extends KinematicBody2D

signal requestEndConditionsStatus


# Pour changer les axes pour pouvoir sauter
const UP = Vector2(0,-1)

# Constance utilisé dans le système de jeu
const GRAVITY = 40
const SPEED = 400
const JUMP_HEIGHT = -1150

const FIREBALL = preload("res://Armement/fireball.tscn")
const CLOCHE = preload("res://Armement/tir_Cloche.tscn")
const JUMP_ANIM = preload("res://anim_jump.tscn")

# ce qui vient après remplace 
# var motionx = 0
# var motiony = 0
var motion = Vector2()

onready var invulnerability_timer = $InvulnerabilityTimer

var armeActuelle = 0




# Called every frame. 'delta' is the elapsed time since the previous frame.
#for physics only

func _physics_process(_delta):

# Gravité	
	motion.y += GRAVITY
	
# Déplacement gauche/droite + à l'arrêt si aucun bouton appuyé
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Sprite.flip_h = false
		if sign($Position2D.position.x) == -1:
				$Position2D.position.x *= -1
		if is_on_floor():
			if invulnerability_timer.is_stopped():
				$Sprite.play("Walk")
			else:
				$Sprite.play("WalkDamaged")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite.flip_h = true
		if sign($Position2D.position.x) == 1:
				$Position2D.position.x *= -1
		if is_on_floor():
			if invulnerability_timer.is_stopped():
				$Sprite.play("Walk")
			else:
				$Sprite.play("WalkDamaged")
	else :
		motion.x = 0
		if invulnerability_timer.is_stopped():
			$Sprite.play("Idle")
		else:
			$Sprite.play("IdleDamaged")
		
		
		
# Pour sauter

	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			$JumpSound.play()
			var jump_anim = JUMP_ANIM.instance()
			get_parent().add_child(jump_anim)
			motion.y = JUMP_HEIGHT
			jump_anim.position = $Pos_Jump_Anim.global_position
			
	else: 
		if invulnerability_timer.is_stopped():
			$Sprite.play("Air")
		else:
			$Sprite.play("AirDamaged")
			
			
	if Input.is_action_just_pressed("ui_focus_next"):
		
		if armeActuelle == 0 :
			var fireball = FIREBALL.instance()
			if sign($Position2D.position.x) == 1:
				fireball.set_fireball_direction(1)
			else:
				fireball.set_fireball_direction(-1)
			get_parent().add_child(fireball)
			fireball.position = $Position2D.global_position
		
#		if armeActuelle == 1 :
#			var cloche = CLOCHE.instance()
#			if sign($Position2D.position.x) == 1:
#				cloche.set_fireball_direction(1)
#			else:
#				cloche.set_fireball_direction(-1)
#			get_parent().add_child(cloche)
#			cloche.position = $Position2D.global_position
		
# Résolution des commandes sur motion & UP
	motion = move_and_slide(motion,UP)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if "Ennemy-red" in collision.collider.name || "Ennemy-purple" in collision.collider.name:
			damage(1)
		if "Hole" in collision.collider.name:
			damage(3)
		if "LevelEnd" in collision.collider.name:
			emit_signal("requestEndConditionsStatus")
			
#	if Input.is_action_just_pressed("ui_end"):
#		if armeActuelle == 0 :
#			armeActuelle = 1
#			print("alelouia")
#		else :
#			armeActuelle = 0 
	pass


func _on_Coin_coin_collected():
	$Purse._collect_coin()
	pass # Replace with function body.

func damage(amount):
	if invulnerability_timer.is_stopped():
		invulnerability_timer.start()
		$VirusDamageSound.play()
		$Health.take_damage(amount)
		

