extends Node2D

const VELOCITY = 100;

signal game_end

var game_stoped = false;

func _physics_process(delta: float) -> void:
	if (game_stoped):
		return;

	position.x = position.x - (VELOCITY * delta);
	
	if (position.x < -300):
		queue_free();


func stop_game():
	game_stoped = true;

func _on_top_pipe_body_entered(body: Node2D) -> void:
	notify_about_pipe_collision();


func _on_bottom_pipe_body_entered(body: Node2D) -> void:
	notify_about_pipe_collision();


func notify_about_pipe_collision():
	game_end.emit()


func _on_area_2d_body_exited(body: Node2D) -> void:
	notify_about_player_passed_pipe();
	
func notify_about_player_passed_pipe():
	Global.increment_current_score();
