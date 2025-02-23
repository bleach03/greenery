extends Node

@export var star_scene: PackedScene   # Assign the star scene in the inspector

# Get a reference to the Tree instance (must be a child of TyTempMain)
onready var tree = $Tree  

func _ready():
	# Spawn several stars on startup. Alternatively, use a Timer for periodic spawning.
	for i in range(6):
		spawn_star()

func spawn_star():
	var star_instance = star_scene.instantiate() as Node2D
	add_child(star_instance)
	
	# Position star at a random x at the top of the screen.
	star_instance.position = Vector2(int(rand_range(50, 1230)), -50)
	
	# Connect the star's collected signal to our callback.
	star_instance.connect("collected", self, "_on_star_collected")
	
func _on_star_collected(points: int):
	tree.on_star_collected(points)
