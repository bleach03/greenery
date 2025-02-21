extends Node

@export var sprite : Node2D
@export var debug_points : Label

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
	print(debug_points.text)  # Check if it's being assigned correctly

func _process(delta):
	velocity += acceleration * delta  # Apply acceleration
	star.position += velocity * delta  # Update position
	

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
		
