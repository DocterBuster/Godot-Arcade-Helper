extends CharacterBody2D


const SPEED = 3.0

const WALK_SPEED = 400

const JUMP_VELOCITY = -800.0

const SPEED_CAP = 500
const SPEED_DECREESE = 40


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Arcade_Middle_Button") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if($PushBackTimer.is_stopped()):
		if direction:
			velocity.x = direction * WALK_SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED_DECREESE)
	
	if(Input.is_action_just_pressed("Arcade_Middle_Button") and is_on_wall()):
		$PushBackTimer.start()
		
		if(get_slide_collision(0).get_normal().x > 0):
			velocity.x = -JUMP_VELOCITY * 2
		else:
			velocity.x = +JUMP_VELOCITY * 2
		
		velocity.y = JUMP_VELOCITY / 1.3
	
	
	
	#Lower to Cap
	if(velocity.x > SPEED_CAP):
		velocity.x -= SPEED_DECREESE
	elif(velocity.x < -SPEED_CAP):
		velocity.x += SPEED_DECREESE
	print(velocity)
	
	move_and_slide()
	



func _process(delta: float) -> void:
	
	if(Input.is_action_just_pressed("Arcade_Left_Button")):
		$ButtonPresser.stop()
		$ButtonPresser.play("left_press")
	elif(Input.is_action_just_pressed("Arcade_Right_Button")):
		$ButtonPresser.stop()
		$ButtonPresser.play("right_press")
	elif(Input.is_action_just_pressed("Arcade_Middle_Button")):
		$ButtonPresser.stop()
		$ButtonPresser.play("middle_press")
	
	
	
	
