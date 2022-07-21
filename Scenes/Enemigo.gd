extends KinematicBody2D
var ataque= false
onready var _animation_player: AnimationPlayer = $AnimationPlayer2
onready var playback = $AnimationTree.get("parameters/playback")
var i = 0
export var damage = 10
onready var health = 10
var invocacion = preload('res://Scenes/Calaveras.tscn')
var forgod= false
onready var timer = get_node("Tiempoataques")
var v = 0
var animacion = false
func _physics_process(_delta) -> void:

#	_animation_player.play("quieto")
	
	yield(get_tree().create_timer(7),"timeout")
	v=1

#	if $dect_izq.is_colliding():
#		_animation_player.play("Ataque")
#	else:
#		_animation_player.play("quieto")
	if $dect_izq.is_colliding():
		playback.travel("Fuego")
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
		if i ==0:
			wea($spawn1)
			i=1
		else:
			wea($spawn5)
			i=0

		wea($spawn2)
		wea($spawn3)
		#yield(get_tree().create_timer(0.5),"timeout")
		wea($spawn4)
	yield(get_tree().create_timer(20),"timeout")		
	timer.wait_time = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

	
func damage_enemy(damage):
	health -= damage
	if health <= 0:
		get_tree().change_scene("res://Scenes/Win.tscn")
			
func _on_HurtBox_area_entered(area):
	print(area)
	if not area.get_parent().is_in_group("enemy") and area != invocacion:
		damage_enemy(10)
	pass # Replace with function body.






func _on_Main_animacion(state):
	animacion = state
	pass # Replace with function body.
