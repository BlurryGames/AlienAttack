class_name HUD extends Control

@onready var score: Label = $Score

func setScoreLabel(newScore: int)-> void:
	score.text = "SCORE: " + str(newScore)
