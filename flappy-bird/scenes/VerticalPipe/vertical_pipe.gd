extends Node2D

const VELOCITY = 100;

func _ready() -> void:
	Signals.game_over.connect(stop_physics);


func stop_physics():
	set_physics_process(false);


func _physics_process(delta: float) -> void:
	position.x = position.x - (VELOCITY * delta);
	
	if (position.x < -300):
		queue_free();


func _on_top_pipe_body_entered(body: Node2D) -> void:
	notify_about_pipe_collision();


func _on_bottom_pipe_body_entered(body: Node2D) -> void:
	notify_about_pipe_collision();


func notify_about_pipe_collision():
	Signals.game_over.emit();


func _on_area_2d_body_exited(body: Node2D) -> void:
	notify_about_player_passed_pipe();
	
func notify_about_player_passed_pipe():
	if !Global.is_game_finished:
		Signals.score_updated.emit(Global.current_score + 1);
