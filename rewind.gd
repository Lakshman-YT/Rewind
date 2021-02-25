extends Node

var recorded_data = []
var is_rewinding = false
var rewind_length = 60 * 5
var enemy_count = 0
var rewind_bodies
var can_rewind = true

func _ready():
	rewind_bodies = get_tree().get_nodes_in_group("enemy")
	for enemy in rewind_bodies:
		recorded_data.push_back([enemy.name])

func rewind():
	if recorded_data.size() >= 0 and ! Input.is_action_pressed("Rewind"):
		can_rewind = true
	if recorded_data.size() <= 0 :
		can_rewind = false
		
	if Input.is_action_pressed("Rewind") and can_rewind:
		is_rewinding = true
		for enemy in rewind_bodies:
			enemy.is_rewinding = true
			var data = recorded_data[enemy_count]
			if data.size() > 1:
				var current_frame = data[0]
				enemy.Health = current_frame[0]
				data.pop_front()
				enemy_count += 1
		enemy_count = 0
				
	else:
		is_rewinding = false
		for enemy in rewind_bodies:
			enemy.is_rewinding = false
			var data = recorded_data[enemy_count]
			enemy_count += 1
			data.push_front([enemy.Health])
		enemy_count = 0
		
		
func _physics_process(delta):
	rewind()
	
	
	
	
