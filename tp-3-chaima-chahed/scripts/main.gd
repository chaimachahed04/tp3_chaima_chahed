extends Node2D
@onready var scorelabel: Label = $HUD/scorepanel/scorelabel
@onready var fade: ColorRect = $HUD/Fade

var level: int = 1
var score: int = 0
var current_level_root: Node = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#setup level
	fade.modulate.a = 1.0
	current_level_root = get_node("LevelRoot")
	await _load_level(level, true, false)


#------------------
#LEVEL
#------------------

func _load_level(level_number: int, firt_load: bool, reset_score) -> void:
	#Fade out
	if not firt_load:
		await _fade(1.0)
		
	if reset_score:
		score = 0
		scorelabel.text = "SCORE: 0" 
	
	if current_level_root:
		current_level_root.queue_free()
		
	#Change level
	var level_path = "res://scenes/levels/level_%s.tscn" % level_number
	var scene = load(level_path)
	
	if scene == null:
		push_error("impossible de charger le niveau : " + level_path)
	current_level_root = scene.instantiate()
	add_child(current_level_root)
	current_level_root.name = "LevelRoot"
	_setup_level(current_level_root)
	
	#Fade in
	await _fade(0.0)
	
 
func _setup_level(level_root: Node) -> void:
	
	#connect exit 
	var exit = level_root.get_node_or_null("Exit")
	if exit:
		exit.body_entered.connect(_on_exit_body_entered)
		
	
	#connect apples
	var apples = level_root.get_node_or_null("Apples")
	if apples:
		for enemy in apples.get_children():
			enemy.collected.connect(increase_score)
	
	
	
	#connect enemies
	var enemies = level_root.get_node_or_null("Enemies")
	if enemies:
		for enemy in enemies.get_children():
			enemy.player_died.connect(_on_player_died)
	
	#------------
	#SIGNAL
	#------------
func _on_exit_body_entered(body: Node2D) -> void:
	if body.name == "player":
		level += 1
		print(level)
		body.can_move = false
		await _load_level(level, false, false)
	
func _on_player_died(body):
	body.die()
	await _load_level(level, false, true)
	
	
	
	#--------------
	#SCORE
	#--------------
	
func increase_score() -> void:
		score += 1
		scorelabel.text = "SCORE: %s" % score
		
		
	#-----------
	#FADE
	#-----------
	
func _fade(to_alpha: float) -> void:
	var tween := create_tween()
	tween.tween_property(fade, "modulate:a", to_alpha, 1.5)
	await tween.finished
	
 
	
