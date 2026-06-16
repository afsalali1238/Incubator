# Terrarium Planet

**Project Thesis:** For casual strategy players who find deep simulation games overwhelming, *Terrarium Planet* is a god-sim game that limits interactions to simple elemental placements (rain, heat, rock, seed). Unlike traditional 4X or complex sims, it focuses entirely on emergent, observable consequences without tech trees or micromanagement. The riskiest assumption is that simple elemental placements can produce enough emergent complexity to remain engaging after the first hour; we'll test it by prototyping a 2D cellular automata version of the core loop.

**CEO Verdict:** Build. The market is saturated with complex sims, but there is a clear whitespace for a "zen" emergent simulation.

**The wedge:** A 2D grid where placing 'heat' next to 'water' creates 'steam', and placing 'seed' on 'wet dirt' creates 'grass'. Nothing else.

**The scope fence:** We are NOT building combat, civilization tech trees, or resource management. This is a sandbox, not a survival game.

**The org at a glance:**
1. **Systems Designer** — Validate the core elemental interactions and emergent loop.
2. **Engine Specialist** — Choose and setup the lightweight 2D engine (Godot/Phaser).
3. **UX/UI Lead** — Design the minimalist interaction model (drag-and-drop elements).

**Next action:**
Systems Designer must prototype the core elemental matrix (Water, Heat, Earth, Seed) to prove the emergence is fun before any engine code is written.
