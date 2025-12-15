extends Area2D

# Reference to the sprite for flipping animation
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Signal sent to the main scene when the player dies
signal player_died(player)

# Movement speed of the snail
const SPEED := 100.0

# Direction: -1 = left, 1 = right
var direction := -1.0


func _ready() -> void:
	# IMPORTANT:
	# Disable collision detection at start to avoid
	# triggering body_entered immediately when the level loads
	monitoring = false
	
	# Wait one frame so everything is properly positioned
	await get_tree().process_frame
	
	# Re-enable collision detection
	monitoring = true


func _process(delta: float) -> void:
	# Move the snail horizontally
	position.x += direction * SPEED * delta


func _on_timer_timeout() -> void:
	# Change direction when timer triggers
	direction *= -1
	
	# Flip sprite depending on direction
	animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h


func _on_body_entered(body: Node2D) -> void:
	# Check that the body is the player and still alive
	if body.name == "player" and body.alive:
		
		# Emit signal to notify the main scene
		player_died.emit(body)
		
		# Disable further collisions to prevent multiple deaths
		monitoring = false
