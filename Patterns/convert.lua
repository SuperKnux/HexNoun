local HexEvalSounds = require("at.petrak.hexcasting.common.lib.hex.HexEvalSounds")
local OperationResult = require("at.petrak.hexcasting.api.casting.eval.OperationResult")
local Identifier = require("net.minecraft.util.Identifier")
local Registries = require("net.minecraft.registry.Registries")
local SpellContinuation = require("at.petrak.hexcasting.api.casting.eval.vm.SpellContinuation")

local StringIota = require("ram.talia.moreiotas.api.casting.iota.StringIota")
local IdentifierIota = require("miyucomics.hexical.casting.iotas.IdentifierIota")
local ItemTypeIota = require("ram.talia.moreiotas.api.casting.iota.ItemTypeIota")
local NullIota = require("at.petrak.hexcasting.api.casting.iota.NullIota")

local iotaConversions = {
    ["miyucomics.hexical.casting.iotas.IdentifierIota"] = function(iota)
        return ItemTypeIota(Registries.ITEM:get(iota:getIdentifier()))
    end,
    ["ram.talia.moreiotas.api.casting.iota.ItemTypeIota"] = function(iota)
        return IdentifierIota(Identifier(iota:getItem():toString()))
    end,
}

return function(env, image, continuation)
    local stack = image.stack:toArray()

    local iota = table.remove(stack)
    local iotaType = iota:getClass():getName()

    local handler = iotaConversions[iotaType]

    if handler then
        table.insert(stack, handler(iota))
    else
        table.insert(stack, NullIota()) -- TODO: Mishaps
    end

    return OperationResult(image:withUsedOp(), {}, continuation, HexEvalSounds.NORMAL_EXECUTE)
end