extends CharacterBody2D

@export var stats: PlayerStats
@export var invuln_duration: float = 0.45
@export var starter_weapon_scene: PackedScene
@onready var weapon_mount: Node2D = $WeaponMount

var current_health: float
var invuln_timer: float = 0.0

func _ready() -> void:
	if stats == null:
		stats = PlayerStats.new()
	current_health = stats.max_health
	GameState.player_ref = self
	if starter_weapon_scene:
		var weapon = starter_weapon_scene.instantiate()
		weapon_mount.add_child(weapon)
		weapon.global_position = global_position
		weapon.setup(self)

func _physics_process(_delta: float) -> void:
	var input := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input * stats.move_speed
	move_and_slide()

func _process(delta: float) -> void:
	if invuln_timer > 0.0:
		invuln_timer -= delta

func take_damage(amount: float) -> void:
	if invuln_timer > 0.0:
		return
	if randf() < stats.dodge_chance:
		SignalBus.spawn_floating_text.emit("DODGE", global_position, Color.CYAN)
		return
	current_health = max(0.0, current_health - amount)
	invuln_timer = invuln_duration
	SignalBus.player_damaged.emit(current_health, stats.max_health)
	SignalBus.screen_shake.emit(2.0, 0.08)
	if current_health <= 0:
		SignalBus.player_died.emit()

func get_crit_multiplier() -> float:
	return stats.crit_multiplier if randf() < stats.crit_chance else 1.0
