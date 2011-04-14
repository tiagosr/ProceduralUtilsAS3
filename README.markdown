# Procedural Utilities for AS3 #

This is a library of code I'm accumulating to deal with procedural generation of graphics, sound and everything else.
Right now it includes some pseudorandom generators, noise, grammar utilities, a Fast Fourier Transform and a FM synthesizer.

### Pseudorandom Generators ###

Currently implemented are these generators:

-	Linear Feedback Shift Register
-	Blum Blum Shub
-	Multiply-With-Carry
-	Complimentary Multiply-With-Carry
-	Wichmann-Hill

Some of those return 32-bit integers, while others (like Wichmann-Hill) return floating-point Number values from 0.0 to 1.0.

### FM Synthesizer ###

The FM synthesizer is a 32-channel (configured via FMSynthesizer.as) 8-operator (configurable via FMChannel.as) modular Phase Modulation synthesizer, modeled after features of Yamaha FM synthesis chips like OPL3 and keyboards like DX7 and SY99.