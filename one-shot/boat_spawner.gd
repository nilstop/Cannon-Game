extends Node2D

@export var boat: PackedScene

#order: left right up down
var marg := [100,100,50,170]

func _ready() -> void:
	spawn()

func _process(delta: float) -> void:
	pass#inst(boat)

func spawn():
	for i in 7:
		inst(boat)

func inst(scene: PackedScene):
	var instance: Boat = scene.instantiate()
	instance.facing = [-1, 1].pick_random()
	instance.speed = randi_range(90, 400)
	instance.position = Vector2.ZERO
	instance.global_position = Vector2(randi_range(0+marg[0], Global.window_size.x-marg[1]), randi_range(0+marg[2], Global.window_size.y-marg[3]))
	add_child(instance)
