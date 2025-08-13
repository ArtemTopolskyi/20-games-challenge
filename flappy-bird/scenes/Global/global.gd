extends Node

var largest_score: int = 0;
var current_score: int = 0;

var is_game_finished = false;

func increment_current_score() -> void:
	current_score += 1;
	
	if current_score > largest_score:
		largest_score = current_score;

	print(current_score, largest_score)
