/*
//////////////////////////////////////
Vitiligo

	Hidden.
	No change to resistance.
	Increases stage speed.
	Slightly increases transmittability.
	Critical Level.

BONUS
	Makes the mob lose skin pigmentation.

//////////////////////////////////////
*/

/datum/symptom/vitiligo

	name = "Vitiligo"
	desc = "The virus destroys skin pigment cells, causing rapid loss of pigmentation in the host."
	stealth = 2
	resistance = 0
	stage_speed = 3
	transmittable = 1
	level = 5
	severity = 1
	symptom_delay_min = 25
	symptom_delay_max = 75

/datum/symptom/vitiligo/Activate(datum/disease/advance/A)
	. = ..()
	if(!.)
		return
	var/mob/living/M = A.affected_mob
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.skin_tone == "albino")
			return
		switch(A.stage)
			if(5)
				H.skin_tone = "albino"
				H.update_body(0)
			else
				H.visible_message("<span class='warning'>[H] looks a bit pale...</span>", "<span class='notice'>Your skin suddenly appears lighter...</span>")


/*
//////////////////////////////////////
Revitiligo

	Slightly noticable.
	Increases resistance.
	Increases stage speed slightly.
	Increases transmission.
	Critical Level.

BONUS
	Makes the mob gain skin pigmentation.

//////////////////////////////////////
*/

/datum/symptom/revitiligo

	name = "Revitiligo"
	desc = "The virus causes increased production of skin pigment cells, making the host's skin grow darker over time."
	stealth = -1
	resistance = 3
	stage_speed = 1
	transmittable = 2
	level = 5
	severity = 1
	symptom_delay_min = 7
	symptom_delay_max = 14

/datum/symptom/revitiligo/Activate(datum/disease/advance/A)
	. = ..()
	if(!.)
		return
	var/mob/living/M = A.affected_mob
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.skin_tone == "african2")
			return
		switch(A.stage)
			if(5)
				H.skin_tone = "african2"
				H.update_body(0)
			else
				H.visible_message("<span class='warning'>[H] looks a bit dark...</span>", "<span class='notice'>Your skin suddenly appears darker...</span>")

/datum/symptom/polyvitiligo //tgport
	name = "Polyvitiligo"
	desc = "The virus replaces the melanin in the skin with reactive pigment."
	stealth = -1
	resistance = 3
	stage_speed = 1
	transmittable = 2
	level = 5
	severity = 1
	symptom_delay_min = 7
	symptom_delay_max = 14

/datum/symptom/polyvitiligo/Activate(datum/disease/advance/A)
	. = ..()
	if(!.)
		return
	var/mob/living/M = A.affected_mob
	switch(A.stage)
		if(5)
			var/static/list/banned_reagents = list(/datum/reagent/colorful_reagent/crayonpowder/invisible, /datum/reagent/colorful_reagent/crayonpowder/white)
			var/color = pick(subtypesof(/datum/reagent/colorful_reagent/crayonpowder) - banned_reagents)
			if(M.reagents.total_volume <= (M.reagents.maximum_volume/10)) // no flooding humans with 1000 units of colorful reagent
				M.reagents.add_reagent(color, 5)
		else
			if (prob(50)) // spam
				M.visible_message("<span class='warning'>[M] looks rather vibrant...</span>", "<span class='notice'>The colors, man, the colors...</span>")
