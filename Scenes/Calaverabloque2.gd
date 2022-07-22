extends StaticBody2D
onready var posicion = 0
onready var si= 0



func _physics_process(_delta) -> void:
	if si==1:
		self.position.y-=5
		if position.y <=0:
			position.y=800
	elif si==2:
		queue_free()
# Declare member variables here. Examples:
# var a = 2


# Called when the nodwe enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Enemigo_bloques(state):
	yield(get_tree().create_timer(6.5),"timeout")
	si=state
