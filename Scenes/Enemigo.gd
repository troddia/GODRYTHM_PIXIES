extends KinematicBody2D
onready var _animation_player: AnimationPlayer = $AnimationPlayer2
onready var playback = $AnimationTree.get("parameters/playback")
var ataque= false
export var damage = 10
onready var psamodamage = 0
onready var health = 400
var invocacion = preload('res://Scenes/Calaveras.tscn')

var forgod= false
onready var timer = get_node("Tiempoataques")
var v = 0
var i = 0
var animacion = false

signal bloques(state)
func _physics_process(_delta) -> void:


	
	yield(get_tree().create_timer(5),"timeout")
	v=1
	if $dect_izq.is_colliding():
		playback.travel("Fuego")
		yield(get_tree().create_timer(1),"timeout")
	elif forgod:
		playback.travel("Invocacion")
		forgod=false
	else:
		playback.travel("quieto")

func wea(spawn):
	var area = spawn
	var calavera = invocacion.instance()
	get_parent().add_child(calavera)
	calavera.position =Vector2(area.global_position.x,area.global_position.y)
	
	
func _on_Timer_timeout():
	
	forgod = true
	if v==1 and animacion:
		if health >=300:
			timer.wait_time = 2
			if i ==0:
				wea($spawn1)
				wea($spawn2)
				i=1
			else:
				wea($spawn5)
				yield(get_tree().create_timer(0.2),"timeout")
				wea($spawn5)
				yield(get_tree().create_timer(0.2),"timeout")
				wea($spawn5)
				yield(get_tree().create_timer(0.2),"timeout")
				wea($spawn5)
				yield(get_tree().create_timer(0.2),"timeout")
				wea($spawn5)
				i=0
		elif (health>=150 and health<=300):
			if i ==0:
				wea($spawn1)
				wea($spawn2)
				wea($spawn3)
				wea($spawn4)
				i=1
			else:
				wea($spawn5)
				i=0
				wea($spawn3)
				wea($spawn4)
				wea($spawn2)			
		

		elif health<=150:
			emit_signal("bloques",1)
			timer.wait_time = 0.2
			wea($spawn0)
			wea($spawn00)
			
	if health>=150 and health<=200:
		timer.wait_time = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

	
func damage_enemy(damage):
	health -= psamodamage
	health -= damage
	
	print('hp boss',health)
	if health <= 0:
		get_tree().change_scene("res://Scenes/Win.tscn")
			
func _on_HurtBox_area_entered(area):

	if not area.get_parent().is_in_group("enemy") and area != invocacion:
		damage_enemy(10)







func _on_Main_animacion(state):
	animacion = state
	pass # Replace with function body.



func _on_Samo_passivedamage(score):
	psamodamage = score
	
