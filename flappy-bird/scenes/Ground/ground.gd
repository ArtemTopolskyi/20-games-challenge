extends AnimatableBody2D

const VELOCITY = 100;

const GROUND_SURFACE_SPRITE_WIDTH = 128;

var screen_width;

func _ready() -> void:
	screen_width = get_viewport().get_visible_rect().size.x;

	Signals.game_over.connect(stop_physics);


func stop_physics():
	set_physics_process(false);


func _physics_process(delta: float) -> void:
	position.x = position.x - (VELOCITY * delta);
	
	if position.x < (-GROUND_SURFACE_SPRITE_WIDTH * 3):
		position.x = 0;
