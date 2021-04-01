/datum/martial_combo/sleeping_carp/gnashing_teeth
	name = "Gnashing Teeth"
	steps = list(MARTIAL_COMBO_STEP_HARM, MARTIAL_COMBO_STEP_HARM)
	explaination_text = "Every second, concequtive, punch will deal extra damage and you will shout to send fear into your opponents heart"

/datum/martial_combo/sleeping_carp/gnashing_teeth/perform_combo(mob/living/carbon/human/user, mob/living/target, datum/martial_art/MA)
	user.do_attack_animation(target, ATTACK_EFFECT_PUNCH)
	var/atk_verb = pick("precisely kick", "brutally chop", "cleanly hit", "viciously slam")
	target.visible_message("<span class='danger'>[user] [atk_verb]s [target]!</span>",
					"<span class='userdanger'>[user] [atk_verb]s you!</span>")
	playsound(get_turf(target), 'sound/weapons/punch1.ogg', 35, TRUE, -1)
	add_attack_logs(user, target, "Melee attacked with martial-art [src] :  Gnashing Teeth", ATKLOG_ALL)
	target.apply_damage(20, BRUTE)
	if(target.stat)
		user.say(pick("HUAH!", "HYA!", "CHOO!", "WUO!", "KYA!", "HUH!", "HIYOH!", "CARP STRIKE!", "CARP BITE!"))
	else
		user.say(pick("BANZAIII!", "KIYAAAA!", "OMAE WA MOU SHINDEIRU!", "YOU CAN'T SEE ME!", "MY TIME IS NOW!", "COWABUNGA")) // COWABUNGA
	return MARTIAL_COMBO_DONE
