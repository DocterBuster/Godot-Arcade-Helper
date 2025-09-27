extends CanvasLayer




@export var in_subgame := false


#Loads a subgame from a filepath that points to it's main scene 
func load_subgame_from_path_to_main(main_path : String):
	get_tree().unload_current_scene()
	
	await scene_transition()
	
	get_tree().change_scene_to_file(main_path)
	in_subgame = true


func exit_subgame():
	get_tree().unload_current_scene()
	await scene_transition()
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")


func scene_transition():
	$StaticEffect.visible = true
	await get_tree().create_timer(0.6).timeout
	$StaticEffect.visible = false


func _process(delta: float) -> void:
	$SubgameHUD.visible = in_subgame
	
	if(in_subgame):
		if(Input.is_action_just_pressed("Arcade_Home_Button")):
			exit_subgame()
