extends CharacterBody2D


@export var speed = minSpeed # How fast the player will move (pixels/sec).
var acceleration = 25
var minSpeed = 100
var maxSpeed = 800 - acceleration
var xDirection = 0
var yDirection = 0
var screen_size # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#Movement
	var velocity = Vector2.ZERO
	velocity.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	velocity.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	

	#Acceleration
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		if speed <= maxSpeed:
			speed += acceleration 
		print(velocity)
	else:
		speed = minSpeed
	
	
	#Inertia
	
	
	
	
	
	position += velocity * delta
	move_and_slide()
	
	
	pass
