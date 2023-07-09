@tool
extends Sprite2D
class_name StackedSprite

## Toggles showing the sprite stack in the editor.
@export var show_sprites: bool = false:
	set(_show_sprites):
		show_sprites = _show_sprites
		if show_sprites:
			render_sprites()
		else:
			clear_sprites()

## Toggles sprite stack rotation. [br][br] This is helpful for previewing what
## the sprite stack will look like when rotating in game.
@export var rotate_sprites: bool = false:
	set(_rotate_sprites):
		rotate_sprites = _rotate_sprites
		if not rotate_sprites:
			for sprite in get_children():
				sprite.rotation = 0


func _ready():
	render_sprites()


func _process(delta):
	if rotate_sprites:
		for sprite in get_children():
			sprite.rotation += delta


func set_angle(angle):
	for sprite in get_children():
		sprite.rotation = angle


func clear_sprites():
	for sprite in get_children():
		sprite.queue_free()


func render_sprites():
	clear_sprites()
	for i in range(0, hframes):
		var next_sprite = Sprite2D.new()
		next_sprite.texture = texture
		next_sprite.hframes = hframes
		next_sprite.frame = i
		next_sprite.position.y = -i * 0.75
		add_child(next_sprite)

