extends Area2D

export var SPEED = 600


func _physics_process(delta):
	
	position += transform.x * SPEED * delta
	
func _ready():
	$AnimationPlayer.play("bullet2")
	connect("body_entered", self, "_on_body_entered")
	
#func _on_body_entered(body: Node):
	#if not body	
	
