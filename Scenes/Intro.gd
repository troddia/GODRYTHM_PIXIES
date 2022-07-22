extends Node2D
onready var anim = $Pantalla/AnimationPlayer
onready var dialogo = $Dialogo

func _ready():
	dialogo.visible = false
	anim.play("Pantalla1")
	yield(get_tree().create_timer(5),"timeout")
	anim.play("Pantalla2")
	yield(get_tree().create_timer(5),"timeout")
	dialogo.visible = true
	dialogo.play()
	yield(get_tree().create_timer(20),"timeout")
	



	get_tree().change_scene("res://Scenes/main_menu.tscn")
