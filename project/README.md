# NIGHT CIRCUIT (Godot 4 prototype)

## Architecture
- `autoload/`: Global runtime services (state, save, pooling, events, audio).
- `scripts/`: Gameplay logic split by domain.
- `scenes/`: Playable scene graph and reusable prefabs.
- `data/`: Data-driven content stubs (characters, upgrades, weapons, biomes).

## Development Phases
1. **Phase 1 (implemented):** core loop, player, enemies, XP, starter weapon, HUD.
2. **Phase 2:** combat juice, impacts, shake camera, floating numbers pooling.
3. **Phase 3:** upgrade cards, evolution tree, fusion resolver.
4. **Phase 4:** procedural biome generator + hazards/events.
5. **Phase 5:** bosses, game modes, unlock meta progression.
6. **Phase 6:** optimization pass for 500+ enemies with aggressive pooling and LOD AI.
