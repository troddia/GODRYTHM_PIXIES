extends KinematicBody2D
onready var _animation_player: AnimationPlayer = $AnimationPlayer2
onready var playback = $AnimationTree.get("parameters/playback")

export var damage = 10
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _physics_process(delta):
#	_animation_player.play("quieto")
	

#	if $dect_izq.is_colliding():
#		_animation_player.play("Ataque")
#	else:
#		_animation_player.play("quieto")
	if $dect_izq.is_colliding():
		playback.travel("Fuego")
		
	else:
		playback.travel("quieto")
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
