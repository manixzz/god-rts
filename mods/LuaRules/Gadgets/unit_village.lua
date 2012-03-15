
function gadget:GetInfo()
    return {
        name = "Village spawner",
        desc = "Spawns neutral villages on the map at game start",
        tickets = "#15",
        author = "cam",
        date = "Feb 9, 2012",
        license = "Public Domain",
        layer = -1,
        enabled = true
    }
end

------------------------------------------------------------
-- SYNCED
------------------------------------------------------------
if (not gadgetHandler:IsSyncedCode()) then
    return false
end

function gadget:GameStart()

    if not VFS.FileExists("mapinfo.lua") then
        Spring.Echo("Village spawner gadget: Can't find mapinfo.lua!")
        return
    end

    local mapcfg = VFS.Include("mapinfo.lua")
    if (not mapcfg) or (not mapcfg.custom) or (not mapcfg.custom.villages) then
        Spring.Echo("Village spawner gadget: Can't find village locations in mapinfo.lua!")
        return
    end

    local CreateUnit = Spring.CreateUnit
    local GetGroundHeight = Spring.GetGroundHeight
    local gaiaTeamID = Spring.GetGaiaTeamID()
    for _, village in pairs(mapcfg.custom.villages) do
        local v = CreateUnit(village.vtype, village.x, GetGroundHeight(village.x, village.z),
                   village.z, 0, gaiaTeamID)
        Spring.SetUnitNeutral(v, true)
    end
end
