extends Node2D

var score = 0
var combo = 0
var TSCORE = 0
signal combo_changed(new_combo)
signal score_changed(score)


var max_combo = 0
var great = 0
var good = 0
var okay = 0
var missed = 0

var bpm = 115

var song_position = 0.0
var song_position_in_beats = 0
var last_spawned_beat = 0
var sec_per_beat = 60.0 / bpm

var spawn_1_beat = 0
var spawn_2_beat = 0
var spawn_3_beat = 0
var spawn_4_beat = 0

var lane = 0
var rand = 0
var note = load("res://Scenes/Note.tscn")
var instance


func _ready():
	randomize()
	$Conductor.play_with_beat_offset(0)



func _on_Conductor_measure(position):
	if position == 1:
		_spawn_notes(spawn_1_beat)
	elif position == 2:
		_spawn_notes(spawn_2_beat)
	elif position == 3:
		_spawn_notes(spawn_3_beat)
	elif position == 4:
		_spawn_notes(spawn_4_beat)

func _on_Conductor_beat(position):
	song_position_in_beats = position
	
	if song_position_in_beats > 18:
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 1
	if song_position_in_beats > 98:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 1
	if song_position_in_beats > 132:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 1
	if song_position_in_beats > 162:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 0
	if song_position_in_beats > 194:
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_3_beat = 1
		spawn_4_beat =1
	if song_position_in_beats > 228:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat =1
		spawn_4_beat = 1
	if song_position_in_beats > 258:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 1
	if song_position_in_beats > 288:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 1
	if song_position_in_beats > 322:
		spawn_1_beat = 3
		spawn_2_beat = 2
		spawn_3_beat = 2
		spawn_4_beat = 1
	if song_position_in_beats > 388:
		spawn_1_beat = 1
		spawn_2_beat = 3
		spawn_3_beat = 1
		spawn_4_beat = 3
	if song_position_in_beats > 396:
		spawn_1_beat = 2
		spawn_2_beat = 1
		spawn_3_beat = 2
		spawn_4_beat = 3
	if song_position_in_beats > 450:
		spawn_1_beat = 2
		spawn_2_beat = 3
		spawn_3_beat = 2
		spawn_4_beat = 3
	


func _spawn_notes(to_spawn):
	if to_spawn > 0:
		lane = randi() % 3
		instance = note.instance()
		instance.initialize(lane)
		add_child(instance)
	if to_spawn > 1:
		while rand == lane:
			rand = randi() % 3
		lane = rand
		instance = note.instance()
		instance.initialize(lane)
		add_child(instance)
		
		


func increment_score(by):
	if by > 0:
		combo += by
		TSCORE +=1
	else:
		if combo < 10:
			combo = 0
	emit_signal("combo_changed",combo)
	## pasive damage
	if by == 3:
		great += 1
		score += 1

	elif by == 2:
		good += 1
		score += 1

	elif by == 1:
		okay += 1
		score += 1

	else:
		missed += 1
		if score >0:
			score -= 1

		
	
	 
	
	
	
	if combo > max_combo:
		max_combo = combo

	emit_signal('score_changed', score)
	print('Tscore:',TSCORE)
	
	


func _on_Samo_just_shot(new_combo):
	combo = new_combo


func _on_Samo_resetscore():
	score = 0
