@tool
extends EditorPlugin


func _enable_plugin():
	# The autoload can be a scene or script file.
	add_autoload_singleton("Arcade_Checker", "res://addons/imgd_aracde_detector/Arcade_Checker.tscn")
	add_arcade_input_to_project()


func _disable_plugin():
	remove_autoload_singleton("Arcade_Checker")
	remove_arcade_input_from_project()



#Adds are arcade input binds to the project to easily be used 
func add_arcade_input_to_project():
	var inp
	#Add button inputs to project
	inp = InputEventJoypadButton.new()
	
	InputMap.add_action("Arcade_Left_Button", 0.5)
	inp.button_index = 3
	InputMap.action_add_event("Arcade_Left_Button", inp)
	
	InputMap.add_action("Arcade_Right_Button", 0.5)
	inp.button_index = 1
	InputMap.action_add_event("Arcade_Right_Button", inp)
	
	InputMap.add_action("Arcade_Middle_Button", 0.5)
	inp.button_index = 9
	InputMap.action_add_event("Arcade_Middle_Button", inp)
	
	InputMap.add_action("Arcade_Home_Button", 0.5)
	inp.button_index = 8
	InputMap.action_add_event("Arcade_Home_Button", inp)
	
	
	#Add arcade joystick input
	inp = InputEventJoypadMotion.new()
	inp.axis = JOY_AXIS_LEFT_Y
	
	
	InputMap.add_action("Joystick_Up", 0.5)
	inp.axis_value = -1
	InputMap.action_add_event("Joystick_Up", inp)
	
	InputMap.add_action("Joystick_Down", 0.5)
	inp.axis_value = 1
	InputMap.action_add_event("Joystick_Down", inp)
	
	inp.axis = JOY_AXIS_LEFT_X
	
	InputMap.add_action("Joystick_Left", 0.5)
	inp.axis_value = -1
	InputMap.action_add_event("Joystick_Left", inp)
	
	InputMap.add_action("Joystick_Right", 0.5)
	inp.axis_value = 1
	InputMap.action_add_event("Joystick_Right", inp)


#Removes input binds for the arcade from the project
func remove_arcade_input_from_project():
	
	InputMap.erase_action("Arcade_Left_Button")
	InputMap.erase_action("Arcade_Middle_Button")
	InputMap.erase_action("Arcade_Right_Button")
	InputMap.erase_action("Arcade_Home_Button")
	InputMap.erase_action("Joystick_Down")
	InputMap.erase_action("Joystick_Left")
	InputMap.erase_action("Joystick_Up")
	InputMap.erase_action("Joystick_Right")
