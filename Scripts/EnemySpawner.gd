class_name EnemySpawner extends Node2D

signal enemySpawned(enemyInstance: Enemy)

@onready var spawnPositions: Node2D = $SpawnPositions

var enemyScene: PackedScene = preload("res://Scenes/enemy.tscn")

func _on_timer_timeout()-> void:
	spawnEnemy()

func spawnEnemy()-> void:
	var spawnPositionsArray: Array[Node] = spawnPositions.get_children()
	var randomSpawnPosition: Marker2D = spawnPositionsArray.pick_random()
	
	var enemyInstance: Area2D = enemyScene.instantiate()
	enemyInstance.global_position = randomSpawnPosition.global_position
	enemySpawned.emit(enemyInstance)
