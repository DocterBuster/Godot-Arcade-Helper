extends Node2D


var init_pos : Vector2
var radius = 100
var drift_threshold = 0.3

const ARCADE_RED = Color(1, 0.041, 0.022)

var inputs : int = 0



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	init_pos = global_position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	if(abs(Input.get_joy_axis(0, JOY_AXIS_LEFT_X)) > drift_threshold or abs(Input.get_joy_axis(0, JOY_AXIS_LEFT_Y)) > drift_threshold):
		$TheGodot.modulate = ARCADE_RED
	else:
		$TheGodot.modulate = Color(1, 1, 1)
		
	
	
	
	
	if(Input.is_action_just_pressed("Arcade_Left_Button")):
		$ButtonPresser.stop()
		$ButtonPresser.play("left_press")
		inputs += 1
	elif(Input.is_action_just_pressed("Arcade_Right_Button")):
		$ButtonPresser.stop()
		$ButtonPresser.play("right_press")
		inputs += 1
	elif(Input.is_action_just_pressed("Arcade_Middle_Button")):
		$ButtonPresser.stop()
		$ButtonPresser.play("middle_press")
		inputs += 1
	
	#Easter Eggs! 
	
	if(inputs == 10):
		GlobalData.shake_camera(5, 5)
	
	if(inputs > 20):
		GlobalData.swtich_to_player()
	
	#print(inputs)
	
	pass

func _input(event: InputEvent) -> void:
	
	
	if event is InputEventMouseMotion:
		global_position = event.position - $TheGodot.position
	else:
		global_position = init_pos + Vector2(radius * Input.get_joy_axis(0, JOY_AXIS_LEFT_X), radius * Input.get_joy_axis(0, JOY_AXIS_LEFT_Y)) 
	
