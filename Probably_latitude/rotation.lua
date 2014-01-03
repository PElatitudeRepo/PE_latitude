-- ProbablyEngine Rotation Packager
-- Custom Demonology Warlock Rotation
-- Created on Dec 26th 2013 2:20 pm
ProbablyEngine.rotation.register_custom(266, "|r[|cff9482C9Latitude|r][|cffFF7D0AWarlock-Demonology BETA|r]", {

{ "test",	"@demofunc.ReloadHOG(4)" },

-- Soulstone
{ "20707", { 
		"!mouseover.alive",
		"mouseover.friend",
		"mouseover.spell(20707).range"
	},  "mouseover" },

--Mana Management
{ "Life Tap", { "player.mana < 30", "player.health > 70", }},
-- defensive CD --
{ "!108416",	"player.health < 50" },		-- Sacrificial Pact
{ "!6789", 		"player.health < 60" }, 	-- Mortal Coil
{ "!#5512", 	"player.health < 45" }, 	-- Healthstone
-- offensive CD --
{ "33702"},									-- Racial
{ "#gloves" }, 								-- gloves
{ "113861"},								-- dark soul dès que up
{ "18540", "modifier.lshift" },				-- Summon Doomguard
{ "119914"},								-- Commande Demon (Aoe)


--Rotation Shared

{ "1490", 	{ -- Curse of Elements
		"!modifier.last(1490)",
		"!target.debuff(1490).any",
		"!target.debuff(34889).any",
		"!target.debuff(24844).any",
		"!target.debuff(93068).any",
		"target.level = -1"
			}},



{ "!172", 	"target.debuff(146739).duration < 3" },     	-- Corruption Refresh
{ "172", 	"!target.debuff(146739)" },						-- Corruption
{ "111898"},												-- GoServ

-- HOG purge --
{{
    { "105174", "player.spell(105174).charges = 0" },										-- first charges guld'an --
	{ "!105174", {"target.debuff(47960).duration < 4", "!modifier.last(105174)"  }},		-- second charges of HOG
    { "112092", "target.health > 25"}, 														-- shadowblot to fill the gap
},  { "@demofunc.human(true)", "@demofunc.GuldanDoubleCharges(true)" }},


---- Metha Pull/cast Doom ASAP ----
{ "!/cancelaura Metamorphosis", { "target.debuff(Doom).duration > 61", "target.debuff(146739)", "player.buff(103958)", "player.demonicfury <= 200" }}, 												-- Cancel Meta After Doom Dotting at the pull
{ "!/cancelaura Metamorphosis", { "target.debuff(Doom).duration > 30", "player.demonicfury >= 200", "player.demonicfury <= 450", "player.buff(103958)", "@demofunc.HaveProc(false)" }}, 			-- Cancel Meta if no power spell buff, and  demonicpower between 200 and 450
{{
	{ "103958", 		"!player.buff(103958)" } ,												-- Meta
	{ "!/cast Doom", 	{ "!target.debuff(Doom)", "target.debuff(Doom).duration < 61" }},		-- Doom
	{ "!/cast Doom", 	"target.debuff(Doom).duration < 61" },									-- Doom Dotting x2 for pandemic effect
	{ "6353",	"target.health < 25"},							 								-- soulfire
	{ "103964", "target.debuff(Corruption).duration <= 15" },    								-- Touch of Chaos Refresh Corruption before fade
	{ "103964", "player.moving" }, 								 								-- Touch of Chaos when moving to skip SoulFire
	{ "6353",	"player.buff(122355).count >= 2" },				 								-- soufire with proc +25% target life--
	{ "103964" },												 
},  { "!target.debuff(Doom)", "target.debuff(146739)", "player.spell(105174).charges = 0" }},  -- cast meta if no doom/ have corruption and purge guld'an (pull sequence for exemple)


------ Meta ---------
{ "103958", 	{ "!player.buff(103958)", "player.demonicfury >= 950" }}, 

----Meta Cycle ---------
{{
	{ "!/cast Doom", "!target.debuff(Doom)" },
	{ "!/cast Doom", "target.debuff(Doom).duration <= 30" },
	{ "!/cast Doom", "player.demonicfury < 200" },
							 
	{ "!103964", "target.debuff(Corruption).duration <= 15" },   -- Touch of Chaos Refresh Corruption before fade
	{ "!103964", "player.moving" }, 							 -- Touch of Chaos when moving to skip SoulFire
	{ "6353",	"target.health < 25"},							 -- soufire with proc 25% target life--
	{ "6353",	"player.buff(122355).count >= 2" },				 -- soulfire
	{ "103964" }, 												 -- Touch of Chaos
}, { "@demofunc.human(false)", "@demofunc.GuldanDoubleCharges(false)" }},

----- filer forme humaine -----
{{
    { "105174" },				-- guld'an --
	{ "!77799",  "player.moving" },								-- Moving Human Form --
	{ "6353",	"target.health < 25"},							-- soulfire
	{ "6353",	"player.buff(122355).count >= 2" },				-- soufire with proc +25% target life--
	{ "112092", "target.health > 25"}, 							-- shadowblot si la cible a plus de 25% de vie
}, { "@demofunc.human(true)", "@demofunc.GuldanDoubleCharges(false)" }},



-- Out Of Combat
},
{
--Buffs
{ "6201", {"@demofunc.HealthstoneCharges()","!player.moving", "!modifier.last(6201)" }},
{ "109773", "!player.buff(109773)" },
{ "30146",  { "!pet.alive", "!modifier.last(30146)" }},
{ "!/cancelaura Metamorphosis" },
})