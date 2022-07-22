extends TextureProgress


export (NodePath) var jefe_node
onready var player = get_node(jefe_node)

func _process(delta):
	self.value = player.health
	if self.value <= 0:
		get_tree().change_scene("res://Scenes/main_menu.tscn")
