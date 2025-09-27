class_name Ball
extends CharacterBody2D

#How much damage this ball does 
@export var ball_damage = 1

@export var inital_speed := 160

@export var camera : Camera2D


func _ready() -> void:
	velocity = Vector2(inital_speed, inital_speed)



func _physics_process(delta: float) -> void:
	
	
	
	#Move and gather collision data
	var collision = move_and_collide(velocity * delta)
	
	if(collision):
		#Get the collided object
		var collided = collision.get_collider()
		
		if(collided is Paddle):
			hit_paddle(collided, collision, delta)
		elif(collided is Block):
			hit_block(collided, collision, delta)
		elif(collided is Wall):
			hit_wall(collided, collision, delta)





## Ball hit functions 

#Ran when the ball hits the paddle  
func hit_paddle(paddle : Paddle, collision_info : KinematicCollision2D,  delta: float) -> void:
	velocity = velocity.bounce(collision_info.get_normal())
	
	#velocity.x = (paddle.velocity.x + velocity.x) / 2
	
	
	##Tween the paddle when hitting! 
	var tween : Tween = create_tween() 
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_ELASTIC)
	tween.tween_property(paddle, "scale", Vector2(1.0, 1.0), 0.4).from(Vector2(1.0, 0.2))
	
	ball_hit_anything()


#Ran when the ball hits a wall 
func hit_wall(wall : Wall, collision_info : KinematicCollision2D, delta: float) -> void:
	velocity = velocity.bounce(collision_info.get_normal())
	
	ball_hit_anything()

#Ran when the ball hits a brick 
func hit_block(block : Block, collision_info : KinematicCollision2D, delta: float) -> void:
	velocity = velocity.bounce(collision_info.get_normal())
	block.hit_block_with_ball(self)
	
	ball_hit_anything()



#Called when the ball hits anything at all 
func ball_hit_anything():
	
	##Tween the ball when it hits something!
	var tween : Tween = create_tween() 
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.set_trans(Tween.TRANS_BOUNCE)
	tween.tween_property($TextureRect, "scale", Vector2(1.0, 1.0), 0.2).from(Vector2(1.5, 1.5))
	
	
	##Shake the camera!
	camera.add_camera_shake(0.3)
