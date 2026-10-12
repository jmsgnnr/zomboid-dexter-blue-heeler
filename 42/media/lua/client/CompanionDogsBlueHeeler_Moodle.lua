local CD = CompanionDogs
if not (CD and CD.DogMoodles) then return end

local function dogIsCaredFor(dog)
    if not dog then return false end
    return dog:getHunger() < CD.MOODLE_NEGLECT_MAX and dog:getThirst() < CD.MOODLE_NEGLECT_MAX
end

CD.DogMoodles[#CD.DogMoodles + 1] = {
    id = "cattledrive",
    breed = "blueheeler",
    nameKey = "IGUI_PD_Moodle_CattleDrive",
    descKey = "IGUI_PD_Moodle_CattleDrive_desc",
    icon = "CD_Moodle_CattleDrive",
    fg = "CD_MoodCattleDriveFG",
    tintR = 0.42, tintG = 0.58, tintB = 0.70,
    condition = function(player, dog)
        if not dog or dog:isDead() then return 0 end
        if CD.getBreed(dog) ~= "blueheeler" then return 0 end
        if CD.isDisloyal(dog) then return 0 end
        if not dogIsCaredFor(dog) then return 0 end
        return 1
    end,
    apply = function(player, dog, elapsedMin)
        local n = 0.0008 * (elapsedMin or 0)
        local stats = n > 0 and player and player:getStats()
        if stats then
            stats:add(CharacterStat.ENDURANCE, n)
        end
    end,
}
