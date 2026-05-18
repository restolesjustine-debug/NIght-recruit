extends Node

@export var xp_shard_scene: PackedScene

func _ready() -> void:
	SignalBus.enemy_killed.connect(_on_enemy_killed)
	SignalBus.player_died.connect(_on_player_died)
	GameState.start_run("standard_run")

func _on_enemy_killed(enemy: Node, _killer: Node) -> void:
	var shard = xp_shard_scene.instantiate()
	shard.global_position = enemy.global_position
	$World/Pickups.add_child(shard)

func _on_player_died() -> void:
	get_tree().paused = true
	$UI/HUD.show_game_over(GameState.level, GameState.elapsed_time)
