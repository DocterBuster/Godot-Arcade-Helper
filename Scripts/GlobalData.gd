extends Node

var player = preload("res://Scenes/GodotPlayer.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func swtich_to_player():
	var godot = get_node("/root/Main/TheGodot")
	var spawn_pos = godot.get_node("TheGodot").position
	godot.queue_free()
	
	var newplayer = player.instantiate()
	newplayer.position = spawn_pos
	
	add_child(newplayer)
