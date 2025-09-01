extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var connected_controlers = Input.get_connected_joypads()
	
	if(connected_controlers.size() > 0):
		$Button.text = Input.get_joy_name(connected_controlers[0])
	else:
		$Button.text = ""
