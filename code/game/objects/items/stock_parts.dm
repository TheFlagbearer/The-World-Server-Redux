///////////////////////////////////////Stock Parts /////////////////////////////////

/obj/item/weapon/storage/part_replacer
	name = "rapid part exchange device"
	desc = "Special mechanical module made to store, sort, and apply standard machine parts."
	icon_state = "RPED"
	w_class = ITEMSIZE_HUGE
	can_hold = list(/obj/item/weapon/stock_parts)
	storage_slots = 50
	use_to_pickup = 1
	allow_quick_gather = 1
	allow_quick_empty = 1
	collection_mode = 1
	display_contents_with_number = 1
	max_w_class = ITEMSIZE_NORMAL
	max_storage_space = 100

/obj/item/weapon/stock_parts
	name = "stock part"
	desc = "What?"
	gender = PLURAL
	icon = 'icons/obj/stock_parts.dmi'
	w_class = ITEMSIZE_SMALL
	var/rating = 1

/obj/item/weapon/stock_parts/New()
	src.pixel_x = rand(-5.0, 5)
	src.pixel_y = rand(-5.0, 5)
	..()

//Rank 1

/obj/item/weapon/stock_parts/console_screen
	name = "console screen"
	desc = "Used in the construction of computers and other devices with a interactive console."
	icon_state = "screen"
	origin_tech = list(TECH_MATERIAL = 1)
	matter = list("glass" = 200)

/obj/item/weapon/stock_parts/capacitor
	name = "capacitor"
	desc = "A passive electronic component that accumulates and holds electrical energy in an electric field."
	icon_state = "capacitor"
	origin_tech = list(TECH_POWER = 1)
	matter = list("plastic" = 50, "aluminium" = 50)

	var/charge = 0
	var/max_charge = 1000

/obj/item/weapon/stock_parts/capacitor/New()
	. = ..()
	max_charge *= rating

/obj/item/weapon/stock_parts/capacitor/proc/charge(var/amount)
	charge += amount
	if(charge > max_charge)
		charge = max_charge

/obj/item/weapon/stock_parts/capacitor/proc/use(var/amount)
	if(charge)
		charge -= amount
		if(charge < 0)
			charge = 0

/obj/item/weapon/stock_parts/scanning_module
	name = "standard resolution scanning module"
	desc = "A compact component that utilizes the controlled deflection of lasers to scan a target area."
	icon_state = "scan_module"
	origin_tech = list(TECH_MAGNET = 1)
	matter = list("aluminium" = 25, "copper" = 25, "glass" = 20)

/obj/item/weapon/stock_parts/manipulator
	name = "basic manipulator"
	desc = "A tiny component used to precisely move the internal components of certain devices."
	icon_state = "micro_mani"
	origin_tech = list(TECH_MATERIAL = 1, TECH_DATA = 1)
	matter = list("aluminium" = 15, "copper" = 15)

/obj/item/weapon/stock_parts/micro_laser
	name = "standard-wattage micro-laser"
	desc = "A tiny component that outputs a laser."
	icon_state = "micro_laser"
	origin_tech = list(TECH_MAGNET = 1)
	matter = list("aluminium" = 15, "copper" = 5, "glass" = 5)

/obj/item/weapon/stock_parts/matter_bin
	name = "basic matter bin"
	desc = "A container component that holds compressed matter awaiting re-construction."
	icon_state = "matter_bin"
	origin_tech = list(TECH_MATERIAL = 1)
	matter = list("aluminium" = 80)

//Rank 2

/obj/item/weapon/stock_parts/capacitor/adv
	name = "advanced capacitor"
	desc = "A passive electronic component that accumulates and holds electrical energy in an electric field. This one offers more capacitance and temperature performance over basic models."
	icon_state = "capacitor_adv"
	origin_tech = list(TECH_POWER = 3)
	rating = 2
	matter = list("plastic" = 55,"aluminium" = 55)

/obj/item/weapon/stock_parts/scanning_module/high_res
	name = "high-resolution scanning module"
	desc = "A compact component that utilizes the controlled deflection of lasers to scan a target area. This one offers higher resolution over standard models."
	icon_state = "scan_module_adv"
	origin_tech = list(TECH_MAGNET = 3)
	rating = 2
	matter = list("aluminium" = 30, "copper" = 30, "glass" = 30)

/obj/item/weapon/stock_parts/manipulator/super
	name = "super-precise manipulator"
	desc = "A tiny component used to precisely move the internal components of certain devices. This one offers more precision over basic models."
	icon_state = "nano_mani"
	origin_tech = list(TECH_MATERIAL = 3, TECH_DATA = 2)
	rating = 2
	matter = list("aluminium" = 20, "copper" = 20)

/obj/item/weapon/stock_parts/micro_laser/high
	name = "high-wattage micro-laser"
	desc = "A tiny component that outputs a laser. This one offers higher wattage over standard models."
	icon_state = "high_micro_laser"
	origin_tech = list(TECH_MAGNET = 3)
	rating = 2
	matter = list("aluminium" = 20, "copper" = 10, "glass" = 10)

/obj/item/weapon/stock_parts/matter_bin/adv
	name = "advanced matter bin"
	desc = "A container component that holds compressed matter awaiting re-construction. This one offers more capacity over basic models."
	icon_state = "advanced_matter_bin"
	origin_tech = list(TECH_MATERIAL = 3)
	rating = 2
	matter = list("aluminium" = 85)

//Rating 3

/obj/item/weapon/stock_parts/capacitor/super
	name = "super capacitor"
	desc = "A passive electronic component that accumulates and holds electrical energy in an electric field. This one offers superior capacitance, voltage stability, and temperature performance over advanced models."
	icon_state = "capacitor_super"
	origin_tech = list(TECH_POWER = 5, TECH_MATERIAL = 4)
	rating = 3
	matter = list("plastic" = 60,"aluminium" = 60)

/obj/item/weapon/stock_parts/scanning_module/ultra
	name = "ultra-high resolution scanning module"
	desc = "A compact component that utilizes the controlled deflection of lasers to scan a target area. This one offers superior resolution over high-resolution models."
	icon_state = "scan_module_phasic"
	origin_tech = list(TECH_MAGNET = 5)
	rating = 3
	matter = list("aluminium" = 35, "copper" = 35, "glass" = 35)

/obj/item/weapon/stock_parts/manipulator/ultra
	name = "ultra-precise manipulator"
	desc = "A tiny component used to precisely move the internal components of certain devices. This one offers superior precision over super-precise models."
	icon_state = "pico_mani"
	origin_tech = list(TECH_MATERIAL = 5, TECH_DATA = 2)
	rating = 3
	matter = list("aluminium" = 25, "copper" = 25)

/obj/item/weapon/stock_parts/micro_laser/ultra
	name = "ultra-high-wattage micro-laser"
	icon_state = "ultra_high_micro_laser"
	desc = "A tiny component that outputs a laser. This one offers even higher wattage over high-wattage models."
	origin_tech = list(TECH_MAGNET = 5)
	rating = 3
	matter = list("aluminium" = 25, "copper" = 15, "glass" = 15)

/obj/item/weapon/stock_parts/matter_bin/super
	name = "super matter bin"
	desc = "A container component that holds compressed matter awaiting re-construction. This one offers more capacity over advanced models."
	icon_state = "super_matter_bin"
	origin_tech = list(TECH_MATERIAL = 5)
	rating = 3
	matter = list("aluminium" = 90)

//Rating 4
/obj/item/weapon/stock_parts/capacitor/arcane
	name = "arcane capacitor"
	desc = "A passive electronic component that accumulates and holds electrical energy in an electric field. Utilizing concepts found in xenoarchaeological artefacts, this capacitor is unparalleled in its abilities."
	icon_state = "capacitor_arcane"
	origin_tech = list(TECH_POWER = 6, TECH_MATERIAL = 5, TECH_ARCANE = 1)
	rating = 4
	matter = list("plastic" = 60,"aluminium" = 60)

/obj/item/weapon/stock_parts/scanning_module/arcane
	name = "arcane scanning module"
	desc = "A compact component that utilizes the controlled deflection of lasers to scan a target area. Utilizing concepts found in xenoarchaeological artefacts, this scanning module is unparalleled in its abilities."
	icon_state = "scan_module_arcane"
	origin_tech = list(TECH_MAGNET = 6, TECH_ARCANE = 1)
	rating = 4
	matter = list("aluminium" = 35, "copper" = 35, "glass" = 35)

/obj/item/weapon/stock_parts/manipulator/arcane
	name = "arcane manipulator"
	desc = "A tiny component used to precisely move the internal components of certain devices. Utilizing concepts found in xenoarchaeological artefacts, this mamnipulator is unparalleled in its abilities."
	icon_state = "arcane_mani"
	origin_tech = list(TECH_MATERIAL = 6, TECH_DATA = 3, TECH_ARCANE = 1)
	rating = 4
	matter = list("aluminium" = 25, "copper" = 25)

/obj/item/weapon/stock_parts/micro_laser/arcane
	name = "arcane micro-laser"
	icon_state = "arcane_micro_laser"
	desc = "A tiny component that outputs a laser. Utilizing concepts found in xenoarchaeological artefacts, this laser is unparalleled in its abilities."
	origin_tech = list(TECH_MAGNET = 6, TECH_ARCANE = 1)
	rating = 4
	matter = list("aluminium" = 25, "copper" = 15, "glass" = 15)

/obj/item/weapon/stock_parts/matter_bin/arcane
	name = "arcane matter bin"
	desc = "A container component that holds compressed matter awaiting re-construction. Utilizing concepts found in xenoarchaeological artefacts, this matter bin is unparalleled in its abilities."
	icon_state = "arcane_matter_bin"
	origin_tech = list(TECH_MATERIAL = 6, TECH_ARCANE = 1)
	rating = 4
	matter = list("aluminium" = 90)

// Subspace stock parts

/obj/item/weapon/stock_parts/subspace/ansible
	name = "subspace ansible"
	icon_state = "subspace_ansible"
	desc = "A compact module capable of sensing extradimensional activity."
	origin_tech = list(TECH_DATA = 3, TECH_MAGNET = 5 ,TECH_MATERIAL = 4, TECH_BLUESPACE = 2)
	matter = list("aluminium" = 30,"glass" = 10)

/obj/item/weapon/stock_parts/subspace/sub_filter
	name = "hyperwave filter"
	icon_state = "hyperwave_filter"
	desc = "A tiny device capable of filtering and converting super-intense radiowaves."
	origin_tech = list(TECH_DATA = 4, TECH_MAGNET = 2)
	matter = list("aluminium" = 30,"glass" = 10)

/obj/item/weapon/stock_parts/subspace/amplifier
	name = "subspace amplifier"
	icon_state = "subspace_amplifier"
	desc = "A compact micro-machine capable of amplifying weak subspace transmissions."
	origin_tech = list(TECH_DATA = 3, TECH_MAGNET = 4, TECH_MATERIAL = 4, TECH_BLUESPACE = 2)
	matter = list("aluminium" = 30,"glass" = 10)

/obj/item/weapon/stock_parts/subspace/treatment
	name = "subspace treatment disk"
	icon_state = "treatment_disk"
	desc = "A compact micro-machine capable of stretching out hyper-compressed radio waves."
	origin_tech = list(TECH_DATA = 3, TECH_MAGNET = 2, TECH_MATERIAL = 5, TECH_BLUESPACE = 2)
	matter = list("aluminium" = 30,"glass" = 10)

/obj/item/weapon/stock_parts/subspace/analyzer
	name = "subspace wavelength analyzer"
	icon_state = "wavelength_analyzer"
	desc = "A sophisticated analyzer capable of analyzing cryptic subspace wavelengths."
	origin_tech = list(TECH_DATA = 3, TECH_MAGNET = 4, TECH_MATERIAL = 4, TECH_BLUESPACE = 2)
	matter = list("aluminium" = 30,"glass" = 10)

/obj/item/weapon/stock_parts/subspace/crystal
	name = "ansible crystal"
	icon_state = "ansible_crystal"
	desc = "A crystal made from pure glass used to transmit laser databursts to subspace."
	origin_tech = list(TECH_MAGNET = 4, TECH_MATERIAL = 4, TECH_BLUESPACE = 2)
	matter = list("glass" = 50)

/obj/item/weapon/stock_parts/subspace/transmitter
	name = "subspace transmitter"
	icon_state = "subspace_transmitter"
	desc = "A large piece of equipment used to open a window into the subspace dimension."
	origin_tech = list(TECH_MAGNET = 5, TECH_MATERIAL = 5, TECH_BLUESPACE = 3)
	matter = list("aluminium" = 50)

/obj/item/weapon/research
	name = "research debugging device"
	desc = "Instant research tool. For testing purposes only."
	icon = 'icons/obj/stock_parts.dmi'
	icon_state = "smes_coil"
	origin_tech = list(TECH_MATERIAL = 19, TECH_ENGINEERING = 19, TECH_PHORON = 19, TECH_POWER = 19, TECH_BLUESPACE = 19, TECH_BIO = 19, TECH_COMBAT = 19, TECH_MAGNET = 19, TECH_DATA = 19, TECH_ILLEGAL = 19, TECH_ARCANE = 19)

// Additional construction stock parts

/obj/item/weapon/stock_parts/gear
	name = "gear"
	desc = "A gear used for construction."
	icon = 'icons/obj/stock_parts.dmi'
	icon_state = "gear"
	origin_tech = list(TECH_ENGINEERING = 1)
	matter = list(DEFAULT_WALL_MATERIAL = 50)

/obj/item/weapon/stock_parts/motor
	name = "motor"
	desc = "A motor used for construction."
	icon = 'icons/obj/stock_parts.dmi'
	icon_state = "motor"
	origin_tech = list(TECH_ENGINEERING = 1)
	matter = list(DEFAULT_WALL_MATERIAL = 60, "glass" = 10)

/obj/item/weapon/stock_parts/spring
	name = "spring"
	desc = "A spring used for construction."
	icon = 'icons/obj/stock_parts.dmi'
	icon_state = "spring"
	origin_tech = list(TECH_ENGINEERING = 1)
	matter = list(DEFAULT_WALL_MATERIAL = 40)
