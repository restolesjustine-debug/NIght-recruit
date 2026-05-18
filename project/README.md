# NIGHT CIRCUIT (Godot 4 prototype)

## Current state
This branch delivers a polished **Phase 1 playable prototype**:
- WASD movement
- Enemy swarms that scale up over time
- Volt Needle auto-targeting weapon
- XP shards + level ups
- Level-ups automatically buff fire rate and damage
- HUD with HP/XP/level + restart prompt

## Architecture
- `autoload/`: Global runtime services (state, save, pooling, events, audio).
- `scripts/`: Gameplay logic split by domain.
- `scenes/`: Playable scene graph and reusable prefabs.
- `data/`: Data-driven content stubs (characters, upgrades, weapons, biomes).

## Run instructions
1. Install **Godot 4.2+**.
2. Open Godot Project Manager.
3. Click **Import**.
4. Select `project/project.godot` from this repo.
5. Open the project and press **F5** (Run Project).
6. Survive as long as possible, collect XP crystals, and scale your DPS.

## Controls
- `WASD`: Move
- `Enter`: Restart after death

## Dev roadmap
1. **Phase 1 (implemented):** core loop, player, enemies, XP, starter weapon, HUD.
2. **Phase 2:** combat juice, impacts, shake camera, floating numbers pooling.
3. **Phase 3:** upgrade cards, evolution tree, fusion resolver.
4. **Phase 4:** procedural biome generator + hazards/events.
5. **Phase 5:** bosses, game modes, unlock meta progression.
6. **Phase 6:** optimization pass for 500+ enemies with aggressive pooling and LOD AI.
