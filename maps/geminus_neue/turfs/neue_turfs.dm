// Sif Planetside stuff
#define O2POLLUX 0.181
#define N2POLLUX 0.819

#define MOLES_CELLPOLLUX 114.50978

#define MOLES_O2POLLUX (MOLES_CELLPOLLUX * O2POLLUX) // O2 value on Sif(18%)
#define MOLES_N2POLLUX (MOLES_CELLPOLLUX * N2POLLUX) // N2 value on Sif(82%)

#define TEMPERATURE_POLLUX 293
#define TEMPERATURE_ALTPOLLUX 190.15

/turf/simulated/floor/outdoors/mud/pollux/planetuse
	oxygen		= MOLES_O2POLLUX
	nitrogen	= MOLES_N2POLLUX
	temperature	= TEMPERATURE_POLLUX

/turf/simulated/floor/outdoors/rocks/pollux/planetuse
	oxygen		= MOLES_O2POLLUX
	nitrogen	= MOLES_N2POLLUX
	temperature	= TEMPERATURE_POLLUX

/turf/simulated/floor/tiled/pollux/planetuse
	oxygen		= MOLES_O2POLLUX
	nitrogen	= MOLES_N2POLLUX
	temperature	= TEMPERATURE_POLLUX
	outdoors = TRUE

/turf/simulated/floor/tiled/steel/pollux/planetuse
	oxygen		= MOLES_O2POLLUX
	nitrogen	= MOLES_N2POLLUX
	temperature	= TEMPERATURE_POLLUX
	outdoors = TRUE

/turf/simulated/floor/plating/pollux/planetuse
	oxygen		= MOLES_O2POLLUX
	nitrogen	= MOLES_N2POLLUX
	temperature	= TEMPERATURE_POLLUX
	outdoors = TRUE

/turf/simulated/floor/outdoors/snow/pollux/planetuse
	oxygen		= MOLES_O2POLLUX
	nitrogen	= MOLES_N2POLLUX
	temperature	= TEMPERATURE_POLLUX

/turf/simulated/floor/outdoors/grass/pollux/planetuse
	oxygen		= MOLES_O2POLLUX
	nitrogen	= MOLES_N2POLLUX
	temperature	= TEMPERATURE_POLLUX

/turf/simulated/floor/outdoors/grass/pollux/forest/planetuse
	oxygen		= MOLES_O2POLLUX
	nitrogen	= MOLES_N2POLLUX
	temperature	= TEMPERATURE_POLLUX

/turf/simulated/floor/outdoors/dirt/pollux/planetuse
	oxygen		= MOLES_O2POLLUX
	nitrogen	= MOLES_N2POLLUX
	temperature	= TEMPERATURE_POLLUX

/turf/simulated/mineral/pollux
	oxygen		= MOLES_O2POLLUX
	nitrogen	= MOLES_N2POLLUX
	temperature	= TEMPERATURE_POLLUX

/turf/simulated/mineral/ignore_mapgen/pollux
	oxygen		= MOLES_O2POLLUX
	nitrogen	= MOLES_N2POLLUX
	temperature	= TEMPERATURE_POLLUX

/turf/simulated/mineral/floor/pollux
	oxygen		= MOLES_O2POLLUX
	nitrogen	= MOLES_N2POLLUX
	temperature	= TEMPERATURE_POLLUX
	outdoors = TRUE
/turf/simulated/mineral/floor/ignore_mapgen/pollux
	oxygen		= MOLES_O2POLLUX
	nitrogen	= MOLES_N2POLLUX
	temperature	= TEMPERATURE_POLLUX

/turf/simulated/floor/outdoors/mud/pollux/planetuse
	oxygen		= MOLES_O2POLLUX
	nitrogen	= MOLES_N2POLLUX
	temperature	= TEMPERATURE_POLLUX

// PoI compatability, to stop active edges.
// In hindsight it would've been better to do this first instead of making a billion /pollux subtypes above,
// but maybe we can transition to this instead now and over time get rid of the /pollux subtypes.
// The downside is if someone wants to use this in normal/vaccum they'll need to make a new subtype, but since the typical use case has changed, this might be acceptable.

/turf/simulated/mineral
	oxygen		= MOLES_O2POLLUX
	nitrogen	= MOLES_N2POLLUX
	temperature	= TEMPERATURE_POLLUX

/turf/simulated/floor/outdoors
	oxygen		= MOLES_O2POLLUX
	nitrogen	= MOLES_N2POLLUX
	temperature	= TEMPERATURE_POLLUX

/turf/simulated/floor/water
	oxygen		= MOLES_O2POLLUX
	nitrogen	= MOLES_N2POLLUX
	temperature	= TEMPERATURE_POLLUX

/turf/simulated/shuttle/floor/alienplating/external
	oxygen		= MOLES_O2POLLUX
	nitrogen	= MOLES_N2POLLUX
	temperature	= TEMPERATURE_POLLUX

/turf/simulated/shuttle/floor/voidcraft/external
	oxygen		= MOLES_O2POLLUX
	nitrogen	= MOLES_N2POLLUX
	temperature	= TEMPERATURE_POLLUX

/turf/simulated/shuttle/floor/voidcraft/external/dark
	oxygen		= MOLES_O2POLLUX
	nitrogen	= MOLES_N2POLLUX
	temperature	= TEMPERATURE_POLLUX

/turf/simulated/shuttle/floor/voidcraft/external/light
	oxygen		= MOLES_O2POLLUX
	nitrogen	= MOLES_N2POLLUX
	temperature	= TEMPERATURE_POLLUX

/turf/simulated/floor/plating/external
	oxygen		= MOLES_O2POLLUX
	nitrogen	= MOLES_N2POLLUX
	temperature	= TEMPERATURE_POLLUX

/turf/simulated/floor/tiled/external
	oxygen		= MOLES_O2POLLUX
	nitrogen	= MOLES_N2POLLUX
	temperature	= TEMPERATURE_POLLUX

/turf/simulated/sky
	oxygen		= MOLES_O2POLLUX
	nitrogen	= MOLES_N2POLLUX
	temperature	= TEMPERATURE_ALTPOLLUX

// Space mineral tiles are now not the default, so they get demoted to subtype status.

/turf/simulated/mineral/vacuum
	oxygen = 0
	nitrogen = 0
	temperature = TCMB

/turf/simulated/mineral/ignore_mapgen/vacuum
	oxygen = 0
	nitrogen = 0
	temperature = TCMB

/turf/simulated/mineral/floor/vacuum
	oxygen = 0
	nitrogen = 0
	temperature = TCMB

/turf/simulated/mineral/floor/ignore_mapgen/vacuum
	oxygen = 0
	nitrogen = 0
	temperature = TCMB

// Step trigger to fall down to planet Pollux
/obj/effect/step_trigger/teleporter/planetary_fall/pollux/initialize()
	planet = planet_pollux
	. = ..()

/turf/simulated/floor/redspace
	name = "rocky ground"
	icon = 'icons/turf/redspace.dmi'
	icon_state = "basalt0"
	oxygen = MOLES_O2POLLUX
	nitrogen = MOLES_N2POLLUX
	temperature = 430
	initial_flooring = /decl/flooring/redspace

/turf/simulated/floor/redspace/rocky
	desc = "Nothing but rocks and more rocks for miles..."

/turf/simulated/floor/redspace/rocky/initialize()
	icon_state = "basalt[rand(1,13)]"
	if(icon_state == "basalt13")
		set_light(2, 4, "#FC9B54")
		density = 1
	.=..()

/turf/simulated/floor/redspace/lava
	name = "Lava"
	desc = "The floor is lava!"
	icon_state = "lava"
	movement_cost = 4
	density = 1
	initial_flooring = /decl/flooring/redspace/lava

/turf/simulated/floor/redspace/lava/initialize()
	set_light(2, 4, "#FC9B54")

/turf/simulated/floor/redspace/grass
	name = "alien grass"
	desc = "The grass moves on its own, even when the wind has stopped."
	icon_state = "grass2"
	initial_flooring = /decl/flooring/redspace/grass