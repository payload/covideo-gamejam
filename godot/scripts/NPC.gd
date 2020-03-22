extends "res://scripts/Character.gd"

var npc_think_time = 0.7
var npc_think_timer = null
var movement_direction

export var speed = 70
var target : Node = null

var result_up
var result_right
var result_down
var result_left

func _ready():
	_setup_npc_think_time_timer()
	_find_target()


func _process(delta):
	if target != null:
		_move()
	else:
		print("target is null")


func _on_collision(colliding_body):
	print("collision " + colliding_body.name)


func _find_target():
	var scene_parent = self.find_parent("DEV")
	if scene_parent == null:
		print("could not find scene")
	else:
		var target_object = scene_parent.find_node("Player")
		if target_object == null:
			print("could not find target")
		else:
			print(target_object.name)
			target = target_object.get_child(0)


func _move():
	var target_direction = _get_direction_to_target()
	#target_direction = target_direction - $RigidBody2D.position
	movement_direction = target_direction.normalized() * speed
	$KinematicBody2D.move_and_slide(movement_direction)
	
	
func _get_direction_to_target():
	#if target != null:
	#	return target.position - self.position
	#else:
	#	print("target is null!")
	#	return Vector2(1,1)
	#_calculate_route()
	return Vector2(1,1)

func _setup_npc_think_time_timer():
	npc_think_timer = Timer.new()
	npc_think_timer.set_one_shot(true)
	npc_think_timer.set_wait_time(npc_think_time)
	npc_think_timer.connect("timeout", self, "_on_think_timer_timeout")
	add_child(npc_think_timer)
	print("npc timer set up")

func _on_think_timer_timeout():
	print("npc timeout")
	
func _physics_process(delta):
	#return Vector2(1,1)
	#var space_state = get_world2D().direct_space_state
	#result_up = space_state.intersect_ray(self.position, Vector2(position.x, position.y + 50))
	#result_right = space_state.intersect_ray(self.position, Vector2(position.x + 50, position.y))
	#result_down = space_state.intersect_ray(self.position, Vector2(position.x, position.y - 50))
	#result_left = space_state.intersect_ray(self.position, Vector2(position.x - 50, position.y))

func _calculate_route():
	pass
	
	
	
