extends Node

var player = preload("res://Scenes/GodotPlayer.tscn")
var newplayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func shake_camera(intensity : int, seconds : float, ease_out : bool = true):
	get_node("/root/Main/CameraMovementTest").start_screen_shake(intensity, seconds, ease_out)

func swtich_to_player():
	var godot = get_node("/root/Main/TheGodot")
	var spawn_pos = godot.get_node("TheGodot").position
	
	
	get_node("/root/Main/CameraMovementTest").queue_free()
	godot.queue_free()
	
	
	newplayer = player.instantiate()
	newplayer.position = spawn_pos
	
	add_child(newplayer)


func _input(event: InputEvent) -> void:
	#Reload Gane
	if(event.is_action_pressed("Arcade_Home_Button")):
		get_tree().change_scene_to_file("res://Scenes/Main.tscn")
		
		for i in get_child_count():
			get_child(i -1).queue_free()
		
