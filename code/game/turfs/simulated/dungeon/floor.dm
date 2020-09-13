// Special floor type for Point of Interests.

/turf/simulated/floor/dungeon
	name = "old flooring"
	desc = "Dank, decrepit stone floors... Eerie."
	icon = 'icons/turf/flooring/dungeon.dmi'
	icon_state = "blue"
	block_tele = TRUE // Anti-cheese.

/turf/simulated/floor/dungeon/grate
	name = "rusty grate"
	desc = "There's nothing but pitch black beyond the bars."
	icon_state = "grate"

/turf/simulated/floor/dungeon/grate/full
	desc = "Old stagnant water is pooled beneath the grate."
	icon_state = "grate_full"

/turf/simulated/floor/dungeon/stairs
	name = "old stairs"
	desc = "These look stable enough to walk on."
	icon_state = "stairs"

/turf/simulated/floor/dungeon/ex_act()
	return