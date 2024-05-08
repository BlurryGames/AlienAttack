class_name Enemy extends Area2D

@export var speed: float = 300.0

func _physics_process(delta: float)-> void:
	global_position.x -= speed * delta

func _on_body_entered(body: Node2D)-> void:
	body.takeDamage()
	die()

func die()-> void:
	queue_free()
