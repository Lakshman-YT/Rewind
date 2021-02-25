extends KinematicBody
var Health  = 100
var can_die_peacefully = true
var is_rewinding

func _process(delta):
	
	if Health <= 0 :
		$".".visible = false
		$CollisionShape.disabled = true
		yield(get_tree().create_timer(10) , "timeout")
		can_die_peacefully = true
	if can_die_peacefully and Health <= 0:
		queue_free()
	if Health > 0:
		can_die_peacefully = false
		$".".visible = true
		$CollisionShape.disabled = false
	
	if ! is_rewinding:
		pass
		
		
		
		
		
		
