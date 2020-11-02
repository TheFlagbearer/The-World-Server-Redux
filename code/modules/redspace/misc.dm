///////////// Miscellaneous stuff that doesn't really have a home in any other code file. /////////////

/*
	Manifestations belond to attunement_points.dm. Their appearance is determined by the mystery point.
*/

/obj/structure/manifestation
	name = "otherwordly manifestation"
	desc = "Very little words exist to describe just what is occuring."
	icon = 'icons/effects/effects.dmi'
	density = FALSE
	opacity = FALSE
	anchored = TRUE

/obj/structure/manifestation/attack_hand(mob/user as mob)
	to_chat(user, span("alien", "You refrain from touching \the [src]. It doesn't seem like a very good idea."))
	return

/* Rifts will get their own file when I decide to bring back Redspace as a map. Watch this space. */
/obj/structure/rift
	name = "rift"
	desc = "What lies beyond...?"
	icon = 'icons/effects/effects.dmi'
	icon_state = "rift"
	anchored = TRUE
	density = FALSE
	opacity = FALSE

/obj/structure/rift/looking_glass
	desc = "You can just barely make out some activity on the other side..."

/obj/structure/rift/looking_glass/attack_hand(mob/user as mob)
	//Initialize our dummy voice here//
	var/mob/living/dummy_voice/voice = new/mob/living/dummy_voice(src)
	voice.name = "Unknown"
	voice.real_name = "Unknown"
	voice.add_language(LANGUAGE_GALCOM)
	voice.set_default_language(all_languages[LANGUAGE_GALCOM])
	voice.invisibility = 100

	//Speech and/or emotes begin here. - Some quotes gracially borrowed from the following: https://www.deviantart.com/metamaster54610/art/Death-Battle-Quotes-Doomguy-352507078
	var/list/possible_lines = list("Rip... and... tear!", "...guts, huge guts!", "Kill them... must kill them all!", "!grunts, as if exerting themselves.",
								   "Ass-kickin' time!", "Tear 'em up!", "Tch. Nothin' I haven't seen.", "More of you hell-freaks...",
								   "You have claws. I have guns and rockets. Do the math, hot stuff.", "How many bullets do I have to pump you with before you die?!",
								   "Evil sword, eh?", "Oh holy father, I'll blow you to pieces!", "Time to chew ass and kick bubblegum...", "Your cluster goes down next!",
								   "!lets out a primal roar!", "!grabs the creature by the neck and slams it into the ground!", "!slams their head into the creature's face!",
								   "!reloads their fuel-rod cannon.", "!slides their cryptographic sequencer across the airlock door.", "End of the line, Captain!",
								   "AI, state your laws.", "Pete - please, don't set it off.", "Call the shuttle!", "There's a possibility o- Who's that?", "Stop looking at me, freak.",
								   "Can we even say that? Is that copyrighted?", "!sighs and jumps off the ledge. They are immediately pushed back up by some unknown force.", "What the \
								   heck's a gherkin?", "I'm going for a run. Be back home in a little bit.", "Another day, another credit... Start up the engine.", "Jenny, take the shot!",
								   "No, he *doesn't* survive it. Get what I mean?")

	voice.say("[pick(possible_lines)]")

	//Collapse the rift//
	qdel(voice)
	to_chat(user, span("alien", "You just barely manage to step back before \the [src] collapses in on itself and disappears!"))
	playsound(src.loc, 'sound/effects/bamf.ogg', 50, 1)
	qdel(src)

	return