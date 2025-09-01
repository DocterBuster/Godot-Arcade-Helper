extends Node2D


var input_button = preload("res://Debug/UNUSED/input_action.tscn")


func _input(event: InputEvent) -> void:
	
	
	if($Delay.is_stopped()):
		print(event.as_text())
		
		$Node2D/InputAction.text = event.as_text()
		
		
		var box = input_button.instantiate()
		
		box.text = event.as_text()
		
		$VBoxContainer.add_child(box)
		
		
		
		#Start the timer 
		$Delay.start()
		

	
	
	
