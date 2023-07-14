extends Camera2D
class_name FollowCamera


@export var target : Node2D


func _ready():
	make_current()


func _process(_delta):
	if target != null:
		global_position = target.global_position
	else:
		global_position = global_position


func set_target(new_target : Node2D):
	if new_target != null:
		target = new_target

