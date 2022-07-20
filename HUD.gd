extends CanvasLayer

signal start_game

func set_score(score):
	$ScoreLabel.text = str(score)

func show_message(text):
	$MessageLabel.text = text 
	$MessageLabel.show()
	$Timer.start()
	
func show_game_over():
	show_message("Game Over")
	yield($Timer, "timeout")
	$MessageLabel.text = "AMERUN"
	$MessageLabel.show()
	yield(get_tree().create_timer(1.0), "timeout")
	$Button.show()

func _on_Timer_timeout():
	$MessageLabel.hide()


func _on_Button_pressed():
	$Button.hide()
	emit_signal("start_game")
