extends Node2D


func _ready() -> void:
	Input.joy_connection_changed.connect(_on_joypad_connected) 

#Called when any device is connected/disconnected 
func _on_joypad_connected(device: int, connected: bool):
	
	if(device > -1):
		#If there is a device connected, it will be in port 0 
		var id = Input.get_joy_guid(device)
		$Button.text = id
	else:
		$Button.text = ""
