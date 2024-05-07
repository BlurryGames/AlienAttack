class_name Player extends CharacterBody2D

var speed: float = 300.0

func _physics_process(delta: float)-> void:
	velocity = Vector2.ZERO
	if Input.is_action_pressed("MoveRight"):
		velocity.x = speed
	if Input.is_action_pressed("MoveLeft"):
		velocity.x = -speed
	if Input.is_action_pressed("MoveUp"):
		velocity.y = -speed
	if Input.is_action_pressed("MoveDown"):
		velocity.y = speed
	move_and_slide()
