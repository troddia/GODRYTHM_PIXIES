extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var hudh = $Samo/CanvasLayer/HealthBar
onready var hude = $Samo/CanvasLayer/EnergyBar
onready var hudp = $Samo/CanvasLayer/SamoProfile
onready var game = $Samo/Game



# Called when the node enters the scene tree for the first time.
func _ready():
	hudh.hide()
	hude.hide()
	hudp.hide()
	game.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
#func _process(delta):	
	
	
