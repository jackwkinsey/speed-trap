extends CharacterBody2D


@onready var stacked_sprite:StackedSprite = $StackedSprite
@export var starting_direction:Vector2 = Vector2.ZERO


const SPEED = 130
const ACCELERATION = 5


func _ready():
	stacked_sprite.set_angle(starting_direction.angle())


func _physics_process(delta):
	var input = Input.get_vector("left", "right", "up", "down")
	velocity = lerp(velocity, input * SPEED, ACCELERATION * delta)
	move_and_slide()
	
	if input != Vector2.ZERO:
		stacked_sprite.set_angle(velocity.angle())

