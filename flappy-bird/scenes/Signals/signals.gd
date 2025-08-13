extends Node

signal game_over
signal score_updated(value: int)


func _ready() -> void:
	game_over.connect(on_game_over);
	score_updated.connect(on_score_updated);


func on_game_over():
	Global.is_game_finished = true;


func on_score_updated(value: int):
	Global.current_score = value;

	if Global.current_score > Global.largest_score:
		Global.largest_score = Global.current_score;
