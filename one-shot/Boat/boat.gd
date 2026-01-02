extends Area2D
class_name Boat 

@onready var sprite: Sprite2D = $Sprite2D
@onready var particles: GPUParticles2D = $Particles
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var facing: int
var speed: int
var shake: float

func _process(delta: float) -> void:
	sprite.position = Vector2(randf_range(-shake, shake),randf_range(-shake,shake))
	shake = lerp(shake, 0.0, 0.05)
	global_position.x += speed * facing * delta
	if facing == 1:
		sprite.flip_h = false
	else:
		sprite.flip_h = true

func _on_area_entered(_area: Area2D) -> void:
	facing *= -1


func _on_cannon_ball_area_area_entered(_area: Area2D) -> void:
	hit()

func hit():
	shake = 75
	particles.emitting = true
	speed = 0
	animation_player.play("hit")
