extends Node2D


onready var anim = $Enemigo/AnimationPlayer2 
onready var enemy = $Enemigo
onready var label = $Enemigo/Label
onready var zombi = $AudioStreamPlayer
var shouting = true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("grito")
	zombi.play()
	yield(get_tree().create_timer(3.5),"timeout")
	shouting = false
	zombi.stop()
	anim.play("quieto")
	label.hide()
	yield(get_tree().create_timer(1.3),"timeout")
	$AnimationPlayer3.play("fade out")

func _process(delta):	
	if not shouting:
		if enemy.position.x >= -250:
				enemy.position.x -=4
		else:	
			emit_signal("animacion",true)
			yield(get_tree().create_timer(0.2),"timeout")
			
			enemy.hide()
			get_tree().change_scene("res://scenes/Main.tscn")




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



