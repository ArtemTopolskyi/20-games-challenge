extends Node2D

@export var pipes_scene: PackedScene;

const PIPE_WIDTH = 80;
const PIPE_HEIGHT = 640;
const PIPES_VERTICAL_GAP = 160;

signal game_over

func start_timer() -> void:
	$Timer.start();


func _on_timer_timeout() -> void:
	spawn_pipe();


func spawn_pipe():
	var viewport_size = get_viewport_rect().size;

	var vertical_pipes = pipes_scene.instantiate();
	
	var pipes_spawn_position = Vector2(
		viewport_size.x + PIPE_WIDTH * 2,
		randf_range(-PIPE_HEIGHT / 4, PIPE_HEIGHT / 4)
	);
	
	vertical_pipes.game_end.connect(handle_game_over)
	vertical_pipes.position = pipes_spawn_position;
	
	add_child(vertical_pipes);

func handle_game_over():
	$Timer.stop();
	game_over.emit();
	stop_all_pipes();
	
	
	
func stop_all_pipes():
	var children = get_children();
	print("before loop"); 
	for child in children:
		if child.is_in_group("Pipes"):
			print(child, child.name)
			child.stop_game();
