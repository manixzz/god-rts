function gadget:GetInfo()
	return {
		name		= "Corpse Destroyer",
		desc		= "Destroys corpses on the map after decay time has passed.",
		author		= "Mani",
		date		= "2012-03-19",
		license     = "GNU GPL v2",
		layer		= 1,
		enabled   	= true,
	}
end

local corpseList = {}

function destroyFeature(featureID)
	--Spring.Echo("DESTROYED")
	Spring.DestroyFeature(featureID)
end

function gadget:FeatureCreated(featureID)
	local featureDefID = Spring.GetFeatureDefID(featureID)
	local decayTime = FeatureDefs[featureDefID].customParams.featuredecaytime
	local currentFrame = Spring.GetGameFrame()
	local destroyTime = currentFrame + decayTime*30
	local corpse = {featureID, destroyTime}
	table.insert(corpseList, corpse)
	if decayTime ~= nil then
		GG.Delay.CallLater(decayTime, destroyFeature, {featureID})
	end
end