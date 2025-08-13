extends CharacterBody2D

const GRAVITY = 980.0;
const JUMP_VELOCITY = -350.0

var is_activated = false;
var jump_triggered = false;

func _ready():
	Signals.game_over.connect(handle_game_over);


func handle_game_over():
	set_process(false);


func activate() -> void:
	is_activated = true;


func _physics_process(delta: float) -> void:
	if !is_activated:
		return;

	velocity.y += GRAVITY * delta;
	
	if jump_triggered:
		velocity.y = JUMP_VELOCITY;
		jump_triggered = false;
		
	if !Global.is_game_finished && is_on_floor():
		Signals.game_over.emit();
	
	move_and_slide();


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		jump_triggered = true;
