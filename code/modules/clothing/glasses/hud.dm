/obj/item/clothing/glasses/hud
	name = "HUD"
	desc = "A heads-up display that provides important info in (almost) real time."
	flags = 0 //doesn't protect eyes because it's a monocle, duh
	origin_tech = list(TECH_MAGNET = 3, TECH_BIO = 2)

/obj/item/clothing/glasses/hud/health
	name = "Health Scanner HUD"
	desc = "A heads-up display that scans the humans in view and provides accurate data about their health status."
	icon_state = "healthhud"
	item_state_slots = list(slot_r_hand_str = "headset", slot_l_hand_str = "headset")
	body_parts_covered = 0
	enables_planes = list(VIS_CH_STATUS,VIS_CH_HEALTH)

/obj/item/clothing/glasses/hud/health/prescription
	name = "Prescription Health Scanner HUD"
	desc = "A medical HUD integrated with a set of prescription glasses"
	prescription = 1
	icon_state = "healthhudpresc"
	item_state_slots = list(slot_r_hand_str = "glasses", slot_l_hand_str = "glasses")

/obj/item/clothing/glasses/hud/security
	name = "Security HUD"
	desc = "A heads-up display that scans the humans in view and provides accurate data about their ID status and security records."
	icon_state = "securityhud"
	item_state_slots = list(slot_r_hand_str = "headset", slot_l_hand_str = "headset")
	body_parts_covered = 0
	enables_planes = list(VIS_CH_ID,VIS_CH_WANTED,VIS_CH_IMPTRACK,VIS_CH_IMPLOYAL,VIS_CH_IMPCHEM)

/obj/item/clothing/glasses/hud/security/prescription
	name = "Prescription Security HUD"
	desc = "A security HUD integrated with a set of prescription glasses"
	prescription = 1
	icon_state = "sechudpresc"
	item_state_slots = list(slot_r_hand_str = "glasses", slot_l_hand_str = "glasses")

/obj/item/clothing/glasses/hud/security/jensenshades
	name = "Augmented shades"
	desc = "Polarized bioneural eyewear, designed to augment your vision."
	icon_state = "jensenshades"
	item_state_slots = list(slot_r_hand_str = "sunglasses", slot_l_hand_str = "sunglasses")
	vision_flags = SEE_MOBS
	see_invisible = SEE_INVISIBLE_NOLIGHTING

/obj/item/clothing/glasses/arcane
	name = "arcane resonance goggles"
	desc = "A set of goggles that can detect extradimensional objects and entities."
	icon_state = "arcane"
	off_state = "arcane"
	item_state_slots = list(slot_r_hand_str = "glasses", slot_l_hand_str = "glasses")
	action_button_name = "Toggle Goggles"
	enables_planes = list(VIS_ARCANE)
	origin_tech = list(TECH_MAGNET = 2, TECH_ENGINEERING = 3, TECH_BLUESPACE = 4, TECH_ARCANE = 2)
	toggleable = 1
	price_tag = 15000

/obj/item/clothing/glasses/arcane/New()
	..()
	overlay = global_hud.arcane