local ActionRegistryEntry = require("at.petrak.hexcasting.api.casting.ActionRegistryEntry")
local HexDir = require("at.petrak.hexcasting.api.casting.math.HexDir")
local HexPattern = require("at.petrak.hexcasting.api.casting.math.HexPattern")
local MediaConstants = require("at.petrak.hexcasting.api.misc.MediaConstants")
local Registry = require("net.minecraft.registry.Registry")
local HexActions = require("at.petrak.hexcasting.common.lib.hex.HexActions")
local Identifier = require("net.minecraft.util.Identifier")

Registry.register(
    HexActions.REGISTRY,
    "test",
    ActionRegistryEntry(
        HexPattern.fromAngles("ede", HexDir.SOUTH_EAST),
        require("Patterns.test")
    )
)


Registry.register(
    HexActions.REGISTRY,
    Identifier("hexnoun", "convert"),
    ActionRegistryEntry(
        HexPattern.fromAngles("qqqqqeaqddqd", HexDir.NORTH_EAST),
        require("Patterns.convert")
    )
)

