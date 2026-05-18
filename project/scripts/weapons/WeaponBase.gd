class_name WeaponBase
extends Node2D

@export var fire_interval: float = 0.18
@export var base_damage: float = 8.0

var cooldown: float = 0.0
var owner: Node2D

func setup(new_owner: Node2D) -> void:
	owner = new_owner

func _process(delta: float) -> void:
	cooldown -= delta
	if cooldown <= 0.0:
		cooldown = fire_interval
		fire()

func fire() -> void:
	pass
