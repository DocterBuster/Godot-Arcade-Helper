extends Node2D

func _input(event: InputEvent) -> void:
	
	if($Delay.is_stopped()):
		
		#Set input event as text for visibiility!
		$InputAction.text = event.as_text()
		
		#Start the timer 
		$Delay.start()
