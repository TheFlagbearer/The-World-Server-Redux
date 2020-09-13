/obj/structure/noticeboard
	name = "notice board"
	desc = "A board for pinning important notices upon."
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "nboard00"
	density = 0
	anchored = 1
	var/list/notices
	var/base_icon_state = "nboard0"
	var/const/max_notices = 35

/obj/structure/noticeboard/get_saveable_contents()
	return notices

/obj/structure/noticeboard/on_persistence_load()
	notices = contents
	update_icon()
	return TRUE


/obj/structure/noticeboard/initialize()
	. = ..()

	// Grab any mapped notices.
	notices = list()
	for(var/obj/item/weapon/paper/note in get_turf(src))
		note.forceMove(src)
		LAZYADD(notices, note)
		if(LAZYLEN(notices) >= max_notices)
			break

	// Automatically place noticeboards that aren't mapped to specific positions.
	if(pixel_x == 0 && pixel_y == 0)

		var/turf/here = get_turf(src)
		var/placing = 0
		for(var/checkdir in GLOB.cardinal)
			var/turf/T = get_step(here, checkdir)
			if(T.density)
				placing = checkdir
				break
			for(var/thing in T)
				var/atom/A = thing
				if(A.simulated && !A.CanPass(src, T))
					placing = checkdir
					break

		switch(placing)
			if(NORTH)
				pixel_x = 0
				pixel_y = 30
			if(SOUTH)
				pixel_x = 0
				pixel_y = -30
			if(EAST)
				pixel_x = 30
				pixel_y = 0
			if(WEST)
				pixel_x = -30
				pixel_y = 0

	update_icon()

/obj/structure/noticeboard/proc/add_paper(var/atom/movable/paper, var/skip_icon_update)
	if(istype(paper))
		LAZYDISTINCTADD(notices, paper)
		paper.forceMove(src)
		if(!skip_icon_update)
			update_icon()

/obj/structure/noticeboard/proc/remove_paper(var/atom/movable/paper, var/skip_icon_update)
	if(istype(paper) && paper.loc == src)
		paper.dropInto(loc)
		LAZYREMOVE(notices, paper)
		SSpersistence.forget_value(paper, /datum/persistent/paper)
		if(!skip_icon_update)
			update_icon()

/obj/structure/noticeboard/dismantle()
	for(var/thing in notices)
		remove_paper(thing, skip_icon_update = TRUE)
	new /obj/item/stack/material(get_turf(src), 10, MATERIAL_WOOD)
	qdel(src)

/obj/structure/noticeboard/Destroy()
	QDEL_NULL_LIST(notices)
	. = ..()

/obj/structure/noticeboard/ex_act(var/severity)
	dismantle()

/obj/structure/noticeboard/update_icon()
	if(LAZYLEN(notices) >= 5)
		icon_state = "[base_icon_state]5"
	else
		icon_state = "[base_icon_state][LAZYLEN(notices)]"

/obj/structure/noticeboard/attackby(var/obj/item/weapon/thing, var/mob/user)
	if(thing.is_screwdriver())
		var/choice = input("Which direction do you wish to place the noticeboard?", "Noticeboard Offset") as null|anything in list("North", "South", "East", "West")
		if(choice && Adjacent(user) && thing.loc == user && !user.incapacitated())
			playsound(loc, 'sound/items/Screwdriver.ogg', 50, 1)
			switch(choice)
				if("North")
					pixel_x = 0
					pixel_y = 32
				if("South")
					pixel_x = 0
					pixel_y = -32
				if("East")
					pixel_x = 32
					pixel_y = 0
				if("West")
					pixel_x = -32
					pixel_y = 0
		return
	else if(thing.is_wrench())
		visible_message(SPAN_WARNING("\The [user] begins dismantling \the [src]."))
		playsound(loc, 'sound/items/Ratchet.ogg', 50, 1)
		if(do_after(user, 50, src))
			visible_message(SPAN_DANGER("\The [user] has dismantled \the [src]!"))
			dismantle()
		return
	else if(istype(thing, /obj/item/weapon/paper) || istype(thing, /obj/item/weapon/photo) || istype(thing, /obj/item/weapon/paper_bundle) )
		if(jobban_isbanned(user, "Graffiti"))
			to_chat(user, SPAN_WARNING("You are banned from leaving persistent information across rounds."))
		else
			if(LAZYLEN(notices) < max_notices && user.unEquip(thing, src))
				add_fingerprint(user)
				add_paper(thing)
				to_chat(user, SPAN_NOTICE("You pin \the [thing] to \the [src]."))
				SSpersistence.track_value(thing, /datum/persistent/paper)
			else
				to_chat(user, SPAN_WARNING("You hesitate, certain \the [thing] will not be seen among the many others already attached to \the [src]."))
		return
	..()

/obj/structure/noticeboard/attack_ai(var/mob/user)
	usr << "<span class = 'notice'>You are too far from \the [src] to examine it.</span>"

/obj/structure/noticeboard/attack_hand(var/mob/user)
	examine(user)

/obj/structure/noticeboard/examine(var/mob/user)
	. = ..()
	if(.)
		var/list/dat = list("<table>")
		for(var/thing in notices)
			LAZYADD(dat, "<tr><td>[thing]</td><td>")
			if(istype(thing, /obj/item/weapon/paper))
				LAZYADD(dat, "<a href='?src=\ref[src];read=\ref[thing]'>Read</a><a href='?src=\ref[src];write=\ref[thing]'>Write</a>")
			else if(istype(thing, /obj/item/weapon/photo))
				LAZYADD(dat, "<a href='?src=\ref[src];look=\ref[thing]'>Look</a>")
			LAZYADD(dat, "<a href='?src=\ref[src];remove=\ref[thing]'>Remove</a></td></tr>")
		var/datum/browser/popup = new(user, "noticeboard-\ref[src]", "Noticeboard")
		popup.set_content(jointext(dat, null))
		popup.open()

/obj/structure/noticeboard/OnTopic(var/mob/user, var/list/href_list)

	if(href_list["read"])
		var/obj/item/weapon/paper/P = locate(href_list["read"])
		if(P && P.loc == src)
			P.show_content(user)
		. = TOPIC_HANDLED

	if(href_list["look"])
		var/obj/item/weapon/photo/P = locate(href_list["look"])
		if(P && P.loc == src)
			P.show(user)
		. = TOPIC_HANDLED

	if(href_list["remove"])
		if(usr.IsAntiGrief())
			to_chat(user, "<span class='notice'>You don't want to remove this paper.</span>")
			return
		remove_paper(locate(href_list["remove"]))
		add_fingerprint(user)
		. = TOPIC_REFRESH

	if(href_list["write"])
		var/obj/item/P = locate(href_list["write"])
		if(!P)
			return
		var/obj/item/weapon/pen/pen = user.r_hand
		if(!istype(pen))
			pen = user.l_hand
		if(istype(pen))
			add_fingerprint(user)
			P.attackby(pen, user)
		else
			to_chat(user, SPAN_WARNING("You need a pen to write on \the [P]."))
		. = TOPIC_REFRESH

	if(. == TOPIC_REFRESH)
		interact(user)

/obj/structure/noticeboard/anomaly
	notices = 5
	icon_state = "nboard05"

/obj/structure/noticeboard/anomaly/New()
	var/obj/item/weapon/paper/P = new()
	P.name = "Memo RE: proper analysis procedure"
	P.info = "<br>We keep test dummies in pens here for a reason, so standard procedure should be to activate newfound alien artifacts and place the two in close proximity. Promising items I might even approve monkey testing on."
	P.stamped = list(/obj/item/weapon/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	src.contents += P

	P = new()
	P.name = "Memo RE: materials gathering"
	P.info = "Corasang,<br>the hands-on approach to gathering our samples may very well be slow at times, but it's safer than allowing the blundering miners to roll willy-nilly over our dig sites in their mechs, destroying everything in the process. And don't forget the escavation tools on your way out there!<br>- R.W"
	P.stamped = list(/obj/item/weapon/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	src.contents += P

	P = new()
	P.name = "Memo RE: ethical quandaries"
	P.info = "Darion-<br><br>I don't care what his rank is, our business is that of science and knowledge - questions of moral application do not come into this. Sure, so there are those who would employ the energy-wave particles my modified device has managed to abscond for their own personal gain, but I can hardly see the practical benefits of some of these artifacts our benefactors left behind. Ward--"
	P.stamped = list(/obj/item/weapon/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	src.contents += P

	P = new()
	P.name = "READ ME! Before you people destroy any more samples"
	P.info = "how many times do i have to tell you people, these xeno-arch samples are del-i-cate, and should be handled so! careful application of a focussed, concentrated heat or some corrosive liquids should clear away the extraneous carbon matter, while application of an energy beam will most decidedly destroy it entirely - like someone did to the chemical dispenser! W, <b>the one who signs your paychecks</b>"
	P.stamped = list(/obj/item/weapon/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	src.contents += P

	P = new()
	P.name = "Reminder regarding the anomalous material suits"
	P.info = "Do you people think the anomaly suits are cheap to come by? I'm about a hair trigger away from instituting a log book for the damn things. Only wear them if you're going out for a dig, and for god's sake don't go tramping around in them unless you're field testing something, R"
	P.stamped = list(/obj/item/weapon/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	src.contents += P

/obj/structure/noticeboard/courier
	notices = 6
	icon_state = "nboard05"

/obj/structure/noticeboard/courier/New()
	var/obj/item/weapon/paper/P = new()
	P.name = "Affirming Note"
	P.info = "Mount Aquilo sure is a sight to see when the weather's good. If life can spring up here, there's nothing that can stop us! Keep on keeping on, Courier!<br> - Sam"
	src.contents += P

	P = new()
	P.name = "RE: powary herd"
	P.info = "I've been tracking a huge herd of powaries heading this way. If you can pick some off, I'm sure Kant would appreciate the extra rations. The attendant looked pretty thin last month.<br>- M.M"
	src.contents += P

	P = new()
	P.name = "WARNING: Bandits!"
	P.info = "My power sled got stopped by some idiots 3 km north of here! Watch your backs and make sure you DON'T LOSE your courier keycards!<br>- Abby"
	src.contents += P

	P = new()
	P.name = "Glace Gria Gumbo Recipe"
	P.info = "Ingredients<br>4 tbsp butter, 1/4 cup flour, 1 small purple onion, 1 bell pepper, chopped, 3-4 sliced frostshrooms (get the big ones!), 2 cloves minced garlic, 4 c. diyaab broth, black pepper, \
	salt, bay leaf, 12 oz. powary meat. Melt your butter and add the flour. Stir it for about ten minutes. Make sure your rocket stove's set to around medium heat. Add the vegetables, then add in your meats. \
	Then the broth and drop the heat to low. Keeps you warm and I'll be damned if it don't taste good! Keep on keeping on!<br> - Maxwell"
	src.contents += P

	P = new()
	P.name = "The caves"
	P.info = "If anyone's in the area, I found a hatch near that discoupled engine south east of here. I couldn't get it open but if you've got the time to investigate, I thought I'd let you know.<br> - Morgan"
	src.contents += P

	P = new()
	P.name = "Feros pet?"
	P.info = "Anyone ever been successful at taming a feros? The last one I came across didn't attack but the moment I looked away the little bastard pounced on me! I'd love to bring one by Firehaven \
	for the kids to see. Let me know. I'll be back here next month.<br> - Roget"
	src.contents += P