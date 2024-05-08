class_name HUD extends Control

@onready var score: Label = $Score
@onready var livesLeft: Label = $LivesLeft

func setScoreLabel(newScore: int)-> void:
	score.text = "SCORE: " + str(newScore)

func setLives(amount: int)-> void:
	livesLeft.text = str(amount)
