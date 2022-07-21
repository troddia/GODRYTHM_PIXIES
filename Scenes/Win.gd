extends Node2D

onready var menu = $DeadMenu
onready var restart = $DeadMenu/VBoxContainer/Restart
onready var exit = $DeadMenu/VBoxContainer/Exit
var run = false
onready var anim = $PlayerAnim/AnimationPlayer2
onready var blackBackground = $ColorRect
onready var player = $PlayerAnim
onready var diedText = $Label
onready var explosion = $PlayExp/AnimationPlayer
onready var playExp = $PlayExp

# onready var timer = get_node("TimerMENU")
# onready var sprite = $PlayerSkinMENU

func _ready():
	restart.connect("pressed", self, "_on_restart_pressed")
	exit.connect("pressed", self, "_on_exit_pressed")
	
	player.visible = false
	playExp.visible = false
	menu.visible = false
	diedText.visible = false
	blackBackground.visible = true
	yield(get_tree().create_timer(1),"timeout")
	
	diedText.visible = true
	yield(get_tree().create_timer(1.5),"timeout")
	
	player.visible = true
	anim.play("Ataque")
	yield(get_tree().create_timer(0.9),"timeout")
	player.visible = false
	playExp.visible = true
	explosion.play("explosion")
	yield(get_tree().create_timer(0.4),"timeout")
	playExp.visible = false
	
	diedText.visible = false
	menu.visible = true
	# anim.play("walk")
# func _process(delta):
	#if run:
		#sprite.position.x += 2

	
func _on_restart_pressed():
	get_tree().change_scene("res://Scenes/Jefe1Animation.tscn")
	#anim.play("Run")
	#timer.set_wait_time(1.5)
	#timer.start()
	


func _on_exit_pressed():
	get_tree().quit()


func _on_TimerMENU_timeout():
	get_tree().change_scene("res://Scenes/Jefe1Animation.tscn")
