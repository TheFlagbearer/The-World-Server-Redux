/obj/effect/rift
	name = "rift"
	desc = "A rift in the fabric of space and time. Where does it lead?"
	icon = 'icons/effects/effects.dmi'
	icon_state = "rift"
	anchored = TRUE
	density = FALSE
	plane = PLANE_ARCANE

/obj/effect/rift/Crossed(var/mob/living/L)
	if(PLANE_ARCANE in L.planes_visible)
		visible_message("<span class='warning'>[L] disappears!</span>")
		playsound(src, 'sound/effects/rift_effect.ogg', 25)
		..()
	else
		..()
