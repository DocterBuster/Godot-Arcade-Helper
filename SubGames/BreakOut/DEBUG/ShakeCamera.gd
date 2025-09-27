class_name ShakeCamera
extends Camera2D


## CREDIT:  Code from https://kidscancode.org/godot_recipes/3.x/2d/screen_shake/index.html 

@export var decay = 0.8
@export var max_offset = Vector2(50, 25)  # Maximum hor/ver shake in pixels.
@export var max_roll = 0.1  # Maximum rotation in radians (use sparingly).
var trauma = 0.0  # Current shake strength. (Handled addativly incade we call for more shake 
var trauma_power = 2  



func _physics_process(delta: float) -> void:
	if trauma:
		trauma = max(trauma - decay * delta, 0)
		_shake()

# Adds shake multiplier to the camera shake
func add_camera_shake(amount : float):
	trauma = min(trauma + amount, 1.0)


# Private method that handles what a "Shake" is 
func _shake():
	var amount = pow(trauma, trauma_power)
	rotation = max_roll * amount * randf_range(-1, 1)
	offset.x = max_offset.x * amount * randf_range(-1, 1)
	offset.y = max_offset.y * amount * randf_range(-1, 1)
