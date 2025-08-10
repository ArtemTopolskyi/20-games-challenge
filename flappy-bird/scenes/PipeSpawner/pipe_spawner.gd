extends Node2D

@export var pipes_scene: PackedScene;

const PIPE_WIDTH = 80;
const PIPE_HEIGHT = 640;
const PIPES_VERTICAL_GAP = 160;

func _on_timer_timeout() -> void:
	spawn_pipe();


func spawn_pipe():
	var viewport_size = get_viewport_rect().size;

	var vertical_pipes = pipes_scene.instantiate();
	
	var pipes_spawn_position = Vector2(
		viewport_size.x + PIPE_WIDTH * 2,
		randf_range(-PIPE_HEIGHT / 4, PIPE_HEIGHT / 4)
	);
	
	vertical_pipes.position = pipes_spawn_position;
	
	add_child(vertical_pipes);
