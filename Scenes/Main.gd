extends Node2D
onready var boss1 = $Enemigo/AnimationTree
onready var oscar = $Enemigo
signal animacion(state)
onready var state = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	boss1.active = true
func _process(delta):	
	if oscar.position.x >= 1100:
			oscar.position.x -=1
	emit_signal("animacion",true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
