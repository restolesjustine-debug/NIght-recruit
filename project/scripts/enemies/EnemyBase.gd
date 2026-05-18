extends CharacterBody2D

signal died(enemy: Node)

@export var max_hp: float = 20.0
@export var move_speed: float = 80.0
@export var contact_damage: float = 8.0
@export var xp_drop: int = 1

var hp: float
var target: Node2D

enum AIState { SEEK, ATTACK, STUNNED }
var state: AIState = AIState.SEEK

func _ready() -> void:
	hp = max_hp
	target = GameState.player_ref
	add_to_group("enemies")
	$Hitbox.body_entered.connect(_on_hitbox_body_entered)

func _physics_process(_delta: float) -> void:
	if target == null:
		target = GameState.player_ref
		return
	if state == AIState.SEEK:
		velocity = (target.global_position - global_position).normalized() * move_speed
		move_and_slide()

func take_damage(amount: float) -> void:
	hp -= amount
	SignalBus.spawn_floating_text.emit(str(int(amount)), global_position, Color.RED)
	if hp <= 0:
		die()

func die() -> void:
	died.emit(self)
	SignalBus.enemy_killed.emit(self, GameState.player_ref)
	queue_free()

func _on_hitbox_body_entered(body: Node) -> void:
	if body.has_method("take_damage"):
		body.take_damage(contact_damage)
