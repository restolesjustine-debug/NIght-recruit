extends Area2D

@export var amount: int = 1
@export var magnet_speed: float = 280.0
var target: Node2D

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _process(delta: float) -> void:
	if GameState.player_ref == null:
		return
	var dist := global_position.distance_to(GameState.player_ref.global_position)
	if dist < 130.0:
		target = GameState.player_ref
	if target:
		global_position = global_position.move_toward(target.global_position, magnet_speed * delta)

func _on_body_entered(body: Node) -> void:
	if body == GameState.player_ref:
		GameState.add_xp(amount)
		SignalBus.xp_collected.emit(amount)
		queue_free()
