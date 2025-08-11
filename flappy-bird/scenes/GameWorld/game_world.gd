extends Node2D

var is_game_started = false;

func _process(delta: float) -> void:
	if !is_game_started && Input.is_action_just_pressed("ui_accept"):
		start_game();
 

func start_game():
	is_game_started = true;

	$PipeSpawner.start_timer();
	$Bird.activate();
	
	$StartGameLabel.queue_free();
