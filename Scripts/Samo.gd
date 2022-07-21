extends KinematicBody2D

signal just_shot(new_combo)

var lineal_vel = Vector2.ZERO #velocidad lineal que parte como cero (velocidad en plano xy)
var SPEED = 400
var GRAVITY = 700
onready var jump_count = 0


var _facing_right = true # determinar hacia donde estamos mirando 
var can_attack = false

var health = 100 



onready var anim_tree = $PlayerSkin/AnimationTree
onready var _pivot: Node2D = $PlayerSkin
onready var playback = anim_tree.get("parameters/playback")
onready var _start_scale: Vector2 = _pivot.scale
onready var energy_bar = $CanvasLayer/EnergyBar

var Bullet = preload("res://Scenes/Bullet.tscn")

var crouched = false


func _ready():
	anim_tree.active = true


func _physics_process(delta):
	
	lineal_vel = move_and_slide(lineal_vel, Vector2.UP) # para que se mueva, determina si esta en piso o no
	
	lineal_vel.y += GRAVITY * delta # Para caer con gravedad
	var target_vel = Input.get_action_strength("derecha") - Input.get_action_strength("izquierda") # esto es un valor entre 0 y 1


	
	lineal_vel.x = lerp(lineal_vel.x, target_vel * SPEED, 0.5) 
	
	if lineal_vel.x > 0:
		_facing_right = true
	elif lineal_vel.x < 0:
		_facing_right = false
				
	
	if Input.is_action_just_pressed("jump"):  # Para saltar
		#lineal_vel.y = -SPEED*1.4
		if jump_count < 1:
			jump_count += 1
			lineal_vel.y = -SPEED*1.1
		
	if is_on_floor():
		jump_count = 0
		
		
	if Input.is_action_pressed("crouch") and is_on_floor():
		lineal_vel.x=0
		crouched = true
	else:
		crouched = false
	# var capsule: CapsuleShape2D = collision_shape.shape
	# (collision_shape.shape as CapsuleShape2D).radius
		
		
	var melee = false
	if can_attack:
		
		if Input.is_action_just_pressed("shoot"):
			
			var bullet = Bullet.instance()
			get_parent().add_child(bullet)
			
			if abs(lineal_vel.x) > 10 :
				playback.travel("run shoot")
				
				if lineal_vel.x >=0:
					bullet.global_position = $BulletSpawnRun.global_position
				else:
					bullet.global_position = $BulletSpawnRunIzq.global_position
					bullet.rotation = PI
			else:
				playback.travel("shoot")
				
				if _facing_right:
					bullet.global_position = $BulletSpawn.global_position
				else:
					bullet.global_position = $BulletSpawnIzq.global_position
					bullet.rotation = PI
			emit_signal("just_shot",0)
			can_attack = false
			melee = true
		
		
	
	#animations	

	if not melee:
		if crouched:
			playback.travel("crouch")
		else:
			if is_on_floor():
				if abs(lineal_vel.x) > 10:
					playback.travel("Run")
				else:
					playback.travel("Idle")
			else:
				if lineal_vel.y > 0:
					playback.travel("fall")
				else:
					playback.travel("jump")
	
	
	if lineal_vel.x != 0:
		_pivot.scale.x = sign(lineal_vel.x)*_start_scale.x
		#scale.x = sign(lineal_vel.x)

		

#func _on_melee_area_entered(body: Node):
	#if body.has_method("take_damage"):
		#body.take_damage(self)


#func take_damage(amount):
	#health-= amount
	#if health <0:
		#get_tree().change_scene("res://scenes/main_menu.tscn")
	

#func on_area_entered(area):
	#take_damage(20)


func _on_EnergyBar_max_combo_reached(state):
	can_attack = state
func damage_player(damage):
	health -= damage

func _on_HurtBox_area_entered(area):
	if area.get_parent().is_in_group("enemy"):
		damage_player(area.get_parent().damage)
	pass # Replace with function body.
