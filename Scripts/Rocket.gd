class_name Rocket extends Area2D

@onready var visibleNotifier: VisibleOnScreenNotifier2D = $VisibleNotifier2D

@export var speed: float = 300.0

func _ready()-> void:
	visibleNotifier.screen_exited.connect(_on_screen_exited)

func _physics_process(delta: float)-> void:
	global_position.x += speed * delta

func _on_screen_exited()-> void:
	queue_free()
