extends StaticBody2D
onready var posicion = 0




func _physics_process(_delta) -> void:
	self.position.y-=3
	if position.y <=0:
		position.y=800

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
