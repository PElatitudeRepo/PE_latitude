-- ProbablyEngine Rotation Packager
-- Custom Demonology Warlock Rotation
-- Created on Dec 26th 2013 2:20 pm
ProbablyEngine.rotation.register_custom(266, "|r[|cff9482C9Latitude|r][|cffFF7D0AWarlock-Demonology BETA|r]", {

{ "test",	"@demofunc.GuldanDoubleCharges()" },

------------- Guld'an logic when x2 charges (pull secquence, or, after long meta transfo -------
--first charges
--wait shadowflame debuff 5s fade to cast last charges

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
--{ "18540", "modifier.lcontrol" }			-- Summon Doomguard
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



---- Metha Pull ----
{ "!/cancelaura Metamorphosis", { "target.debuff(Doom).duration > 61", "target.debuff(146739)", "player.buff(103958)", "player.demonicfury <= 200" }}, 				-- Cancel Meta After Doom Dotting at the pull

{{
	{ "103958", 		"!player.buff(103958)" } ,												-- Meta
	{ "!/cast Doom", 	{ "!target.debuff(Doom)", "target.debuff(Doom).duration < 61" }},		-- Doom
	{ "!/cast Doom", 	"target.debuff(Doom).duration < 61" },									-- Doom Dotting x2 for pandemic effect
},  { "!target.debuff(Doom)", "target.debuff(146739)" }},


------ Meta ---------
{ "103958", 	{ "!player.buff(103958)", "player.demonicfury >= 950" }}, 
{ "!/cancelaura Metamorphosis", { "player.demonicfury <= 350", "player.buff(103958)", "!@demofunc.PowerBuff()", "target.debuff(Doom).duration > 61" }},	        -- Cancel Meta under 450 fury if no proc/temp Buff and Doom havepandemic effect
--{ "!/cancelaura Metamorphosis", { "player.demonicfury <= 100", "player.buff(103958)", "@demofunc.PowerBuff()" }},	        -- Keep Meta Form until we finish all temps Proc

----Meta Cycle ---------
{{
	{ "!/cast Doom", "!target.debuff(Doom)" },
	{ "!/cast Doom", "target.debuff(Doom).duration <= 30" },
	{ "!/cast Doom", "player.demonicfury < 200" },
	{ "112092", "target.debuff(Corruption).duration <= 15" },    -- Touch of Chaos Refresh Corruption before fade
	{ "112092", "player.moving" }, 								 -- Touch of Chaos when moving to skip SoulFire
	{ "6353",	"player.buff(122355).count >= 2" },				 -- soufire with proc +25% target life--
	{ "112092" }, 												 -- Touch of Chaos
}, "!@demofunc.human()" },

----- filer forme humaine -----
{{
    { "105174", "@demofunc.human()" },												-- guld'an --
	{ "77799",  "player.moving" },								-- Moving Human Form --
	{ "6353",	"target.health < 25"},							-- soulfire
	{ "6353",	"player.buff(122355).count >= 2" },				-- soufire with proc +25% target life--
	{ "112092"}, 							                    -- shadowblot si la cible a plus de 25% de vie
}, "@demofunc.human()" },



-- Out Of Combat
},
{
--Buffs
{ "6201", {"@demofunc.HealthstoneCharges()","!player.moving", "!modifier.last(6201)" }},
{ "109773", "!player.buff(109773)" },
{ "30146",  { "!pet.alive", "!modifier.last(30146)" }},
{ "!/cancelaura Metamorphosis" },
})