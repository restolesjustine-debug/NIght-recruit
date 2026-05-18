extends Node
# Generic object pool placeholder; extended in phase 6.

var pools: Dictionary = {}

func warm_pool(scene: PackedScene, amount: int, parent: Node) -> void:
	if not pools.has(scene.resource_path):
		pools[scene.resource_path] = []
	for i in amount:
		var instance := scene.instantiate()
		instance.visible = false
		instance.set_process(false)
		parent.add_child(instance)
		pools[scene.resource_path].append(instance)
