extends CharacterBody2D

@export var cannonball: PackedScene
@export var start_y: int = 580
@export var speed: float
@export var turning_speed: float
@export var turning_range: float

@onready var start_position := Vector2(Global.window_size.x/2, start_y)

func _ready() -> void:
	global_position = start_position

func inst(scene: PackedScene):
	var instance = scene.instantiate()
	instance.rotation = rotation
	instance.global_position = global_position
	add_sibling(instance)

func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	if Input.is_action_pressed("left"):
		velocity.x = -speed
	if Input.is_action_pressed("right"):
		velocity.x = speed
	if Input.is_action_pressed("turn left"):
		rotation -= deg_to_rad(turning_speed) * delta
		clamp_rotation()
	if Input.is_action_pressed("turn right"):
		rotation += deg_to_rad(turning_speed) * delta
		clamp_rotation()
	look_at(get_global_mouse_position())
	rotation += deg_to_rad(90)
	clamp_rotation()
	move_and_collide(velocity * delta)

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("launch") and Global.cannon_ready:
		inst(cannonball)
		Global.cannon_ready = false

func clamp_rotation():
	rotation = clamp(rotation, deg_to_rad(-turning_range/2), deg_to_rad(turning_range/2))
