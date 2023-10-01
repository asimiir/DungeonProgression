--Each entry in the table has 3 values:
-- 1 The name of the dungeon.
-- 2 The name of the Elite
-- 3 A number indicating the amount of that Elite there is in the dungeon.

dungeonEliteArray = {
-- Classic
{"Scarlet Monastery", "Scarlet Centurion", 12},
{"Scarlet Monastery", "Scarlet Fanatic", 22},
{"Scarlet Monastery", "Scarlet Flamethrower", 6},
{"Scarlet Monastery", "Scarlet Judicator", 12},
{"Scarlet Monastery", "Scarlet Purifier", 20},
{"Scarlet Monastery", "Fallen Crusader", 5},
{"Scarlet Monastery", "Scarlet Zealot", 13},
{"Scarlet Halls", "Angry Hound", 8},
{"Scarlet Halls", "Starving Hound", 20},
{"Scarlet Halls", "Commander Lindon", 1},
{"Scarlet Halls", "Scarlet Evangelist", 4},
{"Scarlet Halls", "Scarlet Evoker", 2},
{"Scarlet Halls", "Scarlet Hall Guardian", 4},
{"Scarlet Halls", "Scarlet Myrmidon", 3},
{"Scarlet Halls", "Scarlet Scholar", 2},
{"Scarlet Halls", "Scarlet Scourge Hewer", 4},
{"Scarlet Halls", "Scarlet Treasurer", 5},
{"Scarlet Halls", "Vigilant Watchman", 5},
{"Scholomance", "Boneweaver", 6},
{"Scholomance", "Bored Student", 28},
{"Scholomance", "Candlestick Mage", 5},
{"Scholomance", "Flesh Horror", 3},
{"Scholomance", "Krastinovian Carver", 16},
{"Scholomance", "Professor Slate", 1},
{"Scholomance", "Risen Guard", 5},
{"Scholomance", "Scholomance Acolyte", 12},
{"Scholomance", "Scholomance Neophyte", 13},
{"Scholomance", "Bound Servant", 4},
{"Scholomance", "Soul Fragment", 24},
{"Shadowfang Keep", "Corpse Eater", 8},
{"Shadowfang Keep", "Dread Scryer", 2},
{"Shadowfang Keep", "Fetid Ghoul", 3},
{"Shadowfang Keep", "Ghostly Cook", 4},
{"Shadowfang Keep", "Haunted Servitor", 13},
{"Shadowfang Keep", "Mindless Horror", 4},
{"Shadowfang Keep", "Pustulant Monstrosity", 2},
{"Shadowfang Keep", "Shadowy Attendant", 10},
{"Shadowfang Keep", "Sorcerous Skeleton", 3},
{"Shadowfang Keep", "Spitebone Flayer", 2},
{"Shadowfang Keep", "Spitebone Guardian", 2},
{"Shadowfang Keep", "Spitebone Skeleton", 4},
{"Shadowfang Keep", "Stone Sleeper", 4},
{"Shadowfang Keep", "Tormented Officer", 2},
{"Shadowfang Keep", "Unstable Ravager", 3},
{"Shadowfang Keep", "Wailing Guardsman", 11},
{"Ragefire Chasm", "Adolescent Flame Hound", 9},
{"Ragefire Chasm", "Corrupted Flamecaller", 5},
{"Ragefire Chasm", "Corrupted Houndmaster", 5},
{"Ragefire Chasm", "Corrupted Reaver", 14},
{"Ragefire Chasm", "Dark Shaman Acolyte", 9},
{"Ragefire Chasm", "Dark Shaman Researcher", 7},
{"Ragefire Chasm", "Mature Flame Hound", 9},
{"Wailing Caverns", "Deviate Adder", 14},
{"Wailing Caverns", "Deviate Dreadfang", 4},
{"Wailing Caverns", "Deviate Guardian", 18},
{"Wailing Caverns", "Deviate Lasher", 22},
{"Wailing Caverns", "Deviate Moccasin", 6},
{"Wailing Caverns", "Deviate Ravager", 34},
{"Wailing Caverns", "Deviate Shambler", 14},
{"Wailing Caverns", "Deviate Venomwing", 6},
{"Wailing Caverns", "Deviate Viper", 16},
{"Wailing Caverns", "Druid of the Fang", 42},
{"Wailing Caverns", "Evolving Ectoplasm", 10},
{"Deadmines", "Defias Blood Wizard", 4},
{"Deadmines", "Defias Enforcer", 6},
{"Deadmines", "Defias Envoker", 3},
{"Deadmines", "Defias Overseer", 2},
{"Deadmines", "Defias Pirate", 23},
{"Deadmines", "Defias Reaper", 2},
{"Deadmines", "Defias Shadowguard", 5},
{"Deadmines", "Defias Squallshaper", 10},
{"Deadmines", "Defias Watcher", 2},
{"Deadmines", "Foe Reaper 5000", 1},
{"Deadmines", "Glubtok", 1},
{"Deadmines", "Helix Gearbreaker", 1},
{"Deadmines", "Lumbering Oaf", 1},
{"Deadmines", "Mine Bunny", 2},
{"Deadmines", "Oaf Lackey", 6},
{"Deadmines", "Ogre Bodyguard", 2},
{"Deadmines", "Ogre Henchman", 5},
{"Stormwind Stockade", "Enraged Fire Elemental", 9},
{"Stormwind Stockade", "Riverpaw Basher", 5},
{"Stormwind Stockade", "Riverpaw Looter", 6},
{"Stormwind Stockade", "Riverpaw Poacher", 7},
{"Stormwind Stockade", "Riverpaw Shaman", 6},
{"Stormwind Stockade", "Riverpaw Slayer", 9},
{"Stormwind Stockade", "Rowdy Troublemaker", 4},
{"Stormwind Stockade", "Searing Destroyer", 6},
{"Stormwind Stockade", "Shifty Thief", 8},
{"Stormwind Stockade", "Slag Fury", 6},
{"Stormwind Stockade", "Vicious Thug", 3},
{"Blackfathom Deeps", "Aku'mai the Devourer", 1},
{"Blackfathom Deeps", "Blindlight Bilefin", 9},
{"Blackfathom Deeps", "Blindlight Murloc", 24},
{"Blackfathom Deeps", "Blindlight Rotmouth", 1},
{"Blackfathom Deeps", "Deep Terror", 10},
{"Blackfathom Deeps", "Executioner Gore", 1},
{"Blackfathom Deeps", "Ghamoo-Ra", 1},
{"Blackfathom Deeps", "Guardian of the Deep", 1},
{"Blackfathom Deeps", "Pahboo-Ra", 1},
{"Blackfathom Deeps", "Razorshell Snapjaw", 3},
{"Blackfathom Deeps", "Twilight Aquamancer", 7},
{"Blackfathom Deeps", "Twilight Disciple", 22},
{"Blackfathom Deeps", "Twilight Shadow", 6},
{"Blackfathom Deeps", "Twilight Shadowmage", 4},
{"Blackfathom Deeps", "Twilight Storm Mender", 8},
{"Blackfathom Deeps", "Twilight Tormentor", 2},
{"Gnomeregan", "Caverndeep Burrower", 26},
{"Gnomeregan", "Caverndeep Reaver", 10},
{"Gnomeregan", "Corrosive Lurker", 3},
{"Gnomeregan", "Dark Iron Agent", 24},
{"Gnomeregan", "Irradiated Horror", 5},
{"Gnomeregan", "Irradiated Pillager", 24},
{"Gnomeregan", "Irradiated Slime", 5},
{"Gnomeregan", "Leprous Defender", 11},
{"Gnomeregan", "Mechanized Guardian", 8},
{"Gnomeregan", "Mechanized Sentry", 18},
{"Gnomeregan", "Mechano-Flamewalker", 7},
{"Gnomeregan", "Mechano-Frostwalker", 3},
{"Gnomeregan", "Mechano-Tank", 4},
{"Gnomeregan", "Peacekeeper Security Suit", 6},
{"Razorfen Kraul", "Aggem Thorncurse", 1},
{"Razorfen Kraul", "Battle Boar", 12},
{"Razorfen Kraul", "Blood-Branded Razorfen", 4},
{"Razorfen Kraul", "Cave Bat", 4},
{"Razorfen Kraul", "Death Speaker Jargba", 1},
{"Razorfen Kraul", "Enormous Bullfrog", 1},
{"Razorfen Kraul", "Grotto Toad", 7},
{"Razorfen Kraul", "Groyat, the Blind Hunter", 1},
{"Razorfen Kraul", "Kraulshaped Monstrosity", 1},
{"Razorfen Kraul", "Kraulshaper Tukaar", 1},
{"Razorfen Kraul", "Razorfen Beast Stalker", 12},
{"Razorfen Kraul", "Razorfen Geomagus", 2},
{"Razorfen Kraul", "Razorfen Hidecrusher", 2},
{"Razorfen Kraul", "Razorfen Huntmaster", 12},
{"Razorfen Kraul", "Razorfen Kraulshaper", 7},
{"Razorfen Kraul", "Razorfen Scarblade", 3},
{"Razorfen Kraul", "Razorfen Stonechanter", 3},
{"Razorfen Kraul", "Razorfen Thornbolt", 2},
{"Razorfen Kraul", "Roogug", 1},
{"Razorfen Downs", "Boneflayer Ghoul", 9},
{"Razorfen Downs", "Bubonic Geist", 9},
{"Razorfen Downs", "Death's Head Arachnomancer", 4},
{"Razorfen Downs", "Death's Head Ghoul Wrangler", 3},
{"Razorfen Downs", "Death's Head Necrolyte", 7},
{"Razorfen Downs", "Death's Head Shadowmender", 7},
{"Razorfen Downs", "Freezing Spirit", 2},
{"Razorfen Downs", "Frozen Soul", 4},
{"Razorfen Downs", "Plague-Rotted Webslinger", 7},
{"Razorfen Downs", "Splinterbone Captain", 2},
{"Razorfen Downs", "Thorn Eater Ghoul", 4},
{"Uldaman", "Jadespine Basilisk", 3},
{"Uldaman", "Shadowforge Darkcaster", 2},
{"Uldaman", "Shadowforge Geologist", 3},
{"Uldaman", "Shadowforge Relic Hunter", 5},
{"Uldaman", "Shadowforge Sharpshooter", 2},
{"Uldaman", "Shrike Bat", 7},
{"Uldaman", "Stone Steward", 7},
{"Uldaman", "Stonevault Ambusher", 8},
{"Uldaman", "Stonevault Brawler", 13},
{"Uldaman", "Stonevault Cave Lurker", 4},
{"Uldaman", "Stonevault Flameweaver", 4},
{"Uldaman", "Stonevault Geomancer", 6},
{"Uldaman", "Stonevault Mauler", 6},
{"Uldaman", "Stonevault Oracle", 22},
{"Uldaman", "Stonevault Pillager", 13},
{"Zul'Farrak", "Murta Grimgut", 1},
{"Zul'Farrak", "Oro Eyegouge", 1},
{"Zul'Farrak", "Raven", 1},
{"Zul'Farrak", "Sandfury Acolyte", 2},
{"Zul'Farrak", "Sandfury Blood Drinker", 47},
{"Zul'Farrak", "Sandfury Cretin", 3},
{"Zul'Farrak", "Sandfury Drudge", 16},
{"Zul'Farrak", "Sandfury Guardian", 4},
{"Zul'Farrak", "Sandfury Shadowcaster", 18},
{"Zul'Farrak", "Sandfury Shadowhunter", 30},
{"Zul'Farrak", "Sandfury Witch Doctor", 46},
{"Zul'Farrak", "Sergeant Bly", 1},
{"Zul'Farrak", "Servant of Antu'sul", 1},
{"Zul'Farrak", "Sul'lithuz Sandcrawler", 15},
{"Zul'Farrak", "Zul'Farrak Zombie", 1},
{"Sunken Temple", "Atal'ai Corpse Eater", 3},
{"Sunken Temple", "Atal'ai Deathwalker", 9},
{"Sunken Temple", "Atal'ai Deathwalker's Spirit", 9},
{"Sunken Temple", "Atal'ai High Priest", 3},
{"Sunken Temple", "Hakkari Frostwing", 2},
{"Sunken Temple", "Hakkari Sapper", 4},
{"Sunken Temple", "Nightmare Scalebane", 8},
{"Sunken Temple", "Nightmare Wanderer", 4},
{"Sunken Temple", "Nightmare Wyrmkin", 6},
{"Sunken Temple", "Weaver", 1},
{"Sunken Temple", "Dreamscythe", 1},
{"Sunken Temple", "Morphaz", 1},
{"Sunken Temple", "Hazzas", 1},
{"Maraudon", "Barbed Lasher", 1},
{"Maraudon", "Cavern Lurker", 1},
{"Maraudon", "Cavern Shambler", 1},
{"Maraudon", "Celebras the Redeemed", 1},
{"Maraudon", "Celebrian Dryad", 1},
{"Maraudon", "Constrictor Vine", 1},
{"Maraudon", "Creeping Sludge", 1},
{"Maraudon", "Deeprot Stomper", 1},
{"Maraudon", "Deeprot Tangler", 1},
{"Maraudon", "Noxious Slime", 1},
{"Maraudon", "Primordial Behemoth", 1},
{"Maraudon", "Putridus Satyr", 1},
{"Maraudon", "Putridus Shadowstalker", 1},
{"Maraudon", "Putridus Trickster", 1},
{"Maraudon", "Sister of Celebras", 1},
{"Maraudon", "Spewed Larva", 1},
{"Maraudon", "Subterranean Diemetradon", 1},
{"Maraudon", "Theradrim Guardian", 1},
{"Maraudon", "Theradrim Shardling", 1},
{"Maraudon", "Thessala Hydra", 1},
{"Blackrock Depths", "Ambassador Flamelash", 1},
{"Blackrock Depths", "Anger'rel", 1},
{"Blackrock Depths", "Anub'shiah", 1},
{"Blackrock Depths", "Bael'Gar", 1},
{"Blackrock Depths", "Doom'rel", 1},
{"Blackrock Depths", "Dope'rel", 1},
{"Blackrock Depths", "Fineous Darkvire", 1},
{"Blackrock Depths", "General Angerforge", 1},
{"Blackrock Depths", "Gloom'rel", 1},
{"Blackrock Depths", "Golem Lord Argelmach", 1},
{"Blackrock Depths", "Hate'rel", 1},
{"Blackrock Depths", "High Interrogator Gerstahn", 1},
{"Blackrock Depths", "Houndmaster Grebmar", 1},
{"Blackrock Depths", "Lord Incendius", 1},
{"Blackrock Depths", "Lord Roccor", 1},
{"Blackrock Depths", "Magmus", 1},
{"Blackrock Depths", "Panzor the Invincible", 1},
{"Blackrock Depths", "Phalanx", 1},
{"Blackrock Depths", "Plugger Spazzring", 1},
{"Blackrock Depths", "Pyromancer Loregrain", 1},
{"Blackrock Depths", "Seeth'rel", 1},
{"Blackrock Depths", "Verek", 1},
{"Blackrock Depths", "Vile'rel", 1},
{"Blackrock Depths", "Warder Stilgiss", 1},
{"Blackrock Depths", "Anvilrage Captain", 3},
{"Blackrock Depths", "Anvilrage Footman", 36},
{"Blackrock Depths", "Anvilrage Guardsman", 38},
{"Blackrock Depths", "Anvilrage Marshal", 11},
{"Blackrock Depths", "Anvilrage Medic", 22},
{"Blackrock Depths", "Anvilrage Officer", 15},
{"Blackrock Depths", "Anvilrage Overseer", 5},
{"Blackrock Depths", "Anvilrage Reservist", 154},
{"Blackrock Depths", "Anvilrage Soldier", 30},
{"Blackrock Depths", "Anvilrage Warden", 27},
{"Blackrock Depths", "Doomforge Dragoon", 11},
{"Blackrock Depths", "Fireguard", 8},
{"Blackrock Depths", "Fireguard Destroyer", 29},
{"Blackrock Depths", "Hammered Patron", 12},
{"Blackrock Depths", "Molten War Golem", 5},
{"Blackrock Depths", "Ragereaver Golem", 4},
{"Blackrock Depths", "Twilight Bodyguard", 7},
{"Blackrock Depths", "Twilight Emissary", 17},
{"Blackrock Depths", "Twilight's Hammer Torturer", 15},
{"Blackrock Depths", "Warbringer Construct", 6},
{"Blackrock Depths", "Wrath Hammer Construct", 3},
{"Lower Blackrock Spire", "Bloodaxe Evoker", 7},
{"Lower Blackrock Spire", "Bloodaxe Raider", 5},
{"Lower Blackrock Spire", "Bloodaxe Summoner", 5},
{"Lower Blackrock Spire", "Bloodaxe Veteran", 8},
{"Lower Blackrock Spire", "Bloodaxe Warmonger", 9},
{"Lower Blackrock Spire", "Firebrand Darkweaver", 8},
{"Lower Blackrock Spire", "Firebrand Dreadweaver", 2},
{"Lower Blackrock Spire", "Firebrand Grunt", 16},
{"Lower Blackrock Spire", "Firebrand Invoker", 10},
{"Lower Blackrock Spire", "Firebrand Legionnaire", 2},
{"Lower Blackrock Spire", "Firebrand Pyromancer", 2},
{"Lower Blackrock Spire", "Scarshield Acolyte", 5},
{"Lower Blackrock Spire", "Scarshield Legionnaire", 13},
{"Lower Blackrock Spire", "Scarshield Raider", 6},
{"Lower Blackrock Spire", "Scarshield Spellbinder", 9},
{"Lower Blackrock Spire", "Scarshield Warlock", 4},
{"Lower Blackrock Spire", "Smolderthorn Axe Thrower", 8},
{"Lower Blackrock Spire", "Smolderthorn Berserker", 7},
{"Lower Blackrock Spire", "Smolderthorn Headhunter", 7},
{"Lower Blackrock Spire", "Smolderthorn Mystic", 3},
{"Lower Blackrock Spire", "Smolderthorn Seer", 5},
{"Lower Blackrock Spire", "Smolderthorn Shadow Hunter", 1},
{"Lower Blackrock Spire", "Smolderthorn Shadow Priest", 11},
{"Lower Blackrock Spire", "Smolderthorn Witch Doctor", 5},
{"Lower Blackrock Spire", "Spire Spider", 5},
{"Lower Blackrock Spire", "Spirestone Battle Mage", 2},
{"Lower Blackrock Spire", "Spirestone Enforcer", 5},
{"Lower Blackrock Spire", "Spirestone Mystic", 3},
{"Lower Blackrock Spire", "Spirestone Ogre Magus", 3},
{"Lower Blackrock Spire", "Spirestone Reaver", 4},
{"Lower Blackrock Spire", "Spirestone Warlord", 5},
{"Dire Maul", "Arcane Aberration", 1},
{"Dire Maul", "Arcane Torrent", 1},
{"Dire Maul", "Death Lash", 1},
{"Dire Maul", "Eldreth Apparition", 1},
{"Dire Maul", "Eldreth Darter", 1},
{"Dire Maul", "Eldreth Phantasm", 1},
{"Dire Maul", "Eldreth Seether", 1},
{"Dire Maul", "Eldreth Sorcerer", 1},
{"Dire Maul", "Eldreth Spectre", 1},
{"Dire Maul", "Eldreth Spirit", 1},
{"Dire Maul", "Fel Lash", 1},
{"Dire Maul", "Gordok Brute", 1},
{"Dire Maul", "Gordok Bushwacker", 1},
{"Dire Maul", "Gordok Captain", 1},
{"Dire Maul", "Gordok Mage-Lord", 1},
{"Dire Maul", "Gordok Reaver", 1},
{"Dire Maul", "Gordok Spirit", 1},
{"Dire Maul", "Gordok Warlock", 1},
{"Dire Maul", "Ironbark Protector", 1},
{"Dire Maul", "Mana Remnant", 1},
{"Dire Maul", "Netherwalker", 1},
{"Dire Maul", "Petrified Guardian", 1},
{"Dire Maul", "Petrified Treant", 1},
{"Dire Maul", "Residual Monstrosity", 1},
{"Dire Maul", "Warpwood Crusher", 1},
{"Dire Maul", "Warpwood Guardian", 1},
{"Dire Maul", "Warpwood Stomper", 1},
{"Dire Maul", "Warpwood Tangler", 1},
{"Dire Maul", "Warpwood Treant", 1},
{"Dire Maul", "Wilspawn Betrayer", 1},
{"Dire Maul", "Wilspawn Felsworn", 1},
{"Dire Maul", "Wilspawn Hellcaller", 1},
{"Dire Maul", "Wilspawn Rogue", 1},
{"Dire Maul", "Wilspawn Satyr", 1},
{"Dire Maul", "Wilspawn Shadowstalker", 1},
{"Dire Maul", "Wilspawn Trickster", 1},
{"Dire Maul", "Xorothian Dreadsteed", 1},
-- Burning Crusade
{"Hellfire Citadel: The Blood Furnace", "Fel Orc Neophyte", 8},
{"Hellfire Citadel: The Blood Furnace", "Felguard Annihilator", 6},
{"Hellfire Citadel: The Blood Furnace", "Felguard Brute", 4},
{"Hellfire Citadel: The Blood Furnace", "Laughing Skull Enforcer", 14},
{"Hellfire Citadel: The Blood Furnace", "Laughing Skull Legionnaire", 6},
{"Hellfire Citadel: The Blood Furnace", "Laughing Skull Rogue", 5},
{"Hellfire Citadel: The Blood Furnace", "Laughing Skull Warden", 2},
{"Hellfire Citadel: The Blood Furnace", "Nascent Fel Orc", 13},
{"Hellfire Citadel: The Blood Furnace", "Shadowmoon Adept", 15},
{"Hellfire Citadel: The Blood Furnace", "Shadowmoon Channeler", 5},
{"Hellfire Citadel: The Blood Furnace", "Shadowmoon Summoner", 6},
{"Hellfire Citadel: The Blood Furnace", "Shadowmoon Technician", 19},
{"Hellfire Citadel: The Blood Furnace", "Shadowmoon Warlock", 14},
{"Hellfire Citadel: Ramparts", "Bleeding Hollow Archer", 9},
{"Hellfire Citadel: Ramparts", "Bleeding Hollow Darkcaster", 13},
{"Hellfire Citadel: Ramparts", "Bleeding Hollow Scryer", 7},
{"Hellfire Citadel: Ramparts", "Bonechewer Beastmaster", 1},
{"Hellfire Citadel: Ramparts", "Bonechewer Destroyer", 16},
{"Hellfire Citadel: Ramparts", "Bonechewer Hungerer", 18},
{"Hellfire Citadel: Ramparts", "Bonechewer Ravener", 7},
{"Hellfire Citadel: Ramparts", "Bonechewer Ripper", 2},
{"Hellfire Citadel: Ramparts", "Fiendish Hound", 2},
{"Hellfire Citadel: Ramparts", "Hellfire Sentry", 2},
{"Hellfire Citadel: Ramparts", "Hellfire Watcher", 2},
{"Hellfire Citadel: The Shattered Halls", "Creeping Ooze", 6},
{"Hellfire Citadel: The Shattered Halls", "Shadowmoon Acolyte", 3},
{"Hellfire Citadel: The Shattered Halls", "Shadowmoon Darkcaster", 7},
{"Hellfire Citadel: The Shattered Halls", "Shattered Hand Archer", 2},
{"Hellfire Citadel: The Shattered Halls", "Shattered Hand Assassin", 8},
{"Hellfire Citadel: The Shattered Halls", "Shattered Hand Blood Guard", 1},
{"Hellfire Citadel: The Shattered Halls", "Shattered Hand Brawler", 7},
{"Hellfire Citadel: The Shattered Halls", "Shattered Hand Centurion", 4},
{"Hellfire Citadel: The Shattered Halls", "Shattered Hand Gladiator", 16},
{"Hellfire Citadel: The Shattered Halls", "Shattered Hand Heathen", 9},
{"Hellfire Citadel: The Shattered Halls", "Shattered Hand Houndmaster", 4},
{"Hellfire Citadel: The Shattered Halls", "Shattered Hand Legionnaire", 8},
{"Hellfire Citadel: The Shattered Halls", "Shattered Hand Reaver", 8},
{"Hellfire Citadel: The Shattered Halls", "Shattered Hand Savage", 14},
{"Hellfire Citadel: The Shattered Halls", "Shattered Hand Sentry", 4},
{"Coilfang: The Slave Pens", "Bogstrok", 15},
{"Coilfang: The Slave Pens", "Coilfang Champion", 11},
{"Coilfang: The Slave Pens", "Coilfang Collaborator", 15},
{"Coilfang: The Slave Pens", "Coilfang Defender", 8},
{"Coilfang: The Slave Pens", "Coilfang Enchantress", 7},
{"Coilfang: The Slave Pens", "Coilfang Observer", 6},
{"Coilfang: The Slave Pens", "Coilfang Ray", 4},
{"Coilfang: The Slave Pens", "Coilfang Scale-Healer", 4},
{"Coilfang: The Slave Pens", "Coilfang Slavehandler", 6},
{"Coilfang: The Slave Pens", "Coilfang Soothsayer", 3},
{"Coilfang: The Slave Pens", "Coilfang Technician", 20},
{"Coilfang: The Slave Pens", "Coilfang Tempest", 5},
{"Coilfang: The Slave Pens", "Greater Bogstrok", 18},
{"Coilfang: The Steamvault", "Bog Overlord", 5},
{"Coilfang: The Steamvault", "Coilfang Engineer", 12},
{"Coilfang: The Steamvault", "Coilfang Myrmidon", 16},
{"Coilfang: The Steamvault", "Coilfang Oracle", 10},
{"Coilfang: The Steamvault", "Coilfang Siren", 18},
{"Coilfang: The Steamvault", "Coilfang Slavemaster", 4},
{"Coilfang: The Steamvault", "Coilfang Sorceress", 10},
{"Coilfang: The Steamvault", "Coilfang Warrior", 15},
{"Coilfang: The Steamvault", "Coilfang Water Elemental", 3},
{"Coilfang: The Steamvault", "Dreghood Slave", 11},
{"Coilfang: The Steamvault", "Tidal Surger", 3},
{"Coilfang: The Underbog", "Bog Giant", 9},
{"Coilfang: The Underbog", "Fen Ray", 14},
{"Coilfang: The Underbog", "Lykul Stinger", 3},
{"Coilfang: The Underbog", "Lykul Wasp", 6},
{"Coilfang: The Underbog", "Murkblood Healer", 4},
{"Coilfang: The Underbog", "Murkblood Oracle", 5},
{"Coilfang: The Underbog", "Murkblood Spearman", 5},
{"Coilfang: The Underbog", "Murkblood Tribesman", 10},
{"Coilfang: The Underbog", "Underbat", 23},
{"Coilfang: The Underbog", "Underbog Frenzy", 30},
{"Coilfang: The Underbog", "Underbog Lord", 2},
{"Coilfang: The Underbog", "Underbog Lurker", 13},
{"Coilfang: The Underbog", "Underbog Shambler", 5},
{"Coilfang: The Underbog", "Wrathfin Myrmidon", 6},
{"Coilfang: The Underbog", "Wrathfin Sentry", 2},
{"Coilfang: The Underbog", "Wrathfin Warrior", 5},
{"Tempest Keep: The Botanica", "Bloodfalcon", 6},
{"Tempest Keep: The Botanica", "Bloodwarder Falconer", 2},
{"Tempest Keep: The Botanica", "Bloodwarder Greenkeeper", 8},
{"Tempest Keep: The Botanica", "Bloodwarder Mender", 4},
{"Tempest Keep: The Botanica", "Bloodwarder Protector", 22},
{"Tempest Keep: The Botanica", "Bloodwarder Steward", 4},
{"Tempest Keep: The Botanica", "Mutate Fear-Shrieker", 6},
{"Tempest Keep: The Botanica", "Mutate Horror", 6},
{"Tempest Keep: The Botanica", "Nethervine Inciter", 8},
{"Tempest Keep: The Botanica", "Nethervine Reaper", 5},
{"Tempest Keep: The Botanica", "Nethervine Trickster", 2},
{"Tempest Keep: The Botanica", "Sunseeker Botanist", 7},
{"Tempest Keep: The Botanica", "Sunseeker Channeler", 6},
{"Tempest Keep: The Botanica", "Sunseeker Chemist", 5},
{"Tempest Keep: The Botanica", "Sunseeker Geomancer", 2},
{"Tempest Keep: The Botanica", "Sunseeker Harvester", 5},
{"Tempest Keep: The Botanica", "Sunseeker Herbalist", 4},
{"Tempest Keep: The Botanica", "Sunseeker Researcher", 9},
{"Tempest Keep: The Botanica", "Tempest-Forge Peacekeeper", 4},
{"Tempest Keep: The Mechanar", "Bloodwarder Centurion", 6},
{"Tempest Keep: The Mechanar", "Bloodwarder Physician", 14},
{"Tempest Keep: The Mechanar", "Bloodwarder Slayer", 7},
{"Tempest Keep: The Mechanar", "Mechanar Crusher", 1},
{"Tempest Keep: The Mechanar", "Mechanar Driller", 6},
{"Tempest Keep: The Mechanar", "Mechanar Tinkerer", 16},
{"Tempest Keep: The Mechanar", "Mechanar Wrecker", 5},
{"Tempest Keep: The Mechanar", "Raging Flames", 2},
{"Tempest Keep: The Mechanar", "Sunseeker Astromage", 8},
{"Tempest Keep: The Mechanar", "Sunseeker Engineer", 10},
{"Tempest Keep: The Mechanar", "Sunseeker Netherbinder", 5},
{"Tempest Keep: The Mechanar", "Tempest-Forge Destroyer", 5},
{"Tempest Keep: The Mechanar", "Tempest-Forge Patroller", 6},
{"Tempest Keep: The Arcatraz", "Arcatraz Defender", 3},
{"Tempest Keep: The Arcatraz", "Arcatraz Sentinel", 5},
{"Tempest Keep: The Arcatraz", "Arcatraz Warder", 4},
{"Tempest Keep: The Arcatraz", "Death Watcher", 3},
{"Tempest Keep: The Arcatraz", "Entropic Eye", 1},
{"Tempest Keep: The Arcatraz", "Eredar Deathbringer", 1},
{"Tempest Keep: The Arcatraz", "Eredar Soul-Eater", 2},
{"Tempest Keep: The Arcatraz", "Ethereum Slayer", 4},
{"Tempest Keep: The Arcatraz", "Ethereum Wave-Caster", 2},
{"Tempest Keep: The Arcatraz", "Gargantuan Abyssal", 2},
{"Tempest Keep: The Arcatraz", "Negaton Screamer", 3},
{"Tempest Keep: The Arcatraz", "Negaton Warp-Master", 2},
{"Tempest Keep: The Arcatraz", "Protean Nightmare", 6},
{"Tempest Keep: The Arcatraz", "Sargeron Archer", 2},
{"Tempest Keep: The Arcatraz", "Sargeron Hellcaller", 2},
{"Tempest Keep: The Arcatraz", "Skulking Witch", 2},
{"Tempest Keep: The Arcatraz", "Soul Devourer", 2},
{"Tempest Keep: The Arcatraz", "Spiteful Temptress", 2},
{"Tempest Keep: The Arcatraz", "Unbound Devastator", 1},
{"Auchindoun: Auchenai Crypts", "Angered Skeleton", 7},
{"Auchindoun: Auchenai Crypts", "Auchenai Monk", 11},
{"Auchindoun: Auchenai Crypts", "Auchenai Necromancer", 4},
{"Auchindoun: Auchenai Crypts", "Auchenai Soulpriest", 21},
{"Auchindoun: Auchenai Crypts", "Auchenai Vindicator", 7},
{"Auchindoun: Auchenai Crypts", "Raging Skeleton", 7},
{"Auchindoun: Mana-Tombs", "Ethereal Crypt Raider", 14},
{"Auchindoun: Mana-Tombs", "Ethereal Darkcaster", 14},
{"Auchindoun: Mana-Tombs", "Ethereal Priest", 14},
{"Auchindoun: Mana-Tombs", "Ethereal Scavenger", 9},
{"Auchindoun: Mana-Tombs", "Ethereal Sorcerer", 21},
{"Auchindoun: Mana-Tombs", "Ethereal Spellbinder", 10},
{"Auchindoun: Mana-Tombs", "Ethereal Theurgist", 4},
{"Auchindoun: Mana-Tombs", "Nexus Stalker", 9},
{"Auchindoun: Mana-Tombs", "Nexus Terror", 9},
{"Auchindoun: Sethekk Halls", "Avian Warhawk", 5},
{"Auchindoun: Sethekk Halls", "Cobalt Serpent", 4},
{"Auchindoun: Sethekk Halls", "Sethekk Guard", 14},
{"Auchindoun: Sethekk Halls", "Sethekk Initiate", 13},
{"Auchindoun: Sethekk Halls", "Sethekk Oracle", 7},
{"Auchindoun: Sethekk Halls", "Sethekk Prophet", 13},
{"Auchindoun: Sethekk Halls", "Sethekk Ravenguard", 6},
{"Auchindoun: Sethekk Halls", "Sethekk Talon Lord", 5},
{"Auchindoun: Sethekk Halls", "Time-Lost Controller", 11},
{"Auchindoun: Sethekk Halls", "Time-Lost Scryer", 5},
{"Auchindoun: Sethekk Halls", "Time-Lost Shadowmage", 6},
{"Auchindoun: Shadow Labyrinth", "Cabal Acolyte", 17},
{"Auchindoun: Shadow Labyrinth", "Cabal Cultist", 16},
{"Auchindoun: Shadow Labyrinth", "Cabal Deathsworn", 19},
{"Auchindoun: Shadow Labyrinth", "Cabal Executioner", 8},
{"Auchindoun: Shadow Labyrinth", "Cabal Familiar", 6},
{"Auchindoun: Shadow Labyrinth", "Cabal Fanatic", 6},
{"Auchindoun: Shadow Labyrinth", "Cabal Ritualist", 18},
{"Auchindoun: Shadow Labyrinth", "Cabal Shadow Priest", 7},
{"Auchindoun: Shadow Labyrinth", "Cabal Spellbinder", 13},
{"Auchindoun: Shadow Labyrinth", "Cabal Summoner", 14},
{"Auchindoun: Shadow Labyrinth", "Cabal Warlock", 5},
{"Auchindoun: Shadow Labyrinth", "Cabal Zealot", 4},
{"Auchindoun: Shadow Labyrinth", "Fel Overseer", 4},
{"Auchindoun: Shadow Labyrinth", "Malicious Instructor", 3},
{"Magisters' Terrace", "Apoko", 1},
{"Magisters' Terrace", "Coilskar Witch", 4},
{"Magisters' Terrace", "Ellrys Duskhallow", 1},
{"Magisters' Terrace", "Eramas Brightblaze", 1},
{"Magisters' Terrace", "Ethereum Smuggler", 4},
{"Magisters' Terrace", "Kagani Nightstrike", 1},
{"Magisters' Terrace", "Sister of Torment", 5},
{"Magisters' Terrace", "Sunblade Blood Knight", 13},
{"Magisters' Terrace", "Sunblade Mage Guard", 10},
{"Magisters' Terrace", "Sunblade Magister", 11},
{"Magisters' Terrace", "Sunblade Physician", 14},
{"Magisters' Terrace", "Sunblade Sentinel", 3},
{"Magisters' Terrace", "Sunblade Warlock", 11},
{"Magisters' Terrace", "Wretched Bruiser", 5},
{"Magisters' Terrace", "Wretched Husk", 5},
{"Magisters' Terrace", "Wretched Skulker", 4},
{"Opening of the Dark Portal", "Rift Keeper", 6},
{"Opening of the Dark Portal", "Rift Lord", 8},
{"The Escape from Durnholde", "Don Carlos", 1},
{"The Escape from Durnholde", "Durnholde Mage", 5},
{"The Escape from Durnholde", "Durnholde Rifleman", 19},
{"The Escape from Durnholde", "Durnholde Sentry", 31},
{"The Escape from Durnholde", "Durnholde Tracking Hound", 7},
{"The Escape from Durnholde", "Durnholde Veteran", 8},
{"The Escape from Durnholde", "Durnholde Warden", 15},
{"The Escape from Durnholde", "Infinite Defiler", 3},
{"The Escape from Durnholde", "Infinite Saboteur", 3},
{"The Escape from Durnholde", "Infinite Slayer", 4},
{"The Escape from Durnholde", "Lordaeron Sentry", 3},
{"The Escape from Durnholde", "Lordaeron Watchman", 6},
{"The Escape from Durnholde", "Pit Spectator", 7},
{"The Escape from Durnholde", "Tarren Mill Guardsman", 4},
{"The Escape from Durnholde", "Tarren Mill Lookout", 7},
{"The Escape from Durnholde", "Tarren Mill Protector", 4},
-- Wrath of the Lich King
{"Pit of Saron", "Alliance Slave", 2},
{"Pit of Saron", "Coliseum Champion", 16},
{"Pit of Saron", "Deathwhisper Necrolyte", 7},
{"Pit of Saron", "Deathwhisper Shadowcaster", 4},
{"Pit of Saron", "Deathwhisper Torturer", 4},
{"Pit of Saron", "Fallen Warrior", 14},
{"Pit of Saron", "Geist Ambusher", 5},
{"Pit of Saron", "Horde Slave", 2},
{"Pit of Saron", "Hungering Ghoul", 8},
{"Pit of Saron", "Iceborn Proto-Drake", 2},
{"Pit of Saron", "Plagueborn Horror", 5},
{"Pit of Saron", "Stonespine Gargoyle", 2},
{"Pit of Saron", "Wrathbone Coldwraith", 4},
{"Pit of Saron", "Wrathbone Laborer", 14},
{"Pit of Saron", "Wrathbone Skeleton", 12},
{"Pit of Saron", "Ymirjar Deathbringer", 2},
{"Pit of Saron", "Ymirjar Flamebearer", 4},
{"Pit of Saron", "Ymirjar Skycaller", 2},
{"Pit of Saron", "Ymirjar Wrathbringer", 4},
{"The Forge of Souls", "Soul Horror", 4},
{"The Forge of Souls", "Soulguard Adept", 5},
{"The Forge of Souls", "Soulguard Animator", 8},
{"The Forge of Souls", "Soulguard Bonecaster", 5},
{"The Forge of Souls", "Soulguard Reaper", 6},
{"The Forge of Souls", "Soulguard Watchman", 8},
{"The Forge of Souls", "Spectral Warden", 3},
{"Halls of Reflection", "Ghostly Priest", 7},
{"Halls of Reflection", "Lumbering Abomination", 6},
{"Halls of Reflection", "Phantom Mage", 4},
{"Halls of Reflection", "Risen Witch Doctor", 9},
{"Halls of Reflection", "Shadowy Mercenary", 5},
{"Halls of Reflection", "Tortured Rifleman", 6},
{"The Nexus", "Alliance Berserker", 4},
{"The Nexus", "Alliance Cleric", 5},
{"The Nexus", "Alliance Commander", 1},
{"The Nexus", "Alliance Ranger", 4},
{"The Nexus", "Azure Enforcer", 10},
{"The Nexus", "Azure Magus", 1},
{"The Nexus", "Azure Scale-Binder", 6},
{"The Nexus", "Azure Warder", 3},
{"The Nexus", "Chaotic Rift", 6},
{"The Nexus", "Crazed Mana-Surge", 7},
{"The Nexus", "Crazed Mana-Wraith", 88},
{"The Nexus", "Crystalline Keeper", 11},
{"The Nexus", "Crystalline Protector", 5},
{"The Nexus", "Crystalline Tender", 8},
{"The Nexus", "Grand Magus Telestra", 1},
{"The Nexus", "Mage Hunter Initiate", 7},
{"The Nexus", "Mage Slayer", 6},
{"The Nexus", "Steward", 5},
-- Cataclysm
-- Mist of Pandaria
-- Warlords of Draenor
{"Auchindoun", "Auchenai Arbiter", 1},
{"Auchindoun", "Auchenai Defender", 2},
{"Auchindoun", "Auchenai Magus", 1},
{"Auchindoun", "Auchenai Warden", 1},
{"Auchindoun", "Auchenai Zealot", 1},
{"Auchindoun", "Cackling Pyromaniac", 13},
{"Auchindoun", "Felborne Abyssal", 1},
{"Auchindoun", "Felguard", 4},
{"Auchindoun", "Sargerei Arbiter", 2},
{"Auchindoun", "Sargerei Cleric", 1},
{"Auchindoun", "Sargerei Defender", 7},
{"Auchindoun", "Sargerei Hoplite", 2},
{"Auchindoun", "Sargerei Magus", 2},
{"Auchindoun", "Sargerei Ritualist", 3},
{"Auchindoun", "Sargerei Soulbinder", 1},
{"Auchindoun", "Sargerei Soulpriest", 1},
{"Auchindoun", "Sargerei Spirit-Tender", 1},
{"Auchindoun", "Sargerei Warden", 1},
{"Auchindoun", "Sargerei Zealot", 3},
{"Auchindoun", "Zar'shuul", 1},
{"Auchindoun", "Durag the Dominator", 1},
{"Auchindoun", "Gul'Kosh", 1},
{"Auchindoun", "Grom'tash the Destructor", 1},
-- Legion
-- Shadowlands
}
