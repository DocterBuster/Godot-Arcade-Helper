extends Area2D

@export var warp_scene : String


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body is Godot_Player:
		SubGameLoader.load_subgame_from_path_to_main(warp_scene)
