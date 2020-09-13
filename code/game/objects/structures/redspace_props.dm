/obj/structure/prop/redspace
	name = "highly advanced machine"
	desc = "You have no idea what this is."
	density = 1
	anchored = 1
	var/interaction_message = null

/obj/structure/prop/redspace/attack_hand(mob/living/user) // Used to tell the player that this isn't useful for anything.
	if(!istype(user))
		return FALSE
	if(!interaction_message)
		return ..()
	else
		to_chat(user, interaction_message)

/obj/structure/prop/redspace/containment_pylon
	name = "enigmatic machine"
	desc = "A towering pylon that hums with a strange energy. A thick, viscous fluid flows through massive cables at its center."
	icon = 'icons/obj/props/redspace_containment_pylon.dmi'
	interaction_message = "<span class='warning'>The machine's humming increases in amplitude after you touch it. It would be wise to leave it alone.</span>"

/obj/structure/prop/redspace/artillery
	name = "esoteric cannon"
	desc = "A machine that looks like a laser gun, only scaled up thousands of times. It looks like it could do some serious damage, should it be fired."
	icon = 'icons/obj/props/redspace_artillery.dmi'
	interaction_message = "<span class='notice'>You think twice before touching the machine.</span>"

/obj/item/device/redspace_key
	name = "mysterious object"
	desc = "What does it do?"
	icon = 'icons/obj/props/redspace_key.dmi'
	icon_state = "key1"
	var/uses = 3
	var/active = 1
	unique_save_vars = list("active", "uses")

/obj/item/device/redspace_key/New()
	if(prob(25))
		active = 0

/obj/item/device/redspace_key/update_icon()
	if(active)
		icon_state = "key1"
	else
		icon_state = "key0"

/obj/structure/prop/redspace/bifrost
	icon = 'icons/obj/props/dna_vault.dmi'
	var/active
	var/obj/machinery/gateway/centeraway/redspace/awaygate = null

/obj/structure/prop/redspace/New()
	..()
	set_light(4, 2, "#00FFFF")

/obj/structure/prop/redspace/bifrost/bifrost_console
	desc = "What appears to be the controls for this great machine."
	icon_state = "vault 1,1"

/obj/structure/prop/redspace/bifrost/bi_frost_console/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/device/redspace_key))
		var/obj/item/device/redspace_key/R = W
		user.visible_message("[user] inserts \the [R] into \the [src].", "You insert \the [R] into \the [src].")
		playsound(src.loc, 'sound/effects/lightning_chargeup.ogg', 50, 1)
		awaygate = locate(/obj/machinery/gateway/centeraway/redspace)
		R.uses -= 1
		src.visible_message("<span class='notice'>The display screens on the machine come to life with strange symbols. Several star maps appear flash on the screen. \
		Out of the multitude of systems on display, you recognize Sol and Vetra. The screen flashes and centers itself on Pollux.</span>")
		awaygate.ready = 1
		new /obj/effect/rift/redspace(src.x, src.y + 7, src.z)

/obj/effect/rift/redspace
	name = "rift"
	desc = "A rift to somewhere."
	icon = 'icons/obj/singularity.dmi'
	icon_state = "singularity_s1"

/obj/effect/rift/redspace/Bumped(atom/A)
	if(isliving(A))
		do_teleport(A, locate(5, 71, 6), 10)
	return