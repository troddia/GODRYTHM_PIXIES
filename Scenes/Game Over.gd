extends Node2D

onready var menu = $DeadMenu
onready var restart = $DeadMenu/VBoxContainer/Restart
onready var exit = $DeadMenu/VBoxContainer/Exit
var run = false
onready var anim = $PlayerAnim/AnimationPlayer
onready var blackBackground = $ColorRect
onready var player = $PlayerAnim
onready var diedText = $Label
onready var calavera = $Calaveras
onready var animCalabera = $Calaveras/AnimationPlayer
onready var calavera2 = $Calaveras2
onready var animCalabera2 = $Calaveras2/AnimationPlayer
onready var sonido = $AudioStreamPlayer2D
onready var j= true
# onready var timer = get_node("TimerMENU")
# onready var sprite = $PlayerSkinMENU

func _ready():
	restart.connect("pressed", self, "_on_restart_pressed")
	exit.connect("pressed", self, "_on_exit_pressed")
	if j:
		sonido.play()
		j=false
	player.visible = false
	menu.visible = false
	diedText.visible = false
	calavera.visible = false
	calavera2.visible = false
	blackBackground.visible = true
	yield(get_tree().create_timer(1),"timeout")
	
	diedText.visible = true
	calavera.visible = true
	calavera2.visible = true
	animCalabera.play("calaca")
	animCalabera2.play("calaca")
	yield(get_tree().create_timer(1.5),"timeout")
	
	player.visible = true
	anim.play("Dead")
	yield(get_tree().create_timer(1.5),"timeout")
	
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
