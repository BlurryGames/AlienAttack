class_name Game extends Node2D

@onready var player: Player = $Player

var lives: int = 3
var score: int = 0

func _on_area_2d_area_entered(area: Area2D)-> void:
	area.die()

func _on_player_took_damage():
	lives -= 1
	if lives == 0:
		player.die()

func _on_enemy_spawner_enemy_spawned(enemyInstance: Enemy)-> void:
	enemyInstance.died.connect(_on_enemy_died)
	add_child(enemyInstance)

func _on_enemy_died()-> void:
	score += 100
	print(score)
