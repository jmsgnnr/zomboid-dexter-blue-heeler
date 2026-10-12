"""Static validation of the packaged add-on. Does not require Project Zomboid."""
import configparser
import pathlib
import re
import unittest

ROOT = pathlib.Path(__file__).resolve().parent.parent
PACKAGE = ROOT / "42"
LUA = PACKAGE / "media" / "lua"


def parse_metadata(path: pathlib.Path):
    data = {}
    for line in path.read_text(encoding="utf-8").splitlines():
        if "=" in line and not line.lstrip().startswith("#"):
            key, value = line.split("=", 1)
            data[key.strip()] = value.strip()
    return data


class ModIntegrityTests(unittest.TestCase):
    def test_metadata_matches_across_root_and_build(self):
        root = parse_metadata(ROOT / "mod.info")
        build = parse_metadata(PACKAGE / "mod.info")
        self.assertEqual(root, build)
        self.assertEqual(root["id"], "CompanionDogsBlueHeeler")
        self.assertEqual(root["require"], "CompanionDogs")
        self.assertEqual(root["modversion"], "0.1.0")
        self.assertEqual(root["author"], "jmsgnnr")

    def test_has_required_lua_integration(self):
        breed = (LUA / "shared" / "CompanionDogsBlueHeeler_Breed.lua").read_text(encoding="utf-8")
        self.assertIn("CD.registerBreed(", breed)
        self.assertIn("CD.API_VERSION", breed)
        self.assertIn('key = "blueheeler"', breed)
        self.assertTrue((LUA / "client" / "CompanionDogsBlueHeeler_Moodle.lua").exists())
        self.assertTrue((LUA / "shared" / "Definitions" / "animal" / "HeelerDefinitions.lua").exists())

    def test_all_package_binary_assets_are_png(self):
        for path in ROOT.rglob("*"):
            if path.is_file() and path.suffix.lower() == ".png":
                self.assertEqual(path.read_bytes()[:8], b"\x89PNG\r\n\x1a\n", msg=str(path))
        for base in (ROOT, PACKAGE):
            for filename in ("icon.png", "poster.png"):
                self.assertTrue((base / filename).exists())

    def test_references_resolve_to_package_or_upstream(self):
        self.assertTrue((PACKAGE / "media" / "textures" / "Body" / "BlueHeeler.png").exists())
        self.assertTrue((PACKAGE / "media" / "textures" / "CDPortrait_blueheeler.png").exists())
        self.assertTrue((LUA / "shared" / "Translate" / "EN" / "IG_UI.json").exists())

    def test_only_one_addon_shipped(self):
        self.assertEqual([p.name for p in ROOT.iterdir() if p.is_dir() and p.name not in (".git", "tests", "__pycache__")], ["42"])
        actual = parse_metadata(PACKAGE / "mod.info")["id"]
        self.assertEqual(actual, "CompanionDogsBlueHeeler")


if __name__ == "__main__":
    unittest.main()
