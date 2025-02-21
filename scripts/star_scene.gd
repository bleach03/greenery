extends Node

@export var points: int = 5  # Default point value
@onready var sprite = $Area2D/Sprite2D
@onready var star = $"."
# Motion variables
var velocity: Vector2 = Vector2(0, 100)  # Initial downward speed
var acceleration: Vector2 = Vector2(0, -50)  # Upward acceleration to slow down
var target_y: float = 250  # Default stop position
var stopping: bool = false  # Track if stopping effect should start

func _process(delta):
	if not stopping:
		velocity += acceleration * delta  # Apply acceleration
		star.position += velocity * delta  # Update position
	
		# Stop when reaching target
	if star.position.y >= target_y:
		stopping = true
		velocity = Vector2.ZERO  # Stop movement
		
func assign_random_points() -> int:
	var rand_value = randf()  # Generates a random float between 0.0 and 1.0
	if rand_value < 0.4:  # 40% chance
		return 5
	elif rand_value < 0.7:  # 30% chance (40% + 30% = 70%)
		return 10
	elif rand_value < 0.9:  # 20% chance (70% + 20% = 90%)
		return 25
	else:  # 10% chance (remaining)
		return 50
