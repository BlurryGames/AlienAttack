class_name GameOverScreen extends Control

func _on_retry_button_pressed()-> void:
	get_tree().reload_current_scene()

func setScore(newScore: int)-> void:
	$Panel/Score.text = "SCORE: " + str(newScore)
