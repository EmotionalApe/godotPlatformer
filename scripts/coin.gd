extends Area2D

@onready var game_manager = %GameManager
@onready var pickup_sound = $PickupSound
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_shape_2d = $CollisionShape2D

func _on_body_entered(body):
	game_manager.add_point()
	
	# need to play the sound completely before queue_free!
	pickup_sound.play()
	animated_sprite_2d.visible = false
	collision_shape_2d.set_deferred("disabled", true)
	await get_tree().create_timer(pickup_sound.stream.get_length()).timeout
	queue_free()
	
	
