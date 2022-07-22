extends MarginContainer

onready var start = $PanelContainer/VBoxContainer/Start
onready var exit = $PanelContainer/VBoxContainer/Exit
var run = false
onready var anim = $PlayerSkinMENU/AnimationPlayer
onready var timer = get_node("TimerMENU")
onready var sprite = $PlayerSkinMENU

func _ready():
	start.connect("pressed", self, "_on_start_pressed")
	exit.connect("pressed", self, "_on_exit_pressed")
	anim.play("walk")
	
func _process(delta):
	if run:
		sprite.position.x += 2
	
func _on_start_pressed():
	run = true
	anim.play("Run")
	timer.set_wait_time(1.5)
	timer.start()
	

func _on_exit_pressed():
	get_tree().quit()


func _on_TimerMENU_timeout():
	get_tree().change_scene("res://Scenes/Jefe1Animation.tscn")


func _on_Tutorial_pressed():
	get_tree().change_scene("res://Scenes/Tutorial.tscn")
