extends Node

const SAVE_PATH := "user://night_circuit_save.json"

var persistent_data := {
	"unlocks": {"characters": ["cipher"], "weapons": ["volt_needle"], "biomes": ["neon_graveyard"]},
	"settings": {"master_volume": 0.8, "screenshake": 1.0},
	"high_scores": {},
	"achievements": {}
}

func _ready() -> void:
	load_save()

func load_save() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		save_now()
		return
	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	persistent_data = JSON.parse_string(file.get_as_text())

func save_now() -> void:
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_string(JSON.stringify(persistent_data))
