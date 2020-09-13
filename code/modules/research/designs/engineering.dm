//////////////////////////////////////////////
//				Engineering Equipment
//////////////////////////////////////////////

/datum/design/item/experimental_welder
	name = "Experimental welding tool"
	desc = "A welding tool that generate fuel for itself."
	id = "expwelder"
	req_tech = list(TECH_ENGINEERING = 4, TECH_PHORON = 3, TECH_MATERIAL = 4)
	materials = list(DEFAULT_WALL_MATERIAL = 70, "glass" = 120, "phoron" = 100, "copper" = 100, "aluminium" = 100)
	build_path = /obj/item/weapon/weldingtool/experimental
	sort_string = "VASCA"

/datum/design/item/hand_drill
	name = "Hand drill"
	desc = "A simple powered hand drill."
	id = "handdrill"
	req_tech = list(TECH_ENGINEERING = 3, TECH_MATERIAL = 2)
	materials = list(DEFAULT_WALL_MATERIAL = 300, "silver" = 100, "aluminium" = 100, "copper" = 100)
	build_path = /obj/item/weapon/screwdriver/power
	sort_string = "VASDA"

/datum/design/item/jaws_life
	name = "Jaws of life"
	desc = "A set of jaws of life, compressed through the magic of science."
	id = "jawslife"
	req_tech = list(TECH_ENGINEERING = 3, TECH_MATERIAL = 2)
	materials = list(DEFAULT_WALL_MATERIAL = 300, "silver" = 100, "copper" = 100, "aluminium" = 100)
	build_path = /obj/item/weapon/crowbar/power
	sort_string = "VASEA"

/datum/design/item/device/t_scanner_upg
	name = "Upgraded T-ray Scanner"
	desc = "An upgraded version of the terahertz-ray emitter and scanner used to detect underfloor objects such as cables and pipes."
	id = "upgradedtscanner"
	req_tech = list(TECH_MAGNET = 3, TECH_ENGINEERING = 4, TECH_MATERIAL = 2)
	materials = list(DEFAULT_WALL_MATERIAL = 500, "phoron" = 150, "copper" = 100)
	build_path = /obj/item/device/t_scanner/upgraded
	sort_string = "VASSA"

/datum/design/item/device/t_scanner_adv
	name = "Advanced T-ray Scanner"
	desc = "An advanced version of the terahertz-ray emitter and scanner used to detect underfloor objects such as cables and pipes."
	id = "advancedtscanner"
	req_tech = list(TECH_MAGNET = 6, TECH_ENGINEERING = 6, TECH_MATERIAL = 6)
	materials = list(DEFAULT_WALL_MATERIAL = 1250, "phoron" = 500, "silver" = 50, "copper" = 250)
	build_path = /obj/item/device/t_scanner/advanced
	sort_string = "VASSB"

///////////////////////////////////
//		Stock Part Designs		//
//////////////////////////////////

/datum/design/item/stock_part
	build_type = PROTOLATHE

/datum/design/item/stock_part/AssembleDesignName()
	..()
	name = "Component design ([item_name])"

/datum/design/item/stock_part/AssembleDesignDesc()
	if(!desc)
		desc = "A stock part used in the construction of various devices."

/datum/design/item/stock_part/basic_capacitor
	id = "basic_capacitor"
	req_tech = list(TECH_POWER = 1)
	materials = list("plastic" = 50, "aluminium" = 50)
	build_path = /obj/item/weapon/stock_parts/capacitor
	sort_string = "CAAAA"

/datum/design/item/stock_part/adv_capacitor
	id = "adv_capacitor"
	req_tech = list(TECH_POWER = 3)
	materials = list("plastic" = 55, "aluminium" = 55, "silver" = 50)
	build_path = /obj/item/weapon/stock_parts/capacitor/adv
	sort_string = "CAAAB"

/datum/design/item/stock_part/super_capacitor
	id = "super_capacitor"
	req_tech = list(TECH_POWER = 5, TECH_MATERIAL = 4)
	materials = list("plastic" = 55, "aluminium" = 55, "gold" = 20)
	build_path = /obj/item/weapon/stock_parts/capacitor/super
	sort_string = "CAAAC"

/datum/design/item/stock_part/arcane_capacitor
	id = "arcane_capacitor"
	req_tech = list(TECH_POWER = 6, TECH_MATERIAL = 5, TECH_ARCANE = 2)
	materials = list("plastic" = 55, "aluminium" = 55, "gold" = 20, "void opal" = 20)
	build_path = /obj/item/weapon/stock_parts/capacitor/arcane
	sort_string = "CAAAD"
	public_design = FALSE

/datum/design/item/stock_part/basic_main
	id = "basic_mani"
	req_tech = list(TECH_MATERIAL = 1, TECH_DATA = 1)
	materials = list("aluminium" = 15, "copper" = 15)
	build_path = /obj/item/weapon/stock_parts/manipulator
	sort_string = "CAABA"

/datum/design/item/stock_part/super_mani
	id = "super_mani"
	req_tech = list(TECH_MATERIAL = 3, TECH_DATA = 2)
	materials = list("aluminium" = 20, "copper" = 10, "silver" = 10)
	build_path = /obj/item/weapon/stock_parts/manipulator/super
	sort_string = "CAABB"

/datum/design/item/stock_part/ultra_mani
	id = "ultra_mani"
	req_tech = list(TECH_MATERIAL = 5, TECH_DATA = 2)
	materials = list("aluminium" = 25, "silver" = 10, "gold" = 10)
	build_path = /obj/item/weapon/stock_parts/manipulator/ultra
	sort_string = "CAABC"

/datum/design/item/stock_part/arcane_mani
	id = "arcane_mani"
	req_tech = list(TECH_MATERIAL = 6, TECH_DATA = 3, TECH_ARCANE = 2)
	materials = list("aluminium" = 25, "silver" = 10, "gold" = 10, "void opal" = 10)
	build_path = /obj/item/weapon/stock_parts/manipulator/arcane
	sort_string = "CAABD"
	public_design = FALSE

/datum/design/item/stock_part/basic_matter_bin
	id = "basic_matter_bin"
	req_tech = list(TECH_MATERIAL = 1)
	materials = list("aluminium" = 30)
	build_path = /obj/item/weapon/stock_parts/matter_bin
	sort_string = "CAACA"

/datum/design/item/stock_part/adv_matter_bin
	id = "adv_matter_bin"
	req_tech = list(TECH_MATERIAL = 3)
	materials = list("aluminium" = 30, "copper" = 10)
	build_path = /obj/item/weapon/stock_parts/matter_bin/adv
	sort_string = "CAACB"

/datum/design/item/stock_part/super_matter_bin
	id = "super_matter_bin"
	req_tech = list(TECH_MATERIAL = 5)
	materials = list("aluminium" = 50, "silver" = 10)
	build_path = /obj/item/weapon/stock_parts/matter_bin/super
	sort_string = "CAACC"

/datum/design/item/stock_part/arcane_matter_bin
	id = "arcane_matter_bin"
	req_tech = list(TECH_MATERIAL = 6, TECH_ARCANE = 2)
	materials = list("aluminium" = 50, "silver" = 10, "void opal" = 10)
	build_path = /obj/item/weapon/stock_parts/matter_bin/arcane
	sort_string = "CAACD"
	public_design = FALSE

/datum/design/item/stock_part/standard_micro_laser
	id = "standard_micro_laser"
	req_tech = list(TECH_MAGNET = 1)
	materials = list("aluminium" = 15, "copper" = 5, "glass" = 5)
	build_path = /obj/item/weapon/stock_parts/micro_laser
	sort_string = "CAADA"

/datum/design/item/stock_part/high_micro_laser
	id = "high_micro_laser"
	req_tech = list(TECH_MAGNET = 3)
	materials = list("aluminium" = 20, "glass" = 10)
	build_path = /obj/item/weapon/stock_parts/micro_laser/high
	sort_string = "CAADB"

/datum/design/item/stock_part/ultra_micro_laser
	id = "ultra_micro_laser"
	req_tech = list(TECH_MAGNET = 5, TECH_MATERIAL = 5)
	materials = list("aluminium" = 25, "glass" = 15, "silver" = 10)
	build_path = /obj/item/weapon/stock_parts/micro_laser/ultra
	sort_string = "CAADC"

/datum/design/item/stock_part/arcane_micro_laser
	id = "arcane_micro_laser"
	req_tech = list(TECH_MAGNET = 6, TECH_MATERIAL = 6, TECH_ARCANE = 2)
	materials = list("aluminium" = 25, "glass" = 15, "silver" = 10, "void opal" = 10)
	build_path = /obj/item/weapon/stock_parts/micro_laser/arcane
	sort_string = "CAADD"
	public_design = FALSE

/datum/design/item/stock_part/standard_scan_mod
	id = "standard_scan_mod"
	req_tech = list(TECH_MAGNET = 1)
	materials = list("aluminium" = 25, "glass" = 25, "copper" = 20)
	build_path = /obj/item/weapon/stock_parts/scanning_module
	sort_string = "CAAEA"

/datum/design/item/stock_part/high_res_scan_mod
	id = "high_res_scan_mod"
	req_tech = list(TECH_MAGNET = 3)
	materials = list("aluminium" = 30, "glass" = 30, "silver" = 10)
	build_path = /obj/item/weapon/stock_parts/scanning_module/high_res
	sort_string = "CAAEB"

/datum/design/item/stock_part/ultra_res_scan_mod
	id = "ultra_res_scan_mod"
	req_tech = list(TECH_MAGNET = 5, TECH_MATERIAL = 3)
	materials = list("aluminium" = 35, "glass" = 35, "gold" = 10)
	build_path = /obj/item/weapon/stock_parts/scanning_module/ultra
	sort_string = "CAAEC"

/datum/design/item/stock_part/arcane_scan_mod
	id = "arcane_scan_mod"
	req_tech = list(TECH_MAGNET = 6, TECH_MATERIAL = 4, TECH_ARCANE = 2)
	materials = list("aluminium" = 35, "glass" = 35, "gold" = 10, "void opal" = 10)
	build_path = /obj/item/weapon/stock_parts/scanning_module/arcane
	sort_string = "CAAED"
	public_design = FALSE

/datum/design/item/stock_part/subspace_ansible
	id = "s-ansible"
	req_tech = list(TECH_DATA = 3, TECH_MAGNET = 4, TECH_MATERIAL = 4, TECH_BLUESPACE = 2)
	materials = list("aluminium" = 80, "silver" = 20)
	build_path = /obj/item/weapon/stock_parts/subspace/ansible
	sort_string = "CAAFA"
	public_design = FALSE

/datum/design/item/stock_part/hyperwave_filter
	id = "s-filter"
	req_tech = list(TECH_DATA = 3, TECH_MAGNET = 3)
	materials = list("aluminium" = 40, "silver" = 10)
	build_path = /obj/item/weapon/stock_parts/subspace/sub_filter
	sort_string = "CAAFB"
	public_design = FALSE

/datum/design/item/stock_part/subspace_amplifier
	id = "s-amplifier"
	req_tech = list(TECH_DATA = 3, TECH_MAGNET = 4, TECH_MATERIAL = 4, TECH_BLUESPACE = 2)
	materials = list("aluminium" = 10, "gold" = 30, "uranium" = 15)
	build_path = /obj/item/weapon/stock_parts/subspace/amplifier
	sort_string = "CAAFC"
	public_design = FALSE

/datum/design/item/stock_part/subspace_treatment
	id = "s-treatment"
	req_tech = list(TECH_DATA = 3, TECH_MAGNET = 2, TECH_MATERIAL = 4, TECH_BLUESPACE = 2)
	materials = list("aluminium" = 10, "silver" = 20)
	build_path = /obj/item/weapon/stock_parts/subspace/treatment
	sort_string = "CAAFD"
	public_design = FALSE

/datum/design/item/stock_part/subspace_analyzer
	id = "s-analyzer"
	req_tech = list(TECH_DATA = 3, TECH_MAGNET = 4, TECH_MATERIAL = 4, TECH_BLUESPACE = 2)
	materials = list("aluminium" = 10, "gold" = 15)
	build_path = /obj/item/weapon/stock_parts/subspace/analyzer
	sort_string = "CAAFE"
	public_design = FALSE

/datum/design/item/stock_part/subspace_crystal
	id = "s-crystal"
	req_tech = list(TECH_MAGNET = 4, TECH_MATERIAL = 4, TECH_BLUESPACE = 2)
	materials = list("glass" = 1000, "silver" = 20, "gold" = 20)
	build_path = /obj/item/weapon/stock_parts/subspace/crystal
	sort_string = "CAAFF"
	public_design = FALSE

/datum/design/item/stock_part/subspace_transmitter
	id = "s-transmitter"
	req_tech = list(TECH_MAGNET = 5, TECH_MATERIAL = 5, TECH_BLUESPACE = 3)
	materials = list("glass" = 100, "silver" = 10, "uranium" = 15)
	build_path = /obj/item/weapon/stock_parts/subspace/transmitter
	sort_string = "CAAFG"
	public_design = FALSE

/datum/design/item/stock_part/RPED
	name = "Rapid Part Exchange Device"
	desc = "Special mechanical module made to store, sort, and apply standard machine parts."
	id = "rped"
	req_tech = list(TECH_ENGINEERING = 3, TECH_MATERIAL = 3)
	materials = list(DEFAULT_WALL_MATERIAL = 10000, "aluminium" = 5000, "glass" = 5000, "copper" = 500)
	build_path = /obj/item/weapon/storage/part_replacer
	sort_string = "CBAAA"

/////////////////////////////////
//			Power Cells			/
/////////////////////////////////

/datum/design/item/powercell
	build_type = PROTOLATHE | MECHFAB

/datum/design/item/powercell/AssembleDesignName()
	name = "Power Cell Model ([item_name])"

/datum/design/item/powercell/AssembleDesignDesc()
	if(build_path)
		var/obj/item/weapon/cell/C = build_path
		desc = "Allows the construction of power cells that can hold [initial(C.maxcharge)] units of energy."

/datum/design/item/powercell/Fabricate()
	var/obj/item/weapon/cell/C = ..()
	C.charge = 0 //shouldn't produce power out of thin air.
	return C

/datum/design/item/powercell/basic
	name = "basic"
	build_type = PROTOLATHE | MECHFAB
	id = "basic_cell"
	req_tech = list(TECH_POWER = 1)
	materials = list(DEFAULT_WALL_MATERIAL = 700, "glass" = 50, "copper" = 200)
	build_path = /obj/item/weapon/cell
	category = "Misc"
	sort_string = "DAAAA"

/datum/design/item/powercell/high
	name = "high-capacity"
	build_type = PROTOLATHE | MECHFAB
	id = "high_cell"
	req_tech = list(TECH_POWER = 2)
	materials = list(DEFAULT_WALL_MATERIAL = 700, "glass" = 60, "copper" = 200)
	build_path = /obj/item/weapon/cell/high
	category = "Misc"
	sort_string = "DAAAB"

/datum/design/item/powercell/super
	name = "super-capacity"
	id = "super_cell"
	req_tech = list(TECH_POWER = 3, TECH_MATERIAL = 2)
	materials = list(DEFAULT_WALL_MATERIAL = 700, "glass" = 70, "copper" = 225, "silver" = 150)
	build_path = /obj/item/weapon/cell/super
	category = "Misc"
	sort_string = "DAAAC"

/datum/design/item/powercell/hyper
	name = "hyper-capacity"
	id = "hyper_cell"
	req_tech = list(TECH_POWER = 5, TECH_MATERIAL = 4)
	materials = list(DEFAULT_WALL_MATERIAL = 400, "gold" = 150, "silver" = 150, "glass" = 70, "copper" = 200)
	build_path = /obj/item/weapon/cell/hyper
	category = "Misc"
	sort_string = "DAAAD"

/datum/design/item/powercell/arcane
	name = "void-core"
	id = "void-core"
	req_tech = list(TECH_POWER = 6, TECH_MATERIAL = 5, TECH_ARCANE = 4)
	materials = list(DEFAULT_WALL_MATERIAL = 500, "gold" = 200, "silver" = 200, "copper" = 200, "void opal" = 200)
	build_path = /obj/item/weapon/cell/arcane
	category = "Misc"
	sort_string = "DAAAE"
	public_design = FALSE

/datum/design/item/powercell/device
	name = "device"
	build_type = PROTOLATHE
	id = "device"
	materials = list(DEFAULT_WALL_MATERIAL = 350, "glass" = 25, "copper" = 100)
	build_path = /obj/item/weapon/cell/device
	category = "Misc"
	sort_string = "DAABA"

/datum/design/item/powercell/weapon
	name = "weapon"
	build_type = PROTOLATHE
	id = "weapon"
	materials = list(DEFAULT_WALL_MATERIAL = 700, "glass" = 50, "copper" = 100)
	build_path = /obj/item/weapon/cell/device/weapon
	category = "Misc"
	sort_string = "DAABB"