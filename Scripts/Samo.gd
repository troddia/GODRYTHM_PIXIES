extends KinematicBody2D

var lineal_vel = Vector2.ZERO #velocidad lineal que parte como cero (velocidad en plano xy)
var SPEED = 400
var GRAVITY = 700

var _facing_right = true # determinar hacia donde estamos mirando 


var health=100 

#var energy= 0 setget set_energy
#var new_energy = 0
#var max_energy= 20


onready var _pivot: Node2D = $PlayerSkin
onready var _animation_player: AnimationPlayer = $PlayerSkin/AnimationPlayer# Para usarlo mas abajo solo como playback
onready var _start_scale: Vector2 = _pivot.scale
onready var health_bar = $CanvasLayer/HealthBar
onready var energy_bar = $CanvasLayer/EnergyBar
onready var attacking = false

func _ready():
		
	health_bar.value = health


func _physics_process(delta):
	
	lineal_vel = move_and_slide(lineal_vel, Vector2.UP) # para que se mueva, determina si esta en piso o no
	
	lineal_vel.y += GRAVITY * delta # Para caer con gravedad
	var target_vel = Input.get_action_strength("derecha") - Input.get_action_strength("izquierda") # esto es un valor entre 0 y 1
	if attacking:
		target_vel = 0
	

	
	lineal_vel.x = lerp(lineal_vel.x, target_vel * SPEED, 0.5) 
	
	if Input.is_action_just_pressed("jump") and is_on_floor():  # Para saltar
		lineal_vel.y = -SPEED*1.4
		
	var melee = false
	if Input.is_action_just_pressed("shoot"):
		_animation_player.play("shoot")
		melee = true
	#animations	
	if not melee:
		if is_on_floor():
			if abs(lineal_vel.x) > 10:
				_animation_player.play("Run")
			else: 
				_animation_player.play("Idle")
		else:
			if lineal_vel.y > 0:
				_animation_player.play("fall") 	
			else: 
				_animation_player.play("jump")	
		if lineal_vel.x != 0:
			_pivot.scale.x = sign(lineal_vel.x)*_start_scale.x

		

func _on_melee_area_entered(body: Node):
	if body.has_method("take_damage"):
		body.take_damage(self)


func take_damage(amount):
	health-= amount
	if health <0:
		get_tree().change_scene("res://scenes/main_menu.tscn")
	

func on_area_entered(area):
	take_damage(20)


