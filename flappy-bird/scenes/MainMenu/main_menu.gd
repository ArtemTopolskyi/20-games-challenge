extends Node2D


func _on_button_pressed() -> void:
	Global.is_game_finished = false;
	Global.current_score = 0;

	get_tree().change_scene_to_file("res://scenes/GameWorld/game_world.tscn");
