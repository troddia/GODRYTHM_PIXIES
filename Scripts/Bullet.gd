extends Area2D

export var SPEED = 600
onready var timer = get_node("Timer_bullet")

func _physics_process(delta):
	
	position += transform.x * SPEED * delta
	
func _ready():
	$AnimationPlayer.play("bullet2")
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body: Node):
	if not body.is_in_group("player"):
		$AnimationPlayer.play("splash")
		timer.set_wait_time(0.6)
		SPEED = 0
		timer.start()
		
	


func _on_Timer_bullet_timeout():
	queue_free()
