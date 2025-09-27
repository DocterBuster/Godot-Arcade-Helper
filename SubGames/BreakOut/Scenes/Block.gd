@tool
class_name Block
extends StaticBody2D


var throw_away_refrence = preload("res://SubGames/BreakOut/Art/TechArt/ThrowAwayBlock.tscn")

@export var block_hp := 1:
	set(value):
		block_hp = value
		$TextureRect/BlockHP.text = str("[center]", value)



var destination_position : Vector2

func _ready() -> void:
	
	#Disable visiblity and collsion
	self.visible = false
	$CollisionShape2D.disabled = true
	
	
	#Store Editor position 
	destination_position = self.global_position
	
	#Create a random spawn interval and wait that time
	var spawn_delay := randf_range(0.5, 1.0)
	await get_tree().create_timer(spawn_delay).timeout
	
	self.visible = true
	
	#Elastic Tween to the intended position 
	var tween : Tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_ELASTIC)
	tween.tween_property(self, "global_position", destination_position, 1.2).from(Vector2(destination_position.x, destination_position.y + 100))
	
	await tween.finished
	$CollisionShape2D.disabled = false
	


#Handles when a ball hits this block
func hit_block_with_ball(ball : Ball):
	
	#Deal Damage
	block_hp -= ball.ball_damage
	
	#Check if this block has hp left
	if(block_hp <= 0):
		destroy_block()



#Destroy this block, called when HP is less than 0 
func destroy_block():
	self.queue_free()
	
	##Add a throw away block to the current scene! 
	var throw_visual := throw_away_refrence.instantiate()
	throw_visual.global_position = self.global_position
	get_tree().current_scene.add_child(throw_visual)
