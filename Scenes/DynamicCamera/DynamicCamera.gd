extends Node2D


var ORIGIN = Vector2(0, 0)
var shake_intensity = 1
var shake_ease = true

@export var move_position : Vector2
@export var prev_positon : Vector2
@export var move_precentage = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ORIGIN = $JuiceCamera.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#Loop until timer stops
	if(not $ShakeTimer.is_stopped()):
		$JuiceCamera.position = Vector2(ORIGIN.x + randf_range(-shake_intensity, shake_intensity), ORIGIN.y + randf_range(-shake_intensity, shake_intensity))


#Starts a camera shake for an amouunt of time passed 
func start_screen_shake(intensity : int, seconds : float, ease_out : bool = true) -> void:
	
	$ShakeTimer.wait_time = seconds
	$ShakeTimer.start()
	
	shake_intensity = intensity
	shake_ease = ease_out
	



func _on_shake_timer_timeout() -> void:
	
	#Set Position back to Origin
	$JuiceCamera.position = ORIGIN
	
