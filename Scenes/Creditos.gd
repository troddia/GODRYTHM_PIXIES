extends Node2D
var run = false
onready var anim = $PlayerSkinMENU/AnimationPlayer
onready var timer = get_node("TimerCreditos")
onready var sprite = $PlayerSkinMENU
onready var black = $Black
onready var creditsPlayer = $AnimationPlayer

func _ready():
	black.visible = false

	anim.play("Run")
	creditsPlayer.play("Desarrolladores")
	yield(get_tree().create_timer(7),"timeout")
	
	creditsPlayer.play("Music")
	yield(get_tree().create_timer(7),"timeout")
	
	creditsPlayer.play("Art")
	yield(get_tree().create_timer(7),"timeout")
	
	black.visible = true
	creditsPlayer.play("Thanks")
	yield(get_tree().create_timer(7),"timeout")
	get_tree().change_scene("res://Scenes/main_menu.tscn")
	
	
