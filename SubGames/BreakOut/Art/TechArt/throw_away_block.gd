class_name ThrowAwayBlock
extends RigidBody2D

#A Scene that exists purely as a visual effect 

var jump_into_forground := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var random_force_x = randf_range(-5, 5) * 100
	var random_force_y = randf_range(-5, -10) * 10
	
	self.apply_impulse(Vector2(random_force_x, random_force_y))
	self.add_constant_torque(10000 * sign(random_force_x))
	
	$TextureRect.color = Color(randf_range(0.0, 1.0), randf_range(0.0, 1.0), randf_range(0.0, 1.0))
	
	
	#Have a random chance for the block to be blasted into the foreground
	if(randi_range(0, 10) == 1): #or true:
		
		var tween := create_tween()
		tween.set_ease(Tween.EASE_IN)
		tween.set_trans(Tween.TRANS_CIRC)
		tween.tween_property(self, "scale", Vector2(10, 10), 0.4)
		
		await tween.finished
		self.queue_free()
		
	




#NOTE 
## Be responsible with your juice! 
## Make sure we are not building up too many visual effects offscreen! 

func _on_lifetime_timeout() -> void:
	self.queue_free()
