# Inspiration
Our idea was simple: capture the feel of Baldur's Gate 3 in VR. We took the story of Descent into Avernus, the D&D adventure that sets up BG3, and rebuilt its opening as an immersive VR experience: rolling the d20, picking a weapon up off the ground, and looking up at a hell-sky with your own eyes.

# What it does

A fully immersive story-based D&D game running on PICO OS 6 (works on the Pico emulator too). You wake up in Elturel right after the entire city gets dragged into Avernus, the first layer of the Nine Hells; the artificial sun that protected the city for 50 years is now a black orb spitting lightning and spawning devils. You learn to survive, grab a rapier, fight devils, convince Duke Ravenguard to escape with you, and find a wizard casting Plane Shift to get out.

It plays like tabletop D&D: skill checks are a d20 floating in front of you that you smack to roll. Combat (COMING SOON) will be two layers: a top-down battle table where you grab your character's figure and place it to move, then you drop into first person to pick your action. Dialogue is classic text-based with choices that actually branch.

# How we built it

Unity with the Pico Unity SDK and XR Interaction Toolkit, tested on the Pico emulator through Android Studio. We started from one base Pico scene with all the fundamental VR functionality, and each of us copied it to build our mechanic in isolation: dialogue, dice, interactions, merging each one into the main game once it was solid, with visual passes over the combined build. Every line of dialogue is handwritten and displayed through our own typewriter-style text system, and the world is dressed with low-poly asset packs (GanzSe modular characters, NecroPOLY, Stylized Fantasy Armory) plus Mixamo animations for the panicking villagers.
