extends AnimatedSprite

onready var showing= false
onready var power = 0
onready var yell = 0
onready var sonido = $waton

# Declare member variables here. Examples:
# var a = 2
# var b = "text"



func _physics_process(delta):

	if not showing:
		self.hide()
		sonido.play()
		
	else:
		self.show()
		
		self.scale.x = 2.563 + power*0.15
		self.scale.y = 3.646 + power*0.15
		yell = 1 - power/12
		self.modulate =  Color( yell+(1-yell*0.6), yell, 1, 1 )

func _on_EnergyBar_max_combo_reached(state):
	showing = state


func _on_Game_score_changed(score):
	power= score
	
