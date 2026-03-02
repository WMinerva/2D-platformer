extends Node

const MAIN = preload("uid://b4dr4mhfq023e")
const END_SCREEN = preload("uid://bpscall1nubaa")



const LEVELS = {
	1: preload("uid://bata7d14xo3fd"),
	2: preload("uid://dd2ps8gr44ey6")
}

var current_level = 0
var lives = 3

func load_next_level():
	current_level += 1
	
	if current_level > LEVELS.size():
		get_tree().change_scene_to_packed.call_deferred(END_SCREEN)
	else:
		get_tree().change_scene_to_packed.call_deferred(LEVELS[current_level])
		

func restart_level():
	lives -= 1
	if lives ==0:
		get_tree().change_scene_to_packed.call_deferred(END_SCREEN)
		return
	get_tree().change_scene_to_packed(LEVELS[current_level])
	
	
func restart_game():
	current_level = 0
	lives = 3
	get_tree().change_scene_to_packed(MAIN)
