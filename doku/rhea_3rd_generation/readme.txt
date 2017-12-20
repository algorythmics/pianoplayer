Robot Piano Player: Rhea
========================

Rhea was developed with the focus on easy transportation and fast setup. Also new electronics should enable much finer calibration and faster reaction and also working with failures on cheap pianos.

Furthermore Rhea should be a first series for distribution, enabling others to control the piano, not only his creator. Therefore documentation will be enhanced and open source software released.

Developed for better timing resolution for the talking piano pieces and for a first prototype series
of 12 players commissioned in the maschinenhalle performance: http://maschinenhalle.at/

Here some notes


Thoughts: what a composer can expect from rhea
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For the robot piano player series rhea: 
http://algo.mur.at/projects/autoklavierspieler/performances/god_at_aec/fotos

Limits on dynamics
------------------

There are two limits the automaton and the piano, which can be differ from type to 
type.

Automaton limits
................

  - theoretically it can play up to 2048 different dynamics each key, 
    which are mapped to 127 velocity steps during calibration.

  - in practice due limits an inaccuracies of coils, mechanics, etc. 
    these are really realistic (not measured) 

  - most analysis software mapping 127 velocity steps to 15 volume; 
    pppp, ppp, ... etc.


Piano and listening 
...................

 - one key has a dynamic measured ca. 20 dB at most

 - a person can distinguish in steps of 1 dB (optimal conditions: 0,5 dB)

 - one key needs 20 steps, which ca. 6 times less than 127

 - only a resolution of 20 is needed (2048 theoretically possible)

 - The whole piano has 88 keys to gain full dynamics: additional max 38 dB
 
 - realistic one key to all adds 30 dB from one key to all played 

 - the sum of piano dynamics is 50 dB at most

Notes
~~~~~

We do not hear only dynamics, but also changes in timbre of the sound, so we are 
more accurate in hearing it, the 127 steps are a good base to work on.

Each strike sounds different, depending on the state of hammer key and 
vibration of the strings from previous strikes... So don't expect repeatable results in 
timbre on fast passages.

For each piece rhea can be adjusted to be map the values. A common adjustment for MIDI velocities is:

- Vel 1: no sound only key pressed

- Vel 10:  lowest safe velocity possible

- Vel 100: loudest sound

- Vel 127: Loudest sound + timbre distortions


Control
-------

Since the control computer is a Linux computer, every interface it supports can be 
used including Ethernet (IP UDP/TCP), serial, MIDI over interface, files, ... applications 
and can be used to additional play video projection, sounds, soundfiles, etc. The main application 
driving the piano is written in Puredata, so Pd these patches can be used to extend the system.

Most common  use cases are listed here:

Realtime Control
................

- MIDI Notes, also over OSC

- OSC with a free definable syntax (special cases) 
  to play many pianos or additional values over Ethernet UDP or TCP, Serial


Playing from files
..................

- Playing MIDI-Files Midi Standard files should be supported, 
  with using parallel MIDI-Players.

- Playing Text files  with events per line:

  <time to previous event> <note-number> <velocity> [duration optional (ms)]

  velocity and optional duration can be floating point numbers

- Generation from PD-Patches with play control
