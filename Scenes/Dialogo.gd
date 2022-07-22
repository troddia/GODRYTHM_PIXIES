extends Node2D

onready var dialogo = "Ha pasado mucho tiempo desde que la sociedad está bajo el mando de Eloscar, un demonio alado al que mucha gente se ha enfrentado...sin exito. Eloscar nos ha arrebatado todo, incluso la música, mi gran pasión. Hoy me enfrentaré a él. Hoy lo DETENDRÉ."
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

