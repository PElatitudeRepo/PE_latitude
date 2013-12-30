demofunc = {}  
------ function create healthstone
function demofunc.HealthstoneCharges()
	local getHealthstoneCharges = GetItemCount(5512, nil, true)
	if UnitCastingInfo("player") or UnitChannelInfo("player") then return false end
	if getHealthstoneCharges < 3 then
		return true
	end
end

function demofunc.PowerBuff()
	local buffList = {
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
				
				146197,				-- Essence of Yu'lon
			    146046,				-- Purified Bindings of Immerseus
			    145072,				-- Bonus T16 2P
			    145091,				-- Bonus T16 4P
			    137592,			    -- Sinister Primal Diamond
	}
for buff in pairs(buffList) do
        if UnitBuff("player", buff) then
       		return true end
   		return false
    end			
end

function demofunc.human()
	if GetShapeshiftForm("player") == 0
	then 
	return true end
   	return false
end

function demofunc.GuldanDoubleCharges()
	local GulCharges = select(1,GetSpellCharges(105174))
	if GulCharges == nil then GulCharge = 0 end
		if GulCharges == 2 then 
			return true end
   	return false
end
--print("|cff0070dd I have a Proc !!!!")
ProbablyEngine.library.register("demofunc", demofunc)