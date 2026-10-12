# Third-party components and credits

This is an independently maintained add-on for two systems that it does **not** own.

| Component | Original author / rights holder | How this project uses it | Attribution / limits |
|---|---|---|---|
| [Companion Dogs ALPHA](https://steamcommunity.com/sharedfiles/filedetails/?id=3740052292&l=english) | Björn and credited contributors | Calls the breed, model, behavior, portrait, state, moodle and spawn integration surface. Reuses runtime resources and may adapt upstream coat/art conventions. | The current Workshop description permits add-ons and use of its art in those add-ons **with credit**. Permission does not cover repackaging the full base mod or unrelated redistribution. Upstream remains a required separate download. |
| [Project Zomboid](https://projectzomboid.com/) | The Indie Stone | Uses Build 42 animal definition tables and game Lua APIs; game runtime owns built-in animations, models and resources. | The Indie Stone owns the game and its content. This mod is not official. See [Modding Policy](https://projectzomboid.com/blog/modding-policy/). |

## Companion Dogs API calls actually referenced

The add-on's Lua files contain calls or references to `registerBreed`, `API_VERSION`, `defineDogParts`, `defineGenome`, `applyCompanionModel`/`applyDogModel`, `applyCompanionBehaviour`/`applyDogBehaviour`, `applyCompanionAvatar`/`applyDogAvatar`, `DogMoodles`, `getBreed`, `isDisloyal`, `farmBorderChance` and `strayChancePerHouse`.

These are **mod APIs**, not cloud APIs. No external network credentials or services are involved.

## Asset provenance caveat

The original local mod contains PNG textures, portraits and icons. Attribution to the Companion Dogs upstream project is explicit wherever framework artwork or runtime model resources may be used. Precise per-pixel source history for local texture files was not recorded in the original mod; no new claim of sole authorship or separate permissive licensing is made for them. The upstream Workshop's allowance for credited Companion Dogs add-on art is the stated reuse basis. Confirm any additional external art sources before reuse outside this add-on.

The mod does **not** bundle Companion Dogs' complete package, source or sounds. It refers to built-in game and installed upstream resources at runtime.
