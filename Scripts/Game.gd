class_name Game extends Node2D

@onready var player: Player = $Player

var lives: int = 3

func _on_area_2d_area_entered(area: Area2D)-> void:
	area.die()

func _on_player_took_damage():
	lives -= 1
	if lives == 0:
		player.die()
