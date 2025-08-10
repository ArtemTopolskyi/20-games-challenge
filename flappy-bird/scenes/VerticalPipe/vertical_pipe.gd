extends Node2D

const VELOCITY = 100;

func _physics_process(delta: float) -> void:
	position.x = position.x - (VELOCITY * delta);
	
	if (position.x < -300):
		queue_free();


func _on_top_pipe_body_entered(body: Node2D) -> void:
	notify_about_pipe_collision();


func _on_bottom_pipe_body_entered(body: Node2D) -> void:
	notify_about_pipe_collision();


func notify_about_pipe_collision():
	print("Game over")
