extends Node

@export var xp_shard_scene: PackedScene

func _ready() -> void:
	SignalBus.enemy_killed.connect(_on_enemy_killed)
	SignalBus.player_died.connect(_on_player_died)
	SignalBus.level_up.connect(_on_level_up)
	GameState.start_run("standard_run")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept") and get_tree().paused:
		get_tree().paused = false
		get_tree().reload_current_scene()

func _on_enemy_killed(enemy: Node, _killer: Node) -> void:
	var shard = xp_shard_scene.instantiate()
	shard.global_position = enemy.global_position
	$World/Pickups.add_child(shard)

func _on_level_up(_level: int) -> void:
	# Simple phase-1 progression: scale starter weapon cadence + damage.
	var player := GameState.player_ref
	if player == null:
		return
	if player.get_node_or_null("WeaponMount") == null:
		return
	for child in player.get_node("WeaponMount").get_children():
		if "fire_interval" in child:
			child.fire_interval = max(0.06, child.fire_interval * 0.94)
		if "base_damage" in child:
			child.base_damage *= 1.08

func _on_player_died() -> void:
	get_tree().paused = true
	$UI/HUD.show_game_over(GameState.level, GameState.elapsed_time)
