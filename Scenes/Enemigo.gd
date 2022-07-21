extends KinematicBody2D
var ataque= false
onready var _animation_player: AnimationPlayer = $AnimationPlayer2
onready var playback = $AnimationTree.get("parameters/playback")
var i = 0
export var damage = 10
var invocacion = preload('res://Scenes/Calaveras.tscn')
var forgod= false
onready var timer = get_node("Tiempoataques")
var v = 0
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
	print('rico')
	if v==1:
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


