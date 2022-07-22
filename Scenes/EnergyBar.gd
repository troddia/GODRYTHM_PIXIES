extends TextureProgress
signal max_combo_reached(state)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Game_combo_changed(new_combo):
	value = new_combo

func _physics_process(delta):
	if value >= max_value:
		emit_signal("max_combo_reached", true)
	else:
		emit_signal("max_combo_reached", false)
	
	



func _on_Samo_just_shot(new_combo):
	value = new_combo
