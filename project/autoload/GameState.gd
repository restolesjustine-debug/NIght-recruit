extends Node

const LEVEL_XP_CURVE := [0, 8, 18, 34, 56, 85, 122, 168, 225, 295, 380]

var seed: int = 0
var current_mode: String = "standard_run"
var current_biome: String = "neon_graveyard"
var elapsed_time: float = 0.0
var level: int = 1
var xp: int = 0
var player_ref: Node2D

func start_run(mode_id: String = "standard_run") -> void:
	current_mode = mode_id
	seed = randi()
	elapsed_time = 0.0
	level = 1
	xp = 0
	SignalBus.run_started.emit(mode_id)

func add_xp(amount: int) -> void:
	xp += amount
	while xp >= xp_for_next_level():
		xp -= xp_for_next_level()
		level += 1
		SignalBus.level_up.emit(level)

func xp_for_next_level() -> int:
	if level < LEVEL_XP_CURVE.size():
		return LEVEL_XP_CURVE[level]
	return int(LEVEL_XP_CURVE[-1] * pow(1.12, level - LEVEL_XP_CURVE.size() + 1))

func _process(delta: float) -> void:
	elapsed_time += delta
