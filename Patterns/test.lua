local HexEvalSounds = require("at.petrak.hexcasting.common.lib.hex.HexEvalSounds")
local OperationResult = require("at.petrak.hexcasting.api.casting.eval.OperationResult")


local StringIota = require("ram.talia.moreiotas.api.casting.iota.StringIota")
local ConstMediaAction = require("at.petrak.hexcasting.api.casting.castables.ConstMediaAction")
local Object = require("java.lang.Object")

local builder = java.extendClass(Object, {ConstMediaAction}, {interface = false})

local OpTest = builder:build()

print(OpTest())

return OpTest()

