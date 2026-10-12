local CD = CompanionDogs
if not (CD and CD.registerBreed and (CD.API_VERSION or 0) >= 3) then return end

CD.registerBreed({
    key = "blueheeler",
    engineBreed = "blueheeler",
    typePrefix = "heeler",
    nameKey = "IGUI_PD_Breed_blueheeler",
    limpAnim = true,
    bandSkin = {
        base = "BlueHeeler",
        front = "BlueHeeler_BandFront",
        back = "BlueHeeler_BandBack",
        cutFront = "BlueHeeler_CutFront",
        cutBack = "BlueHeeler_CutBack",
    },
    litter = { 1, 4 },
    xpMult = { scent = 1.2, combat = 1.3, obedience = 1.5, hunt = 1.0, herding = 2.0 },
    combatPower = 0.42,
    lethalityCurve = { min = 0.40, max = 1.3 },
    canKill = true,
    canKnockdown = true,
    combatStressMult = 0.35,
    panicThreshold = 0.88,
    calmMult = 1.25,
    geneRange = {
        strength       = { 0.25, 0.50 },
        aggressiveness = { 0.25, 0.50 },
        resistance     = { 0.25, 0.50 },
        stress         = { 0.25, 0.55 },
    },
    spawns = {
        {
            id = "heelerfarm",
            class = "farm",
            suffix = "|bh",
            breed = "blueheeler",
            indoor = 70,
            chance = function()
                return (CD.farmBorderChance and CD.farmBorderChance() or 15) * 0.85
            end,
        },
        {
            id = "heelerhouse",
            class = "house",
            suffix = "|bhh",
            breed = "blueheeler",
            indoor = 50,
            chance = function()
                return (CD.strayChancePerHouse and CD.strayChancePerHouse() or 3) / 4
            end,
        },
    },
})
