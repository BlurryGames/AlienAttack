class_name Player extends CharacterBody2D

@onready var rocketContainer: Node = $RocketContainer

var rocketScene: PackedScene = preload("res://Scenes/rocket.tscn")
var speed: float = 300.0

func _process(_delta: float)-> void:
	if Input.is_action_just_pressed("Shoot"):
		shoot()

func _physics_process(_delta: float)-> void:
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
	
	var screenSize: Vector2 = get_viewport_rect().size
	global_position = global_position.clamp(Vector2.ZERO, screenSize)

func shoot()-> void:
	var rocketInstance: Area2D = rocketScene.instantiate()
	rocketContainer.add_child(rocketInstance)
	rocketInstance.global_position = global_position
	rocketInstance.global_position.x += 80.0
