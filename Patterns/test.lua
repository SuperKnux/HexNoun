local HexEvalSounds = require("at.petrak.hexcasting.common.lib.hex.HexEvalSounds")
local OperationResult = require("at.petrak.hexcasting.api.casting.eval.OperationResult")

return function(env, image, continuation)
    local stack = image.stack:toArray()
    local iota = table.remove(stack)

    table.insert(stack, iota)
    table.insert(stack, iota)

    local newImage = image:copy(stack, image.parenCount, image.parenthesized, image.escapeNext, image.opsConsumed + 1, image.userData)
    local result = OperationResult(newImage, {}, continuation, HexEvalSounds.NORMAL_EXECUTE)
    return result
end