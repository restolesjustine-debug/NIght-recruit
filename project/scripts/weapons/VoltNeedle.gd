extends WeaponBase

@export var projectile_scene: PackedScene
@export var range_hint: float = 600.0

func fire() -> void:
	if owner == null:
		return
	var target := _find_target()
	if target == null:
		return
	var projectile = projectile_scene.instantiate()
	projectile.global_position = global_position
	projectile.direction = (target.global_position - global_position).normalized()
	projectile.damage = base_damage * owner.get_crit_multiplier()
	get_tree().current_scene.add_child(projectile)

func _find_target() -> Node2D:
	var enemies := get_tree().get_nodes_in_group("enemies")
	var best: Node2D
	var best_dist := INF
	for enemy in enemies:
		var d := owner.global_position.distance_to(enemy.global_position)
		if d < best_dist and d <= range_hint:
			best_dist = d
			best = enemy
	return best
