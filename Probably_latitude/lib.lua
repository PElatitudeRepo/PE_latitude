demofunc = {}  


demofunc.ProcList ={
	  			
	  			104423, 			-- Windsong				
				128985,				-- Blessing of the Celestials
				33702,				-- Blood Fury
				126577,				-- Inner Brilliance
				126659,				-- Quickened Tongues
				126478,				-- Flashfreeze
				136082,				-- Static Charge
				126605,				-- Blossom
				126476,				-- Predation
				136089,				-- Arcane Sight
				138898,				-- Breath of Many Minds
				139133,				-- Mastermind
				138786,				-- Wushoolay's Lightning
				138703,				-- Acceleration
				137590,				-- Tempus Repit
				125487,				-- Lightweave
				74241,				-- Power Torrent
				79476,				-- Volcanic Power
				126734,				-- Synapse Springs
				105702,				-- Potion of the Jade Serpent
				104993,				-- Jade Spirit
				2825,				-- Bloodlust
				80353,				-- Time Warp
				32182,				-- Heroism
				90355,				-- Ancient Hysteria

				113861,				-- Dark Soul
				146197,				-- Essence of Yu'lon
			    146046,				-- Purified Bindings of Immerseus
			    137592,			    -- Sinister Primal Diamond
	}

function demofunc.HaveProc(State)
	for i = 1, #demofunc.ProcList do
		if UnitBuff("player", GetSpellInfo(demofunc.ProcList[i])) and State == true then
			return true end
			if not UnitBuff("player", GetSpellInfo(demofunc.ProcList[i])) and State == false then
			return true end
	end
end



------ forme humaine -----
function demofunc.human(State)
	local form = GetShapeshiftForm("player")
	if State == true and form == 0
		then
		return true end
	if State == false and form == 1
	then
   	return true end
end

------ Double Charges HOG
function demofunc.GuldanDoubleCharges(State)
	local GulCharges = select(1,GetSpellCharges("105174"))
	if GulCharges == 2 then GuldanDoubleCharges = 1 end
	if GulCharges == 0 then GuldanDoubleCharges = 0 end
	
	if State == false and GuldanDoubleCharges == 0 then return true end		
	 	while GuldanDoubleCharges > 0  and State == true do
		return true end
	end

------ Reload HOG Charge -----
function demofunc.ReloadHOG(Time)
	local HoGCD = select(3,GetSpellCharges(105174)) + select(4,GetSpellCharges(105174)) - GetTime()
	if HoGCD <= Time then
	   return true end
end

------ function create healthstone
function demofunc.HealthstoneCharges()
	local getHealthstoneCharges = GetItemCount(5512, nil, true)
	if UnitCastingInfo("player") or UnitChannelInfo("player") then return false end
	if getHealthstoneCharges < 3 then
		return true
	end
end
--print("|cff0070dd I have a Proc !!!!")
ProbablyEngine.library.register("demofunc", demofunc)





