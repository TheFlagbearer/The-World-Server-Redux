/obj/structure/mystery_point
	name = "mystery point"
	desc = "When the stars align and the correct offering is brought, mysterious things happen here."
	invisibility = 100
	icon = 'icons/turf/redspace.dmi'
	icon_state = "mystery"
	anchored = TRUE
	density = FALSE
	var/active = 1
	var/mystery_type = 1

/obj/structure/mystery_point/initialize()
	mystery_type = "[rand(1,10)]"
	. = ..()

/obj/structure/mystery_point/Crossed(var/mob/living/L)
	if(!istype(L, /mob/living/carbon/human)) //Non-humans cannot trigger the mystery points.
		return

	if(!active)
		return

	illuminate(L)
	active = 0
	sleep(45 MINUTES)
	visible_message(span("alien", "Something has changed near you."))
	active = 1
	..()

/obj/structure/mystery_point/proc/illuminate(var/mob/living/carbon/human/A)
	var/mob/living/carbon/human/O = A

	switch(mystery_type)

		if(1) // "Shiver Me Timbers"
			to_chat(A, span("alien", "A strange feeling passes through you."))
			O.emote(pick("shiver"))
			return

		if(2) // "Wizard Eyes" - Code lifted from "code/modules/flufftext/Hallucination.dm"
			var/list/possible_points = list()
			var/image/halbody

			for(var/turf/simulated/floor/F in view(src,world.view))
				possible_points += F

			if(possible_points.len)
				var/turf/simulated/floor/target = pick(possible_points)
				var/list/possible_icon_states = list("forgotten", "shade", "armor", "magicRed", "daemon", "faithless", "robe_red", "wraith",
													 "harvester", "otherthing", "ghost-narsie", "artificer", "behemoth", "viscerator", "bat", "bloodguardian")

				halbody = image('icons/mob/ghost.dmi',target,"[pick(possible_icon_states)]",TURF_LAYER)

				if(A.client)
					A.client.images += halbody
				spawn(rand(50,80)) //Only seen for a brief moment.
					if(A.client)
						A.client.images -= halbody
					halbody = null
			return

		if(3) // "Wizard Ears" - See above.
			var/list/creepyasssounds = list('sound/effects/ghost.ogg', 'sound/effects/ghost2.ogg', 'sound/effects/Heart Beat.ogg', 'sound/effects/screech.ogg',\
											'sound/hallucinations/behind_you1.ogg', 'sound/hallucinations/behind_you2.ogg', 'sound/hallucinations/far_noise.ogg', 'sound/hallucinations/growl1.ogg', 'sound/hallucinations/growl2.ogg',\
											'sound/hallucinations/growl3.ogg', 'sound/hallucinations/im_here1.ogg', 'sound/hallucinations/im_here2.ogg', 'sound/hallucinations/i_see_you1.ogg', 'sound/hallucinations/i_see_you2.ogg',\
											'sound/hallucinations/look_up1.ogg', 'sound/hallucinations/look_up2.ogg', 'sound/hallucinations/over_here1.ogg', 'sound/hallucinations/over_here2.ogg', 'sound/hallucinations/over_here3.ogg',\
											'sound/hallucinations/turn_around1.ogg', 'sound/hallucinations/turn_around2.ogg', 'sound/hallucinations/veryfar_noise.ogg', 'sound/hallucinations/wail.ogg')

			A << pick(creepyasssounds) // Gets the job done.

			return

		if(4) // "Pretty Pictures"
			var/list/possible_manifestations = list("red_static", "red_static_sphere", "drain", "rift", "redsparkles")

			src.visible_message(span("alien", "The air warbles as something appears."), span("alien", "An ominous feeling chills you."))
			playsound(src.loc, 'sound/effects/bamf.ogg', 50, 1)

			var/obj/structure/manifestation/M = new/obj/structure/manifestation(src)
			M.icon_state = "[pick(possible_manifestations)]"

			sleep(rand(600,6000)) // They will persist for 1-10 minutes
			qdel(M)

			return

		if(5) // "Voyeur"

			//Spawn our rift - See "/code/modules/redspace/misc.dm" to see how this works.
			var/obj/structure/rift/looking_glass/L = new /obj/structure/rift/looking_glass(src)
			L.visible_message(span("alien", "A strange tear appears before your very eyes!"), span("alien", "An ominous feeling chills you."))
			playsound(L.loc, 'sound/effects/bamf.ogg', 50, 1)

			return
