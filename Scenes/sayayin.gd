extends AnimatedSprite

onready var showing= false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"



func _process(delta):
	if not showing:
		self.hide()
	else:
		self.show()

func _on_EnergyBar_max_combo_reached(state):
	showing = state
