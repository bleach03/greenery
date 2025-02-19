extends Node

@export var points: int = 1  # Default point value
@onready var sprite = $Sprite2D

# Motion variables
var velocity: Vector2 = Vector2(0, 100)  # Initial downward speed
var acceleration: Vector2 = Vector2(0, -50)  # Upward acceleration to slow down
var target_y: float = 250  # Default stop position
var stopping: bool = false  # Track if stopping effect should start

var points: int = 5


func _process(delta):
	if not stopping:
		velocity += acceleration * delta  # Apply acceleration
		position += velocity * delta  # Update position
	
		# Stop when reaching target
	if position.y >= target_y:
		stopping = true
		velocity = Vector2.ZERO  # Stop movement
