extends Node
@export var star_scene: PackedScene  # Assign the star scene in the inspector

func _ready():
	print("im working")
	spawn_star()
	
func _process(delta):
	pass

func spawn_star():
	var star = star_scene.instantiate() as Area2D
	add_child(star)
	
	# Random position at top of screen
	star.position = Vector2(randi_range(50, 1230), -200)
	
	# Random point value (adjust this as needed)
	star.points = randi_range(1, 20)  # Assign points between 1 and 20
	star.update_star_appearance()
