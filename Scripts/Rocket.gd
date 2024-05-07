class_name Rocket extends Area2D

@export var speed: float = 5.0

func _physics_process(_delta: float)-> void:
	global_position.x += speed
