extends Node
@export var star_scene : PackedScene  # Assign the star scene in the inspector
@export var time : Timer
func _ready():
	spawn_star()
	spawn_star()
	spawn_star()
	spawn_star()
	spawn_star()
	spawn_star()
	
func _process(delta):
	pass

func spawn_star():
	var star = star_scene.instantiate() as Node2D  # Ensure it's the correct type
	add_child(star)
	
	star.position = Vector2(randi_range(50, 1230), -50) # Assign a random position at the top of the screen
