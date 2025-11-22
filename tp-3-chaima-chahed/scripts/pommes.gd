extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collected_sound: AudioStreamPlayer2D = $CollectedSound


signal collected

func _ready() -> void:
	pass
	
	
	
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	animated_sprite_2d.animation = "collected"
	collected_sound.play()
	collected.emit()
