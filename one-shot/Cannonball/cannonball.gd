extends Area2D

@export var speed: int
@export var offset: int
 
func _ready() -> void:
	global_position += Vector2.UP.rotated(rotation) * offset
 
func _physics_process(delta: float) -> void:
	global_position += Vector2.UP.rotated(rotation) * speed * delta


func _on_border_area_area_entered(_area: Area2D) -> void:
	Global.end_round()
