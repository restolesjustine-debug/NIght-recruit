extends CanvasLayer

@onready var hp_bar: ProgressBar = %HPBar
@onready var xp_bar: ProgressBar = %XPBar
@onready var level_label: Label = %LevelLabel
@onready var game_over_label: Label = %GameOverLabel

func _ready() -> void:
	SignalBus.player_damaged.connect(_on_player_damaged)
	SignalBus.xp_collected.connect(_refresh_xp)
	SignalBus.level_up.connect(_on_level_up)
	_refresh_xp(0)
	level_label.text = "LV 1"

func _on_player_damaged(current_hp: float, max_hp: float) -> void:
	hp_bar.max_value = max_hp
	hp_bar.value = current_hp

func _refresh_xp(_amount: int) -> void:
	xp_bar.max_value = GameState.xp_for_next_level()
	xp_bar.value = GameState.xp

func _on_level_up(level: int) -> void:
	level_label.text = "LV %d" % level
	_refresh_xp(0)

func show_game_over(level: int, time_alive: float) -> void:
	game_over_label.visible = true
	game_over_label.text = "SYSTEM FAILURE\nLV %d | %.1fs" % [level, time_alive]
