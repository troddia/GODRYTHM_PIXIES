extends Node2D
var run = false
onready var anim = $PlayerSkinMENU/AnimationPlayer
onready var timer = get_node("TimerCreditos")
onready var sprite = $PlayerSkinMENU
onready var black = $Black
onready var label = $Label
onready var credits = $LabelCreditos

func _ready():
	black.visible = false
	label.visible = false
	credits.visible = true
	anim.play("Run")
	timer.set_wait_time(3)
	timer.start()
	
func _process(delta):
	if run:
		sprite.position.x += 2

func _on_TimerCreditos_timeout():
	black.visible = true
	label.visible = true
	credits.visible = false
	yield(get_tree().create_timer(3),"timeout")
	get_tree().change_scene("res://Scenes/main_menu.tscn")
