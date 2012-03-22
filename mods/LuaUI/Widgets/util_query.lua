function widget:GetInfo()
    return {
        name = "Query Gadget state",
        desc = "Widget that allows UI to query global gadget state",
        author = "cam",
        tickets = "#152",
        date = "2012-03-19",
        license = "GNU GPL v2",
        layer = 1,
        enabled = true,
    }
end

include("Headers/utilities.lua")
include("msgs.h.lua")
include("managers.h.lua")

local GetMyTeamID = Spring.GetMyTeamID

local MY_PLAYER_ID = Spring.GetMyPlayerID()
local queue = {}

WG.GadgetQuery = {}

local function AddToQueue(item)
    -- Add item to queue and return index where it was added
    counter = 1
    for k,v in pairs(queue) do
        if k ~= counter then
            queue[k] = item
            return k
        end
        counter = counter + 1
    end
    queue[counter] = item
    return counter
end

local function Callback(id, reply)
    local callback = queue[id]
    if not callback then return end
    callback(reply)
end

local function CallFunction(funcstring, callback)
    local id = AddToQueue(callback)
    LuaMessages.SendLuaRulesMsg(MSG_TYPES.GADGET_STATE_QUERY, {id, funcstring})
end

local function GetCallbackWrapper(callback)
    local function _callback(retval)
        local f = assert(loadstring("return "..retval))
        callback(f())
    end
    return _callback
end

local function StartManagerQueryString(key)
    local teamID = GetMyTeamID()
    local q = ""
    if table.contains(Managers.Team.TYPES, key) then
        q = q.."_G.TeamManagers["..teamID.."]:"
    else
        q = q.."_G."
    end
    return q.."Get"..key.."():"
end

local function CallManagerFunction(callback, key, funcname, args)
    args = args or {} 
    local q = StartManagerQueryString(key)..funcname.."("
    q = q..table.concat(utils.map(utils.to_string, args), ",")..")"
    CallFunction(q, GetCallbackWrapper(callback))
end

local function CallManagerElementFunction(callback, key, elementID, funcname, args)
    args = args or {} 
    local q = StartManagerQueryString(key).."GetElement("..elementID.."):"..funcname.."("
    q = q..table.concat(utils.map(utils.to_string, args), ",")..")"
    --q = q..table.concat(args, ",")..")"
    CallFunction(q, GetCallbackWrapper(callback))
end

local function CallManagerFunctionOnAll(callback, key, funcname, args)
    args = args or {} 
    local q = StartManagerQueryString(key).."CallOnAll('"..funcname.."'"
    if table.isempty(args) then
        q = q..")"
    else
        q = q..","..table.tostring(args)..")"
    end
    CallFunction(q, GetCallbackWrapper(callback))
end

WG.GadgetQuery.CallManagerFunction = CallManagerFunction
WG.GadgetQuery.CallManagerElementFunction = CallManagerElementFunction
WG.GadgetQuery.CallManagerFunctionOnAll = CallManagerFunctionOnAll

function widget:RecvLuaMsg(msg, playerID)
    if playerID ~= MY_PLAYER_ID then return end
    local msgtype, params = LuaMessages.deserialize(msg)
    if msgtype ~= MSG_TYPES.GADGET_STATE_REPLY then return end
    local msgID, reply = unpack(params)
    Callback(tonumber(msgID), reply)
end
