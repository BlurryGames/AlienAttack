class_name Game extends Node2D

@onready var player: Player = $Player
@onready var hud: HUD = $UI/Hud
@onready var ui: CanvasLayer = $UI
@onready var enemyHitSound: AudioStreamPlayer = $EnemyHitSound
@onready var playerHitSound: AudioStreamPlayer = $PlayerHitSound

var gameOverScene: PackedScene = preload("res://Scenes/game_over_screen.tscn")

var lives: int = 3
var score: int = 0

func _ready()-> void:
	hud.setScoreLabel(score)
	hud.setLives(lives)

func _on_area_2d_area_entered(area: Area2D)-> void:
	area.queue_free()

func _on_player_took_damage():
	playerHitSound.play()
	lives -= 1
	hud.setLives(lives)
	if lives == 0:
		player.die()
		
		await get_tree().create_timer(1.5).timeout
		
		var gameOverInstance: GameOverScreen = gameOverScene.instantiate()
		gameOverInstance.setScore(score)
		ui.add_child(gameOverInstance)

func _on_enemy_spawner_enemy_spawned(enemyInstance: Enemy)-> void:
	enemyInstance.died.connect(_on_enemy_died)
	add_child(enemyInstance)

func _on_enemy_spawner_path_enemy_spawned(pathEnemyInstance: PathEnemy)-> void:
	add_child(pathEnemyInstance)
	pathEnemyInstance.enemy.died.connect(_on_enemy_died)

func _on_enemy_died()-> void:
	score += 100
	hud.setScoreLabel(score)
	enemyHitSound.play()
