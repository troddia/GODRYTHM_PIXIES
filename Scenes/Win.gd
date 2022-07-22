extends Node2D

var run = false
onready var anim = $PlayerAnim/AnimationPlayer2
onready var blackBackground = $ColorRect
onready var player = $PlayerAnim
onready var diedText = $Label
onready var explosion = $PlayExp/AnimationPlayer
onready var playExp = $PlayExp
onready var sonido = $AudioStreamPlayer2D
# onready var timer = get_node("TimerMENU")
# onready var sprite = $PlayerSkinMENU

func _ready():

	
	player.visible = false
	playExp.visible = false
	diedText.visible = false
	blackBackground.visible = true
	yield(get_tree().create_timer(1),"timeout")
	
	diedText.visible = true
	yield(get_tree().create_timer(0.5),"timeout")
	sonido.play()
	player.visible = true
	anim.play("Ataque")
	yield(get_tree().create_timer(0.9),"timeout")
	
	player.visible = false
	playExp.visible = true
	explosion.play("explosion")
	yield(get_tree().create_timer(0.4),"timeout")
	playExp.visible = false
	yield(get_tree().create_timer(1),"timeout")
	
	diedText.visible = false
	get_tree().change_scene("res://Scenes/Creditos.tscn")

