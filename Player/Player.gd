extends KinematicBody


func _ready():
	pass
	
func _input(event):
	if ! is_rewinding:
		# your content
		pass
		
		
func _physics_process(delta):
	rewind()
	if ! is_rewinding:
		# process content
		pass
		

var recorded_data = []
var is_rewinding = false
var rewind_time = 60 * 5
var can_rewind = true

func rewind():
	if recorded_data.size() >= 0 and ! Input.is_action_pressed("Rewind"):
		can_rewind = true
	if recorded_data.size() <= 0 :
		can_rewind = false
		
	if Input.is_action_pressed("Rewind") and can_rewind :
		is_rewinding = true
		if recorded_data.size() > 0:
			var current_frame = recorded_data[0]
			if current_frame != null:
				$".".transform.origin = current_frame[0]
				$".".rotation = current_frame[1]
				recorded_data.pop_front()
	else:
		is_rewinding = false
		recorded_data.push_front([ $".".transform.origin , $".".rotation ] )
		if recorded_data.size() > rewind_time:
			recorded_data.pop_back()
	
	
	
	



