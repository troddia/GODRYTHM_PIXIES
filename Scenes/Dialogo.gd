extends Node2D

onready var dialogo = "Aqui va una historia super wena porque si lkjfsdjfljsldkjf ksdjf lkj  slkdjf  lkjdf"
export (float) var textSpeed = 0.05
onready var finished = false

func play():
	$Timer.wait_time = textSpeed
	load_text()
	
func load_text():
	$RichTextLabel.bbcode_text = dialogo
	$RichTextLabel.visible_characters = 0
	while $RichTextLabel.visible_characters < len(dialogo):
		$RichTextLabel.visible_characters +=1
		$Timer.start()
		yield($Timer, "timeout")
	finished = true
	return	

