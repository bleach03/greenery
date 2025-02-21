extends Node
@export var star_scene: PackedScene  # Assign the star scene in the inspector

func _ready():
	print("im working")
	spawn_star()
	spawn_star()
	
func _process(delta):
	pass

func spawn_star():
	var star = star_scene.instantiate() as Node2D  # Ensure it's the correct type
	add_child(star)
	star.points = star.assign_random_points()
	star.debug_points.text = str(star.points)
	
	star.position = Vector2(randi_range(50, 550), -50) # Assign a random position at the top of the screen
