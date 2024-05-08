class_name EnemySpawner extends Node2D

signal enemySpawned(enemyInstance: Enemy)
signal pathEnemySpawned(pathEnemyInstance: PathEnemy)

@onready var spawnPositions: Node2D = $SpawnPositions

var enemyScene: PackedScene = preload("res://Scenes/enemy.tscn")
var pathEnemyScene: PackedScene = preload("res://Scenes/path_enemy.tscn")

func _on_timer_timeout()-> void:
	spawnEnemy()

func _on_path_enemy_timer_timeout()-> void:
	spawnPathEnemy()

func spawnEnemy()-> void:
	var spawnPositionsArray: Array[Node] = spawnPositions.get_children()
	var randomSpawnPosition: Marker2D = spawnPositionsArray.pick_random()
	
	var enemyInstance: Area2D = enemyScene.instantiate()
	enemyInstance.global_position = randomSpawnPosition.global_position
	enemySpawned.emit(enemyInstance)

func spawnPathEnemy()-> void:
	var pathEnemyInstance: PathEnemy = pathEnemyScene.instantiate()
	pathEnemySpawned.emit(pathEnemyInstance)
