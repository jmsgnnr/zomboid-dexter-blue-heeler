if not (CompanionDogs and CompanionDogs.applyDogModel and CompanionDogs.DOG_SOUNDS) then return end

local CD = CompanionDogs
local applyModel = CD.applyCompanionModel or CD.applyDogModel
local applyBeh = CD.applyCompanionBehaviour or CD.applyDogBehaviour
local applyAvatar = CD.applyCompanionAvatar or CD.applyDogAvatar
local sounds = CD.COMPANION_SOUNDS or CD.DOG_SOUNDS

AnimalDefinitions = AnimalDefinitions or {}
AnimalDefinitions.stages = AnimalDefinitions.stages or {}
AnimalDefinitions.breeds = AnimalDefinitions.breeds or {}
AnimalDefinitions.genome = AnimalDefinitions.genome or {}
AnimalDefinitions.animals = AnimalDefinitions.animals or {}

AnimalDefinitions.stages["heeler"] = {}
AnimalDefinitions.stages["heeler"].stages = {}
AnimalDefinitions.stages["heeler"].stages["heelerpup"] = {}
AnimalDefinitions.stages["heeler"].stages["heelerpup"].ageToGrow = 3 * 30
AnimalDefinitions.stages["heeler"].stages["heelerpup"].nextStage = "heelerfemale"
AnimalDefinitions.stages["heeler"].stages["heelerpup"].nextStageMale = "heelermale"
AnimalDefinitions.stages["heeler"].stages["heelermale"] = {}
AnimalDefinitions.stages["heeler"].stages["heelermale"].ageToGrow = 3 * 30
AnimalDefinitions.stages["heeler"].stages["heelerfemale"] = {}
AnimalDefinitions.stages["heeler"].stages["heelerfemale"].ageToGrow = 3 * 30

AnimalDefinitions.breeds["heeler"] = {}
AnimalDefinitions.breeds["heeler"].breeds = {}
AnimalDefinitions.breeds["heeler"].breeds["blueheeler"] = {}
local coat = AnimalDefinitions.breeds["heeler"].breeds["blueheeler"]
coat.name = "blueheeler"
coat.texture = "BlueHeeler"
coat.textureMale = "BlueHeeler"
coat.rottenTexture = "Raccoon_Rotting"
coat.invIconMale = "CDDogPaw_64"
coat.invIconFemale = "CDDogPaw_64"
coat.invIconBaby = "CDDogPaw_64"
coat.invIconMaleDead = "CDDogPawDead_64"
coat.invIconFemaleDead = "CDDogPawDead_64"
coat.invIconBabyDead = "CDDogPawDead_64"
coat.invIconMaleSkel = "Item_Skeleton_Raccoon"
coat.invIconFemaleSkel = "Item_Skeleton_Raccoon"
coat.invIconBabySkel = "Item_Skeleton_Raccoon"

local dogGenes = AnimalDefinitions.genome["dog"] and AnimalDefinitions.genome["dog"].genes
if not dogGenes and CD.defineGenome then
    dogGenes = CD.defineGenome("dog")
end

local function fillCompanion(a, opts)
    applyModel(a, "Husky_Body")
    applyBeh(a)
    for k, v in pairs(opts) do
        a[k] = v
    end
    a.wildFleeTimeUntilDeadTimer = CD.STRAY_NO_BLEEDOUT
    a.breeds = AnimalDefinitions.breeds["heeler"].breeds
    a.stages = AnimalDefinitions.stages["heeler"].stages
    a.genes = dogGenes
end

local pup = {}
fillCompanion(pup, {
    shadoww = 0.2, shadowfm = 0.2, shadowbm = 0.2,
    minSize = 0.90, maxSize = 1.28,
    wanderMul = 500,
    hungerMultiplier = 0.001, thirstMultiplier = 0.002,
    hungerBoost = 25, thirstBoost = 30,
    baseEncumbrance = 10, trailerBaseSize = 30, minEnclosureSize = 40,
    needMom = false, eatFromMother = true, litterEatTogether = true,
    minWeight = 1, maxWeight = 8,
})
AnimalDefinitions.animals["heelerpup"] = pup

local female = {}
fillCompanion(female, {
    female = true, babyType = "heelerpup",
    shadoww = 0.3, shadowfm = 0.5, shadowbm = 0.5,
    minSize = 1.22, maxSize = 1.58,
    wanderMul = 600,
    hungerMultiplier = 0.008, thirstMultiplier = 0.016,
    hungerBoost = 20, thirstBoost = 25,
    baseEncumbrance = 20, trailerBaseSize = 50, minEnclosureSize = 40,
    minAge = 3 * 30, maxAgeGeriatric = 19 * 30, minAgeForBaby = 3 * 30,
    timeBeforeNextPregnancy = 7, pregnantPeriod = 35,
    minWeight = 9, maxWeight = 16,
})
AnimalDefinitions.animals["heelerfemale"] = female

local male = {}
fillCompanion(male, {
    male = true, babyType = "heelerpup", dontAttackOtherMale = true,
    shadoww = 0.3, shadowfm = 0.5, shadowbm = 0.5,
    minSize = 1.22, maxSize = 1.68,
    wanderMul = 600,
    hungerMultiplier = 0.008, thirstMultiplier = 0.016,
    hungerBoost = 20, thirstBoost = 25,
    baseEncumbrance = 20, trailerBaseSize = 50, minEnclosureSize = 40,
    minAge = 3 * 30, maxAgeGeriatric = 19 * 30, minAgeForBaby = 3 * 30,
    minWeight = 10, maxWeight = 18,
})
AnimalDefinitions.animals["heelermale"] = male

AnimalDefinitions.animals["heelerpup"].breeds["blueheeler"].sounds = sounds
AnimalDefinitions.animals["heelerfemale"].breeds["blueheeler"].sounds = sounds
AnimalDefinitions.animals["heelermale"].breeds["blueheeler"].sounds = sounds

AnimalAvatarDefinition = AnimalAvatarDefinition or {}
AnimalAvatarDefinition["heelerpup"] = {}
AnimalAvatarDefinition["heelerfemale"] = {}
AnimalAvatarDefinition["heelermale"] = {}
if applyAvatar then
    applyAvatar(AnimalAvatarDefinition["heelerpup"])
    applyAvatar(AnimalAvatarDefinition["heelerfemale"])
    applyAvatar(AnimalAvatarDefinition["heelermale"])
end
