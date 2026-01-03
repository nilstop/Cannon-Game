extends Node2D

@export var boat: PackedScene

var speed_min := 100.0
var speed_max := 300.0
var amount := 4.0

#order: left right up down
var marg := [100,100,50,170]

func _ready() -> void:
	Global.connect("round_end", ramp_difficulty)
	Global.connect("round_start", spawn)
	spawn()

func _process(_delta: float) -> void:
	pass#inst(boat)

func ramp_difficulty():
	Global.round_num += 1
	speed_max += 50
	amount += 0.5
	print(speed_max)
	print(Global.round_num)

func spawn():
	for i in round(amount):
		inst(boat)

func inst(scene: PackedScene):
	var instance: Boat = scene.instantiate()
	instance.facing = [-1, 1].pick_random()
	instance.speed = randf_range(speed_min, speed_max)
	instance.position = Vector2.ZERO
	instance.global_position = Vector2(randi_range(0+marg[0], Global.window_size.x-marg[1]), randi_range(0+marg[2], Global.window_size.y-marg[3]))
	add_child(instance)
