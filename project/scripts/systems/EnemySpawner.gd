extends Node

@export var enemy_scene: PackedScene
@export var spawn_radius: float = 700.0
@export var base_interval: float = 0.7

var timer: float = 0.0

func _process(delta: float) -> void:
	timer -= delta
	if timer <= 0.0:
		timer = max(0.08, base_interval - GameState.elapsed_time * 0.01)
		spawn_enemy()

func spawn_enemy() -> void:
	if GameState.player_ref == null:
		return
	var enemy = enemy_scene.instantiate()
	var angle := randf() * TAU
	enemy.global_position = GameState.player_ref.global_position + Vector2.RIGHT.rotated(angle) * spawn_radius
	get_tree().current_scene.get_node("World/Enemies").add_child(enemy)
