/obj/effect/rift
	name = "rift"
	desc = "A rift in the fabric of space and time. Where does it lead?"
	invisibility = 60
	icon = 'icons/effects/effects.dmi'
	icon_state = "rift"
	anchored = TRUE
	density = FALSE

/obj/effect/rift/Crossed(var/mob/living/L)
	if(L.see_invisible != SEE_INVISIBLE_CULT)
		return
	else
		visible_message("<span class='warning'>[L] disappears!</span>")
		playsound(src, 'sound/effects/rift_effect.ogg', 25)
		L.on_mob_jump()
		L.loc = pick(get_area_turfs(/area/redspace/caves))
		..()