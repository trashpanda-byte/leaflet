# Design constitution

## Character

Leaflet should feel calm, simple, organic, playful, warm, slightly retro, alive, and personal.

Green is the dominant identity color. The interface should feel like a place for thinking, not an enterprise dashboard or a collection of unrelated productivity apps.

## Interface principles

Prefer:

- progressive disclosure;
- direct manipulation;
- clear hierarchy and generous breathing room;
- spatial relationships that reveal connections;
- a small number of meaningful controls;
- animation that explains state, direction, or life;
- consistent patterns across thoughts, goals, tasks, events, and conversations;
- mobile behavior designed intentionally, not treated as a compressed desktop screen.

Avoid:

- dashboard overload;
- excessive cards, tabs, colors, borders, and permanent controls;
- purple-gradient generic AI/SaaS styling;
- redundant navigation or repeated information;
- animation that delays interaction or exists only as decoration;
- forcing the user to understand the underlying graph or AI architecture.

## Spatial model

Leaflet may visualize a person's world as branches, a graph, or simple planets/topics in a pannable space. The metaphor must clarify relationships, not create visual clutter. Journal, goals, and calendar are views into the same underlying world rather than disconnected mini-apps.

## Leaflet character

The current character direction is:

- stylized retro pixel-art sensibility;
- simple body made from dirtied scrap metal;
- head assembled from one or two visibly different metal pieces, not a noisy collage;
- few bolts and restrained mechanical detail;
- static green retro display face with expressive eyes and mouth;
- a real but stylized living leaf growing from a crack in the forehead/screen;
- leaf movement should suggest gentle life rather than static decoration;
- four-finger hands, including a green thumb;
- expressive without constant or excessive motion.

This direction is authoritative until changed in `docs/DECISIONS.md`.

## Interaction states

Every meaningful interface must consider loading, empty, error, success, offline/retry where relevant, keyboard use, focus state, reduced motion, and narrow mobile layouts.

Accessibility is part of the design, not a final polish pass. Do not rely on color alone; maintain readable contrast, semantic structure, target sizes, and visible focus.

## Design review questions

- Does this reduce effort or add another organizational ritual?
- Is the primary action obvious without explanation?
- Can any element be removed without losing meaning?
- Is the relationship among concepts clearer after the interaction?
- Does Leaflet feel warm and personal rather than corporate?
- Are motion and character behavior purposeful and accessible?
