extends Node
class_name World

signal round_end
signal round_start

@onready var window_size = DisplayServer.window_get_size()

var cannon_ready := true
var round_num := 1

func end_round():
	await get_tree().create_timer(0.5).timeout
	emit_signal("round_end")
	await get_tree().create_timer(1.0).timeout
	emit_signal("round_start")
	cannon_ready = true
