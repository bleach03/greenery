extends Node

@export var sprite : Node2D
@export var debug_points : Label
@export var size : Area2D

@onready var points = assign_random_points()  # Default point value
@onready var star = $"."

# Motion variables
var motion = int(randf_range(200,500))
var velocity: Vector2 = Vector2(0, motion)  # Initial downward speed
var acceleration: Vector2 = Vector2(0, -motion*randf_range(0.5, 0.8))  # Upward acceleration to slow down
var target_y: float = 250  # Default stop position
var stopping: bool = false  # Track if stopping effect should start

func _ready():
	debug_points.text = str(star.points)
	print(debug_points.text) 
	size.scale = scale_factor(points)
	
func _process(delta):
	velocity += acceleration * delta  # Apply acceleration
	star.position += velocity * delta  # Update position
	
func assign_random_points() -> int:
	var rand_value = randf()  # Generates a random float between 0.0 and 1.0
	if rand_value < 0.4:  # 40% chance
		return 500
	elif rand_value < 0.7:  # 30% chance (40% + 30% = 70%)
		return 1000
	elif rand_value < 0.9:  # 20% chance (70% + 20% = 90%)
		return 2500
	else:  # 10% chance (remaining)
		return 5000
		
func scale_factor(points: int) -> Vector2:
	match points:
		500: return Vector2(1,1)
		1000: return Vector2(0.75, 0.75)
		2500: return Vector2(0.6, 0.6)
	return Vector2(0.4, 0.4)
