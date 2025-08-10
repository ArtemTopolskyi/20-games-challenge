extends CharacterBody2D

const GRAVITY = 980.0;
const JUMP_VELOCITY = -350.0

var jump_triggered = false;

func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta;
	
	if jump_triggered:
		velocity.y = JUMP_VELOCITY;
		jump_triggered = false;
		
	if is_on_floor():
		print("Player touched the groud; game over");
	
	move_and_slide();


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		jump_triggered = true;
