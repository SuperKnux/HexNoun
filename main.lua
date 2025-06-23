if package.environment == "client" then return end

local ActionRegistryEntry = require("at.petrak.hexcasting.api.casting.ActionRegistryEntry")
local HexDir = require("at.petrak.hexcasting.api.casting.math.HexDir")
local HexPattern = require("at.petrak.hexcasting.api.casting.math.HexPattern")
local MediaConstants = require("at.petrak.hexcasting.api.misc.MediaConstants")
local Registry = require("net.minecraft.registry.Registry")
local HexActions = require("at.petrak.hexcasting.common.lib.hex.HexActions")

local HexEvalSounds = require("at.petrak.hexcasting.common.lib.hex.HexEvalSounds")
local OperationResult = require("at.petrak.hexcasting.api.casting.eval.OperationResult")

Registry.register(
    HexActions.REGISTRY,
    "test",
    ActionRegistryEntry(
        HexPattern.fromAngles("ede", HexDir.SOUTH_EAST),
        function(env, image, continuation)
            local stack = image.stack:toArray()
            local iota = table.remove(stack)

            table.insert(stack, iota)
            table.insert(stack, iota)

            local newImage = image:copy(stack, image.parenCount, image.parenthesized, image.escapeNext, image.opsConsumed + 1, image.userData)
            local result = OperationResult(newImage, {}, continuation, HexEvalSounds.NORMAL_EXECUTE)
            return result
        end
    )
)
