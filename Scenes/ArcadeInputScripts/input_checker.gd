extends Node2D


var input_button = preload("res://Scenes/input_action.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _input(event: InputEvent) -> void:
	
	
	if($Delay.is_stopped()):
		print(event.as_text())
		
		$Node2D/InputAction.text = event.as_text()
		
		
		var box = input_button.instantiate()
		
		box.text = event.as_text()
		
		$VBoxContainer.add_child(box)
		
		
		
		#Start the timer 
		$Delay.start()
		

	
	
	
