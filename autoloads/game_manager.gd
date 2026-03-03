extends Node

const MAIN = preload("uid://b4dr4mhfq023e")
const END_SCREEN = preload("uid://bpscall1nubaa")



const LEVELS = {
	1: preload("uid://bata7d14xo3fd"),
	2: preload("uid://dd2ps8gr44ey6")
}

var current_level = 0
var lives = 3
var score = 0
var high_score = 0

func _ready() -> void:
	load_high_score()

func save_high_score():
	if score > high_score:
		high_score = score
		var save_file = FileAccess.open("user://savefile.save", FileAccess.WRITE)
		save_file.store_32(high_score)
		
func load_high_score():
	if FileAccess.file_exists("user://savefile.save"):
		var save_file = FileAccess.open("user://savefile.save", FileAccess.READ)
		high_score = save_file.get_32()
			
		

func update_score(points):
	score += points
	

func load_next_level():
	current_level += 1
	
	if current_level > LEVELS.size():
		save_high_score()
		get_tree().change_scene_to_packed.call_deferred(END_SCREEN)
	else:
		get_tree().change_scene_to_packed.call_deferred(LEVELS[current_level])
		

func restart_level():
	lives -= 1
	if lives == 0:
		save_high_score()
		get_tree().change_scene_to_packed.call_deferred(END_SCREEN)
		return
	get_tree().change_scene_to_packed(LEVELS[current_level])
	
	
func restart_game():
	score = 0
	current_level = 0
	lives = 3
	get_tree().change_scene_to_packed(MAIN)
