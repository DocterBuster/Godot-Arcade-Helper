extends Node2D


const ORIGIN = Vector2(0, 0)
var shake_intensity = 1
var shake_ease = true

@export var move_position : Vector2
@export var prev_positon : Vector2
@export var move_precentage = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#Loop until timer stops
	if(not $ShakeTimer.is_stopped()):
		$JuiceCamera.position = Vector2(ORIGIN.x + randf_range(-shake_intensity, shake_intensity), ORIGIN.y + randf_range(-shake_intensity, shake_intensity))
	
	




func start_screen_shake(intensity : int, seconds : float, ease_out : bool = true) -> void:
	
	$ShakeTimer.wait_time = seconds
	$ShakeTimer.start()
	
	shake_intensity = intensity
	shake_ease = ease_out
	



func _on_shake_timer_timeout() -> void:
	
	#Set Position back to Origin
	$JuiceCamera.position = ORIGIN


#Handles the animation of moving between two points
func move_to_global_position(newPos : Vector2):
	
	prev_positon = global_position
	move_position = newPos
	#Set animation keys to ease between current and new pos
	#IN GLOBAL POSITIONS
	
	$CameraMover.get_animation("Move").track_set_key_value(0, 0, global_position)
	$CameraMover.get_animation("Move").track_set_key_value(0, 1, newPos)
	
	print($CameraMover.get_animation("Move").track_get_key_value(0, 0))
	print($CameraMover.get_animation("Move").track_get_key_value(0, 1))
	
	$CameraMover.play("Move")
	
	#Play that animation!
	
