extends Node

signal enemy_killed(enemy: Node, killer: Node)
signal xp_collected(amount: int)
signal player_damaged(current_hp: float, max_hp: float)
signal player_died
signal level_up(level: int)
signal run_started(mode_id: String)
signal run_ended(summary: Dictionary)
signal boss_warning(name: String)
signal screen_shake(strength: float, duration: float)
signal spawn_floating_text(text: String, world_pos: Vector2, color: Color)
