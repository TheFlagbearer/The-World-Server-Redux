/obj/item/weapon/melee/cursedblade
	name = "crystal blade"
	desc = "The red crystal blade's polished surface glints in the light, giving off a faint glow."
	icon_state = "soulblade"
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	slot_flags = SLOT_BELT | SLOT_BACK
	force = 25
	throwforce = 10
	w_class = ITEMSIZE_LARGE
	sharp = 1
	edge = 1
	can_speak = 1
	attack_verb = list("sliced", "slashed", "cut", "pierced", "diced", "torn")
	hitsound = 'sound/weapons/bladeslice.ogg'
	unacidable = TRUE
	origin_tech = list(TECH_ARCANE = 5, TECH_COMBAT = 5, TECH_MATERIAL = 7, TECH_BLUESPACE = 4) //shapeshifting redspace sword
	var/current_form = "longsword"
	var/maturity = 0 //The power of the blade. Increases when fed with souls.
	unique_save_vars = list("maturity")
	var/list/voice_mobs = list() //The curse of the sword is that it has someone trapped inside.
	var/searching = FALSE //Spam prevention for ghosts

/obj/item/weapon/melee/cursedblade/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/device/soulstone))
		var/mob/living/simple_animal/shade/A = locate() in W
		if(!A)
			to_chat(user,"<span class='notice'>\The [W] does nothing to \the [src]</span>")
		else
			maturity += 5
			user.visible_message("<span class='danger'>[user]'s [W] glows menacingly and shatters as [A] is pulled out of \the [W] and into \the [src].</span>", \
			"<span class='danger'>Your [W] glows menacingly and shatters as [A] is pulled out of \the [W] and into \the [src].</span>")
			playsound(user.loc, 'sound/hallucinations/wail.ogg', 50, 1)
			user.drop_item()
			qdel(W)

	if(istype(W, /obj/item/weapon/melee/cursedblade))
		var/obj/item/weapon/melee/cursedblade/CB = W
		if(!CB.voice_mobs)
			to_chat(user,"<span class='notice'>\The [W] does nothing to \the [src]</span>")
		else
			maturity += 15
			user.visible_message("<span class='danger'>[user]'s [W] glows menacingly and shatters as the soul inside is pulled out of [W] and into \the [src].</span>", \
			"<span class='danger'>Your [W] glows menacingly and shatters as the soul inside is pulled out of [W] and into \the [src].</span>")
			playsound(user.loc, 'sound/hallucinations/wail.ogg', 50, 1)
			user.drop_item()
			qdel(W)
			new /obj/item/device/soulstone(get_turf(user))

/obj/item/weapon/melee/cursedblade/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(default_parry_check(user, attacker, damage_source) && prob(50))
		user.visible_message("<span class='danger'>\The [user] parries [attack_text] with \the [src]!</span>")
		playsound(user.loc, 'sound/weapons/punchmiss.ogg', 50, 1)
		return 1
	return 0

/obj/item/weapon/melee/cursedblade/proc/ghost_inhabit(var/mob/candidate)
	if(!isobserver(candidate))
		return
	//Handle moving the ghost into the new shell.
	announce_ghost_joinleave(candidate, 0, "They are occupying a cursed sword now.")
	var/mob/living/voice/new_voice = new /mob/living/voice(src) 	//Make the voice mob the ghost is going to be.
	new_voice.transfer_identity(candidate) 	//Now make the voice mob load from the ghost's active character in preferences.
	new_voice.mind = candidate.mind			//Transfer the mind, if any.
	new_voice.ckey = candidate.ckey			//Finally, bring the client over.
	new_voice.name = "cursed sword"			//Cursed swords shouldn't be known characters.
	new_voice.real_name = "cursed sword"
	voice_mobs.Add(new_voice)
	listening_objects |= src

/obj/item/weapon/melee/cursedblade/suicide_act(mob/user)
	var/datum/gender/TU = gender_datums[user.get_visible_gender()]
	user.visible_message("<span class='danger'>[user] is impaling themselves on \the [src]! It looks like [TU.he] [TU.is] trying to commit suicide.</span>")
	return(BRUTELOSS)

/obj/item/weapon/melee/cursedblade/verb/summon_soul()
	set name = "Summon Soul"
	set category = "Soul Blade"
	set desc = "Summon a Primary Soul to the Soul Blade."
	set src in usr

	if(searching)
		return 0
	else
		visible_message("<span class='warning'>\The [name] begins to glow!</span>")
		log_and_message_admins("is activating a cursed blade.")
		searching = TRUE
		var/datum/ghost_query/Q = new /datum/ghost_query/cursedblade
		var/list/winner = Q.query()
		searching = FALSE
		var/mob/observer/dead/D
		if(winner.len)
			D = winner[1]
		to_chat(D, "<span class='notice'>You have been summoned as the Primary Soul of the Soul Blade. Your past is shrouded in mystery and you have no idea how long \
		you have spent trapped within the blade. Caught in the torrent of souls within the blade, your memories have long since melded with the others and you do not \
		even know your own name. You do not remember how you came to meet with this horrible fate, only that you and the legion within the blade serve one master - The \
		Wielder.</span>")
		src.ghost_inhabit(D)
		visible_message("<span class='warning'>The blade shines brightly for a brief moment!</span>")
		log_and_message_admins("summoned a spirit into their soul blade.")
		return 1