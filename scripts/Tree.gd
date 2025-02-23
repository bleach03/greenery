extends Node2D

@export var max_branches: int = 5
var current_branches: int = 0

func _ready():
	# Hide all branch nodes at the start
	for i in range(1, max_branches + 1):
		var branch_node = $"Branch{i}"
		if branch_node:
			branch_node.visible = false

# Called by the main scene when a star is collected.
# We treat points < 2000 as negative (shrink) and points >= 2000 as positive (grow)
func on_star_collected(points: int):
	if points < 2000:
		shrink_branch()
	else:
		grow_branch()

func grow_branch():
	if current_branches < max_branches:
		current_branches += 1
		var branch_node = $"Branch{current_branches}"
		if branch_node:
			branch_node.visible = true
		else:
			print("Branch node Branch", current_branches, " not found.")
	else:
		print("Maximum branches reached!")

func shrink_branch():
	if current_branches > 0:
		var branch_node = $"Branch{current_branches}"
		if branch_node:
			branch_node.visible = false
		current_branches -= 1
	else:
		game_over()

func game_over():
	print("Game Over! The trunk has been destroyed.")
	# Here you can show a game-over UI, restart the game, etc.
