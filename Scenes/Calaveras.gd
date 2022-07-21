extends KinematicBody2D
 
var VELOCIDAD = 60
var movimiento = Vector2(0,0)
export var damage = 2.5

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _physics_process(delta) -> void:
	movimiento.x -= VELOCIDAD
	movimiento = move_and_slide(movimiento,Vector2.UP)
	
	movimiento.x = lerp(movimiento.x,0,0.2)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
