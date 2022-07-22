extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var hudh = $Samo/CanvasLayer/HealthBar
onready var hude = $Samo/CanvasLayer/EnergyBar
onready var hudp = $Samo/CanvasLayer/SamoProfile
onready var game = $Samo/Game
onready var label = $inicio
onready var final = $final
onready var vida = $hp
onready var energia = $ep
onready var rythm = $rythm
onready var movement = $Movement
onready var flechas = $flechasc



# Called when the node enters the scene tree for the first time.
func _ready():
	label.show()
	yield(get_tree().create_timer(3.5),"timeout")
	label.hide()
	movement.show()
	hudp.show()
	yield(get_tree().create_timer(3.5),"timeout")
	movement.hide()
	rythm.show()
	game.show()
	hude.show()
	yield(get_tree().create_timer(7),"timeout")
	rythm.hide()
	flechas.show()
	yield(get_tree().create_timer(3.5),"timeout")
	flechas.hide()
	energia.show()
	hude.value = 10
	yield(get_tree().create_timer(10),"timeout")
	energia.hide()
	vida.show()
	hudh.show()
	yield(get_tree().create_timer(8),"timeout")
	vida.hide()
	final.show()
	yield(get_tree().create_timer(2),"timeout")
	get_tree().change_scene("res://Scenes/Jefe1Animation.tscn")

#func _process(delta):	

	
