extends Node

@export var sprite : Node2D
@export var debug_points : Label
@export var star : Area2D
@onready var points = assign_random_points()

signal collected(points)

# Motion variables
var motion = int(randf_range(200,500))
var velocity: Vector2 = Vector2(0, motion)
var acceleration: Vector2 = Vector2(0, -motion*randf_range(0.5, 0.8))
var being_held: bool = false  # Track if the mouse button is held
var is_mouse_over: bool = false  # Track if the mouse is over the star

func _ready():
	debug_points.text = str(points)
	print(debug_points.text) 
	star.apply_scale(scale_factor(points))
	connect("mouse_entered", Callable(self, "_on_mouse_enter"))
	connect("mouse_exited", Callable(self, "_on_mouse_exit"))
	
func _process(delta):
	velocity += acceleration * delta  # Apply acceleration
	star.position += velocity * delta  # Update position
	if star.position.y < -150:
		queue_free()
		print("deleted")
	if Input.is_action_pressed("Left_Mouse") and is_mouse_over:
		collect_star()  # Collect when hovering and clicking
		
		
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

func _on_mouse_enter():
	is_mouse_over = true  # Mouse entered the star's collision area

func _on_mouse_exit():
	is_mouse_over = false  # Mouse left the collision area
	
func collect_star():
	print("Star collected! Points: ", points)
	collected.emit(points)  # Emit signal with points
	queue_free()  # Remove the star
