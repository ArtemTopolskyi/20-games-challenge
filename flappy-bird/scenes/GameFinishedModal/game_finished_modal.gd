extends Control

func _ready() -> void:
	Signals.game_over.connect(on_game_over);


func on_game_over():
	$ScoreLabel.text = "Your score: " + str(Global.current_score);
	visible = true;


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/MainMenu/main_menu.tscn")
