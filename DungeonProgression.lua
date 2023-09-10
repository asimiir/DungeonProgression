-- Chrono is working with command /dpstart and /dpstop
-- needs add Maraudon, Blackrock Depths, Blackrock Spire, Dire Maul to complete Classic

timeBeforeTimer = 3

soundFile = "Interface\\AddOns\\DungeonProgression\\Sounds\\FF7_Victory_Fanfare.mp3"
nBossTotal = 0;
mapID = 0;
nbDown = 0;
pourcentageAdd = 0.85
mobDeathsTrigger = 0;
nBossKilled = 0;
numMobsDied = 0
formattedPercentage = "";

startTime = nil
timerFrame = nil
elapsedSeconds = 0

nbBoss = 0;
eliteTotal = 0;
eliteTotalKilled = 0;
eliteInstance = {};

heraldSelectedChoice = ""
timerSelectedChoice = ""
mainWindowResizable = false
mainWindowMovable = true
mainWindowLocked = true

isClamped = true

--Each entry in the table has five values:
--1 The name of the dungeon (as a string).
--2 A number indicating the dungeon's index in the game's database.
--3 A number indicating the dungeon's map ID.
--4 A number indicating the number of boss in that dungeon
--5 A number indicating the number of adds in that dungeon
local dungeons = { 
    {"Wailing Caverns", 1, 43, 8},
    {"Scholomance", 2, 1007, 5},
    {"Ragefire Chasm", 4, 389, 4},
    {"Deadmines", 6, 36, 5},
    {"Shadowfang Keep", 8, 33, 5},
    {"Blackfathom Deeps", 10, 48, 8},
    {"Stormwind Stockade", 12, 34, 3},
    {"Gnomeregan", 14, 90, 6},
    {"Razorfen Kraul", 16, 47, 6},
    {"Razorfen Downs", 20, 129, 4},
    {"Uldaman", 22, 70, 8},
    {"Zul'Farrak", 24, 209, 9},
    {"Maraudon - Foulspore Cavern", 26, 349, 2},
    {"Sunken Temple", 28, 109, 3},
    {"Blackrock Depths - Detention Block", 30, 230, 21},
    {"Lower Blackrock Spire", 32, 229, 9},
    {"Dire Maul - Warpwood Quarter", 34, 429, 4},
    {"Dire Maul - Capital Gardens", 36, 429, 5},
    {"Dire Maul - Gordok Commons", 38, 429, 7},
    {"Stratholme - Main Gate", 40, 329, 7},
    {"Onyxia's Lair", 46, 249, 1},
    {"Molten Core", 48, 409, 10},
    {"Blackwing Lair", 50, 469, 8},
    {"Hellfire Ramparts", 136, 543, 3},
    {"Blood Furnace", 137, 542, 3},
    {"Shattered Halls", 138, 540, 3},
    {"Slave Pens", 140, 547, 3},
    {"Underbog", 146, 546, 4},
    {"The Steamvault", 147, 545, 3},
    {"Mana-Tombs", 148, 557, 3},
    {"Auchenai Crypts", 149, 558, 2},
    {"Sethekk Halls", 150, 556, 2},
    {"Shadow Labyrinth", 151, 555, 4},
    {"Scarlet Halls", 163, 1001, 3},
    {"Scarlet Monastery", 164, 1004, 3},
    {"The Escape from Durnholde", 170, 560, 3},
    {"Opening of the Dark Portal", 171, 269, 3},
    {"The Mechanar", 172, 554, 4},
    {"The Botanica", 173, 553, 5},
    {"The Arcatraz", 174, 552, 4},
    {"Auchenai Crypts", 178, 558, 2},
    {"Mana-Tombs", 179, 557, 3},
    {"Sethekk Halls", 180, 556, 2},
    {"Shadow Labyrinth", 181, 555, 2},
    {"Opening of the Dark Portal", 182, 269, 3},
    {"The Escape from Durnholde", 183, 560, 3},
    {"Slave Pens", 184, 547, 3},
    {"The Steamvault", 185, 545, 3},
    {"Underbog", 186, 546, 4},
    {"Blood Furnace", 187, 542, 3},
    {"Hellfire Ramparts", 188, 543, 3},
    {"Shattered Halls", 189, 540, 3},
    {"The Arcatraz", 190, 552, 4},
    {"The Botanica", 191, 553, 5},
    {"The Mechanar", 192, 554, 4},
    {"Magisters' Terrace", 198, 585, 4},
    {"Magisters' Terrace", 201, 585, 4},
    {"Utgarde Keep", 202, 574, 3},
    {"Utgarde Pinnacle", 203, 575, 4},
    {"Azjol-Nerub", 204, 601, 3},
    {"Utgarde Pinnacle", 205, 575, 3},
    {"The Oculus", 206, 578, 4},
    {"Halls of Lightning", 207, 602, 4},
    {"Halls of Stone", 208, 599, 4},
    {"The Culling of Stratholme", 209, 595, 4},
    {"The Culling of Stratholme", 210, 595, 4},
    {"The Oculus", 211, 578, 4},
    {"Halls of Lightning", 212, 602, 4},
    {"Halls of Stone", 213, 599,4},
    {"Drak'Tharon Keep", 214, 600, 4},
    {"Drak'Tharon Keep", 215, 600, 4},
    {"Gundrak", 216, 604, 4},
    {"Gundrak", 217, 604, 4},
    {"Ahn'kahet: The Old Kingdom", 218, 619, 4},
    {"Ahn'kahet: The Old Kingdom", 219, 619, 4},
    {"Violet Hold", 220, 608, 3},
    {"Violet Hold", 221, 608, 3},
    {"The Nexus", 225, 576, 4},
    {"The Nexus", 226, 576, 4},
    {"Azjol-Nerub", 241, 601, 3},
    {"Utgarde Keep", 242, 574, 3},
    {"Trial of the Champion", 245, 650, 3},
    {"Trial of the Champion", 249, 650, 3},
    {"The Forge of Souls", 251, 632, 2},
    {"The Forge of Souls", 252, 632, 2},
    {"Pit of Saron", 253, 658, 3},
    {"Pit of Saron", 254, 658, 3},
    {"Halls of Reflection", 255, 668, 3},
    {"Halls of Reflection", 256, 668, 3},
    {"Maraudon - The Wicked Grotto", 272, 349, 2},
    {"Maraudon - Earth Song Falls", 273, 349, 3},
    {"Stratholme - Service Entrance", 274, 329, 6},
    {"Blackrock Depths - Upper City", 276, 230, 21},
    {"Throne of the Tides", 302, 643, 4},
    {"Blackrock Caverns", 303, 645, 5},
    {"Grim Batol", 304, 670, 4},
    {"Halls of Origination", 305, 644, 7},
    {"The Stonecore", 307, 725, 4},
    {"The Vortex Pinnacle", 311, 657, 3},
    {"Lost City of the Tol'vir", 312, 755, 4},
    {"The Vortex Pinnacle", 319, 657, 3},
    {"The Stonecore", 320, 725, 4},
    {"Halls of Origination", 321, 644, 7},
    {"Grim Batol", 322, 670, 4},
    {"Blackrock Caverns", 323, 645, 5},
    {"Throne of the Tides", 324, 643, 4},
    {"Lost City of the Tol'vir", 325, 755, 4},
    {"Deadmines", 326, 36, 5},
    {"Shadowfang Keep", 327, 33, 5},
    {"Temple of the Jade Serpent", 464, 960, 4},
    {"Stormstout Brewery", 465, 961, 3},
    {"Shado-Pan Monastery", 466, 959, 4},
    {"Mogu'shan Palace", 467, 994, 3},
    {"Siege of Niuzao Temple", 630, 1011, 4},
    {"Gate of the Setting Sun", 631, 962, 4},
    {"Skyreach", 779, 1209, 4},
    {"Shadowmoon Burial Grounds", 783, 1176, 4},
    {"Bloodmaul Slag Mines", 787, 1175, 4},
    {"Auchindoun", 820, 1182, 4},
    {"Iron Docks", 821, 1195, 4},
    {"Vault of the Wardens", 1043, 1493, 5},
    {"Eye of Azshara", 1174, 1456, 5},
    {"Maw of Souls", 1191, 1492, 3},
    {"Halls of Valor", 1193, 1477, 5},
    {"Darkheart Thicket", 1201, 1466, 4},
    {"Black Rook Hold", 1204, 1501, 4},
    {"Neltharion's Lair", 1206, 1458, 4},
    {"Assault on Violet Hold", 1208, 1544, 3},
    {"Atal'Dazar", 1668, 1763, 4},
    {"Freehold", 1672, 1754, 4},
    {"Temple of Sethraliss", 1694, 1877, 4},
    {"Waycrest Manor", 1705, 1862, 5},
    {"The MOTHERLODE!!", 1707, 1594, 4},
    {"The Underrot", 1711, 1841, 4},
    {"Tol Dagor", 1713, 1771, 4},
    {"Shrine of the Storm", 1774, 1864, 4},
    {"Plaguefall", 2069, 2289, 4},
    {"The Necrotic Wake", 2070, 2286, 4},
    {"Mists of Tirna Scithe", 2072, 2290, 3},
    {"Halls of Atonement", 2074, 2287, 4},
    {"Spires of Ascension", 2076, 2285, 4},
    {"Theater of Pain", 2078, 2293, 5},
    {"De Other Side", 2080, 2291, 4},
    {"Sanguine Depths", 2082, 2284, 4}
};


--Each entry in the table has six values:

-- 1 A number indicating the boss's index in the game's database.
-- 2 The name of the boss (as a string).
-- 3 The name of the dungeon or instance where the boss is located (as a string).
-- 4 A number indicating the boss's encounter ID.
-- 5 A number indicating the boss's journal ID.
-- 6 A number indicating the dungeon's map ID.
local dungeonEncountersArray = {
{89, "Glubtok", "Deadmines", 37410, 1064, 36},
{90, "Helix Gearbreaker", "Deadmines", 33002, 1065, 36},
{91, "Foe Reaper 5000", "Deadmines", 35606, 1063, 36},
{92, "Admiral Ripsnarl", "Deadmines", 35739, 1062, 36},
{93, "Captain Cookie", "Deadmines", 1305, 1060, 36},
{95, "Vanessa VanCleef", "Deadmines", 32806, 1081, 36},
{96, "Baron Ashbury", "Shadowfang Keep", 34610, 1069, 33},
{97, "Baron Silverlaine", "Shadowfang Keep", 37288, 1070, 33},
{98, "Commander Springvale", "Shadowfang Keep", 37287, 1071, 33},
{99, "Lord Walden", "Shadowfang Keep", 34612, 1073, 33},
{100, "Lord Godfrey", "Shadowfang Keep", 34611, 1072, 33},
{101, "Lady Naz'jar", "Throne of the Tides", 34342, 1045, 643},
{102, "Commander Ulthok, the Festering Prince", "Throne of the Tides", 33792, 1044, 643},
{103, "Mindbender Ghur'sha", "Throne of the Tides", 32259, 1046, 643},
{104, "Ozumat", "Throne of the Tides", 34135, 1047, 643},
{105, "Rom'ogg Bonecrusher", "Blackrock Caverns", 33147, 1040, 645},
{106, "Corla, Herald of Twilight", "Blackrock Caverns", 31546, 1038, 645},
{107, "Karsh Steelbender", "Blackrock Caverns", 31710, 1039, 645},
{108, "Beauty", "Blackrock Caverns", 34433, 1037, 645},
{109, "Ascendant Lord Obsidius", "Blackrock Caverns", 36465, 1036, 645},
{110, "Corborus", "The Stonecore", 33477, 1056, 725},
{111, "Slabhide", "The Stonecore", 36476, 1059, 725},
{112, "Ozruk", "The Stonecore", 36475, 1058, 725},
{113, "High Priestess Azil", "The Stonecore", 26448, 1057, 725},
{114, "Grand Vizier Ertan", "The Vortex Pinnacle", 35181, 1043, 657},
{115, "Altairus", "The Vortex Pinnacle", 34265, 1041, 657},
{116, "Asaad, Caliph of Zephyrs", "The Vortex Pinnacle", 35388, 1042, 657},
{117, "General Husam", "Lost City of the Tol'vir", 34743, 1052, 755},
{118, "Lockmaw", "Lost City of the Tol'vir", 33438, 1054, 755},
{119, "High Prophet Barim", "Lost City of the Tol'vir", 34744, 1053, 755},
{122, "Siamat", "Lost City of the Tol'vir", 35388, 1055, 755},
{124, "Temple Guardian Anhuur", "Halls of Origination", 35067, 1080, 644},
{125, "Earthrager Ptah", "Halls of Origination", 31450, 1076, 644},
{126, "Anraphet", "Halls of Origination", 34580, 1075, 644},
{127, "Isiset, Construct of Magic", "Halls of Origination", 33465, 1077, 644},
{128, "Ammunae, Construct of Life", "Halls of Origination", 32943, 1074, 644},
{129, "Setesh, Construct of Destruction", "Halls of Origination", 33055, 1079, 644},
{130, "Rajh, Construct of Sun", "Halls of Origination", 33177, 1078, 644},
{131, "General Umbriss", "Grim Batol", 31498, 1051, 670},
{132, "Forgemaster Throngus", "Grim Batol", 33429, 1050, 670},
{133, "Drahga Shadowburner", "Grim Batol", 31792, 1048, 670},
{134, "Erudax, the Duke of Below", "Grim Batol", 33428, 1049, 670},
{335, "Sha of Doubt", "Temple of the Jade Serpent", 45980, 1439, 960},
{368, "Ghamoo-Ra", "Blackfathom Deeps", 52010, 1667, 48},
{369, "High Interrogator Gerstahn", "Blackrock Depths", 8761, 227, 230},
{370, "Lord Roccor", "Blackrock Depths", 5781, 228, 230},
{371, "Houndmaster Grebmar", "Blackrock Depths", 9212, 229, 230},
{372, "Ring of Law", "Blackrock Depths", 9329, 230, 230},
{373, "Pyromancer Loregrain", "Blackrock Depths", 8762, 231, 230},
{374, "Lord Incendius", "Blackrock Depths", 1204, 232, 230},
{375, "Warder Stilgiss", "Blackrock Depths", 9089, 233, 230},
{376, "Fineous Darkvire", "Blackrock Depths", 8704, 234, 230},
{377, "Bael'Gar", "Blackrock Depths", 12162, 235, 230},
{378, "General Angerforge", "Blackrock Depths", 8756, 236, 230},
{379, "Golem Lord Argelmach", "Blackrock Depths", 8759, 237, 230},
{380, "Hurley Blackbreath", "Blackrock Depths", 8658, 238, 230},
{381, "Phalanx", "Blackrock Depths", 8177, 239, 230},
{383, "Plugger Spazzring", "Blackrock Depths", 8652, 241, 230},
{384, "Ambassador Flamelash", "Blackrock Depths", 8329, 242, 230},
{385, "The Seven", "Blackrock Depths", 8687, 243, 230},
{386, "Magmus", "Blackrock Depths", 12162, 244, 230},
{387, "Emperor Dagran Thaurissan", "Blackrock Depths", 8807, 245, 230},
{388, "Highlord Omokk", "Lower Blackrock Spire", 11565, 267, 229},
{389, "Shadow Hunter Vosh'gajin", "Lower Blackrock Spire", 9732, 268, 229},
{390, "War Master Voone", "Lower Blackrock Spire", 28281, 269, 229},
{391, "Mother Smolderweb", "Lower Blackrock Spire", 36506, 270, 229},
{392, "Urok Doomhowl", "Lower Blackrock Spire", 11583, 271, 229},
{393, "Quartermaster Zigris", "Lower Blackrock Spire", 9738, 272, 229},
{394, "Halycon", "Lower Blackrock Spire", 9567, 274, 229},
{395, "Gizrul the Slavener", "Lower Blackrock Spire", 9564, 273, 229},
{396, "Overlord Wyrmthalak", "Lower Blackrock Spire", 8711, 275, 229},
{402, "Zevrim Thornhoof", "Dire Maul", 11335, 343, 429},
{403, "Hydrospawn", "Dire Maul", 5489, 344, 429},
{404, "Lethtendris", "Dire Maul", 21012, 345, 429},
{405, "Alzzin the Wildshaper", "Dire Maul", 14416, 346, 429},
{406, "Tendris Warpwood", "Dire Maul", 14383, 350, 429},
{407, "Illyanna Ravenoak", "Dire Maul", 11270, 347, 429},
{408, "Magister Kalendris", "Dire Maul", 14384, 348, 429},
{409, "Immol'thar", "Dire Maul", 14173, 349, 429},
{410, "Prince Tortheldrin", "Dire Maul", 11256, 361, 429},
{411, "Guard Mol'dar", "Dire Maul", 11561, 362, 429},
{412, "Stomper Kreeg", "Dire Maul", 11545, 363, 429},
{413, "Guard Fengus", "Dire Maul", 11561, 364, 429},
{414, "Guard Slip'kik", "Dire Maul", 11561, 365, 429},
{415, "Captain Kromcrush", "Dire Maul", 11564, 366, 429},
{416, "Cho'Rush the Observer", "Dire Maul", 11537, 367, 429},
{417, "King Gordok", "Dire Maul", 11583, 368, 429},
{418, "Crowd Pummeler 9-60", "Gnomeregan", 36560, 381, 90},
{419, "Grubbis", "Gnomeregan", 6533, 379, 90},
{420, "Viscous Fallout", "Gnomeregan", 36529, 378, 90},
{421, "Electrocutioner 6000", "Gnomeregan", 36558, 380, 90},
{422, "Mekgineer Thermaplugg", "Gnomeregan", 36563, 382, 90},
{423, "Noxxion", "Maraudon", 11172, 422, 349},
{424, "Razorlash", "Maraudon", 12389, 423, 349},
{425, "Tinkerer Gizlock", "Maraudon", 7125, 427, 349},
{426, "Subjugator Kor'ul", "Blackfathom Deeps", 52173, 1669, 48},
{427, "Lord Vyletongue", "Maraudon", 12334, 424, 349},
{428, "Celebras the Cursed", "Maraudon", 12350, 425, 349},
{429, "Landslide", "Maraudon", 12293, 426, 349},
{430, "Rotgrip", "Maraudon", 13589, 428, 349},
{431, "Princess Theradras", "Maraudon", 12292, 429, 349},
{433, "Mordresh Fire Eye", "Razorfen Downs", 52739, 1663, 129},
{436, "Domina", "Blackfathom Deeps", 52034, 1668, 48},
{437, "Twilight Lord Bathiel", "Blackfathom Deeps", 52283, 1671, 48},
{443, "Hearthsinger Forresten", "Stratholme", 10482, 473, 329},
{444, "Aku'mai", "Blackfathom Deeps", 62522, 1672, 48},
{445, "Timmy the Cruel", "Stratholme", 571, 474, 329},
{446, "Willey Hopebreaker", "Stratholme", 34480, 475, 329},
{447, "Guardian of the Deep", "Blackfathom Deeps", 75359, 1676, 48},
{448, "Instructor Galford", "Stratholme", 34498, 477, 329},
{449, "Balnazzar", "Stratholme", 34424, 478, 329},
{450, "The Unforgiven", "Stratholme", 10771, 472, 329},
{451, "Baroness Anastari", "Stratholme", 10698, 479, 329},
{452, "Nerub'enkan", "Stratholme", 9793, 480, 329},
{453, "Maleki the Pallid", "Stratholme", 10546, 481, 329},
{454, "Magistrate Barthilas", "Stratholme", 10433, 482, 329},
{455, "Ramstein the Gorger", "Stratholme", 12818, 483, 329},
{456, "Lord Aurius Rivendare", "Stratholme", 34837, 484, 329},
{457, "Avatar of Hakkar", "The Temple of Atal'hakkar", 8053, 492, 109},
{458, "Jammal'an the Prophet", "The Temple of Atal'hakkar", 6708, 488, 109},
{459, "Wardens of the Dream", "The Temple of Atal'hakkar", 7553, nil, 0},
{463, "Shade of Eranikus", "The Temple of Atal'hakkar", 7806, 493, 109},
{464, "Hogger", "The Stockade", 108956, 1144, 34},
{465, "Lord Overheat", "The Stockade", 1204, 1145, 34},
{466, "Randolph Moloch", "The Stockade", 35068, 1146, 34},
{467, "Revelosh", "Uldaman", 5945, 547, 70},
{468, "The Lost Dwarves", "Uldaman", 5710, 548, 70},
{469, "Ironaya", "Uldaman", 6089, 549, 70},
{470, "Ancient Stone Keeper", "Uldaman", 10798, 551, 70},
{471, "Galgann Firehammer", "Uldaman", 6059, 552, 70},
{472, "Grimlok", "Uldaman", 11165, 553, 70},
{473, "Archaedas", "Uldaman", 5988, 554, 70},
{474, "Lady Anacondra", "Wailing Caverns", 4313, 585, 43},
{475, "Lord Cobrahn", "Wailing Caverns", 4213, 586, 43},
{476, "Lord Pythas", "Wailing Caverns", 4214, 588, 43},
{477, "Kresh", "Wailing Caverns", 5126, 587, 43},
{478, "Skum", "Wailing Caverns", 4203, 589, 43},
{479, "Lord Serpentis", "Wailing Caverns", 4215, 590, 43},
{480, "Verdan the Everliving", "Wailing Caverns", 4256, 591, 43},
{481, "Mutanus the Devourer", "Wailing Caverns", 4088, 592, 43},
{483, "Gahz'rilla", "Zul'Farrak", 7271, 594, 209},
{484, "Antu'sul", "Zul'Farrak", 7353, 595, 209},
{485, "Theka the Martyr", "Zul'Farrak", 6696, 596, 209},
{486, "Witch Doctor Zum'rah", "Zul'Farrak", 6434, 597, 209},
{487, "Nekrum & Sezz'ziz", "Zul'Farrak", 6690, 598, 209},
{489, "Chief Ukorz Sandscalp", "Zul'Farrak", 6439, 600, 209},
{523, "Shirrak the Dead Watcher", "Auchenai Crypts", 18916, 1890, 558},
{524, "Exarch Maladaar", "Auchenai Crypts", 17715, 1889, 558},
{527, "Watchkeeper Gargolmar", "Hellfire Ramparts", 18236, 1893, 543},
{528, "Omor the Unscarred", "Hellfire Ramparts", 18237, 1891, 543},
{529, "Vazruden the Herald", "Hellfire Ramparts", 18944, 1892, 543},
{530, "Selin Fireheart", "Magisters' Terrace", 22642, 1897, 585},
{531, "Vexallus", "Magisters' Terrace", 22731, 1898, 585},
{532, "Priestess Delrissa", "Magisters' Terrace", 22596, 1895, 585},
{533, "Kael'thas Sunstrider", "Magisters' Terrace", 22906, 1894, 585},
{534, "Pandemonius", "Mana-Tombs", 71757, 1900, 557},
{535, "Tavarok", "Mana-Tombs", 19332, 1901, 557},
{536, "Yor", "Mana-Tombs", 14173, 250, 557},
{537, "Nexus-Prince Shaffar", "Mana-Tombs", 19780, 1899, 557},
{538, "Lieutenant Drake", "Old Hillsbrad Foothills", 17386, 1905, 560},
{539, "Captain Skarloc", "Old Hillsbrad Foothills", 17387, 1907, 560},
{540, "Epoch Hunter", "Old Hillsbrad Foothills", 19135, 1906, 560},
{541, "Darkweaver Syth", "Sethekk Halls", 20599, 1903, 556},
{542, "Anzu", "Sethekk Halls", 21492, 1904, 556},
{543, "Talon King Ikiss", "Sethekk Halls", 18636, 1902, 556},
{544, "Ambassador Hellmaw", "Shadow Labyrinth", 18821, 1908, 555},
{545, "Blackheart the Inciter", "Shadow Labyrinth", 18058, 1909, 555},
{546, "Grandmaster Vorpil", "Shadow Labyrinth", 18535, 1911, 555},
{547, "Murmur", "Shadow Labyrinth", 18839, 1910, 555},
{548, "Zereketh the Unbound", "The Arcatraz", 19882, 1916, 552},
{549, "Dalliah the Doomsayer", "The Arcatraz", 19888, 1913, 552},
{550, "Wrath-Scryer Soccothrates", "The Arcatraz", 19977, 1915, 552},
{551, "Harbinger Skyriss", "The Arcatraz", 19943, 1914, 552},
{552, "Chrono Lord Deja", "The Black Morass", 20513, 1920, 269},
{553, "Temporus", "The Black Morass", 19066, 1921, 269},
{554, "Aeonus", "The Black Morass", 20510, 1919, 269},
{555, "The Maker", "The Blood Furnace", 18369, 1922, 542},
{556, "Broggok", "The Blood Furnace", 19372, 1924, 542},
{557, "Keli'dan the Breaker", "The Blood Furnace", 17153, 1923, 542},
{558, "Commander Sarannis", "The Botanica", 18929, 1925, 553},
{559, "High Botanist Freywinn", "The Botanica", 19045, 1926, 553},
{560, "Thorngrin the Tender", "The Botanica", 14416, 1928, 553},
{561, "Laj", "The Botanica", 13109, 1927, 553},
{562, "Warp Splinter", "The Botanica", 19438, 1929, 553},
{563, "Mechano-Lord Capacitus", "The Mechanar", 19162, 1932, 554},
{564, "Nethermancer Sepethrea", "The Mechanar", 19166, 1930, 554},
{565, "Pathaleon the Calculator", "The Mechanar", 20033, 1931, 554},
{566, "Grand Warlock Nethekurse", "The Shattered Halls", 16628, 1936, 540},
{568, "Warbringer O'mrogg", "The Shattered Halls", 18031, 1937, 540},
{569, "Warchief Kargath Bladefist", "The Shattered Halls", 19799, 1938, 540},
{570, "Mennu the Betrayer", "The Slave Pens", 17728, 1939, 547},
{571, "Rokmar the Crackler", "The Slave Pens", 17729, 1941, 547},
{572, "Quagmirran", "The Slave Pens", 18224, 1940, 547},
{573, "Hydromancer Thespia", "The Steamvault", 11268, 1942, 545},
{574, "Mekgineer Steamrigger", "The Steamvault", 18638, 1943, 545},
{575, "Warlord Kalithresh", "The Steamvault", 20235, 1944, 545},
{576, "Hungarfen", "The Underbog", 17228, 1946, 546},
{577, "Ghaz'an", "The Underbog", 17528, 1945, 546},
{578, "Swamplord Musel'ek", "The Underbog", 18570, 1947, 546},
{579, "The Black Stalker", "The Underbog", 18194, 1948, 546},
{580, "Elder Nadox", "Ahn'kahet: The Old Kingdom", 27407, 1969, 619},
{581, "Prince Taldaram", "Ahn'kahet: The Old Kingdom", 27406, 1966, 619},
{582, "Jedoga Shadowseeker", "Ahn'kahet: The Old Kingdom", 26777, 1967, 619},
{583, "Amanitar", "Ahn'kahet: The Old Kingdom", 28133, 1989, 619},
{584, "Herald Volazj", "Ahn'kahet: The Old Kingdom", 27408, 1968, 619},
{585, "Krik'thir the Gatewatcher", "Azjol-Nerub", 27394, 1971, 601},
{586, "Hadronox", "Azjol-Nerub", 26776, 1972, 601},
{587, "Anub'arak", "Azjol-Nerub", 27856, 1973, 601},
{588, "Trollgore", "Drak'Tharon Keep", 26352, 1974, 600},
{589, "Novos the Summoner", "Drak'Tharon Keep", 26292, 1976, 600},
{590, "King Dred", "Drak'Tharon Keep", 5240, 1977, 600},
{591, "The Prophet Tharon'ja", "Drak'Tharon Keep", 27072, 1975, 600},
{592, "Slad'ran", "Gundrak", 27422, 1978, 604},
{593, "Drakkari Colossus", "Gundrak", 26589, 1983, 604},
{594, "Moorabi", "Gundrak", 27059, 1980, 604},
{595, "Eck the Ferocious", "Gundrak", 26644, 1988, 604},
{596, "Gal'darah", "Gundrak", 27061, 1981, 604},
{597, "General Bjarngrim", "Halls of Lightning", 27301, 1987, 602},
{598, "Volkhan", "Halls of Lightning", 27071, 1985, 602},
{599, "Ionar", "Halls of Lightning", 27484, 1984, 602},
{600, "Loken", "Halls of Lightning", 27485, 1986, 602},
{601, "Falric", "Halls of Reflection", 30972, 1992, 668},
{602, "Marwyn", "Halls of Reflection", 30973, 1993, 668},
{603, "Escape from Arthas", "Halls of Reflection", 30721, 1990, 668},
{604, "Krystallus", "Halls of Stone", 20909, 1994, 599},
{605, "Maiden of Grief", "Halls of Stone", 26657, 1996, 599},
{606, "Tribunal of Ages", "Halls of Stone", 26353, 1995, 599},
{607, "Sjonnir the Ironshaper", "Halls of Stone", 27483, 1998, 599},
{608, "Forgemaster Garfrost", "Pit of Saron", 30843, 1999, 658},
{609, "Ick & Krick", "Pit of Saron", 30331, 2001, 658},
{610, "Scourgelord Tyrannus", "Pit of Saron", 30277, 2000, 658},
{611, "Meathook", "The Culling of Stratholme", 26579, 2002, 595},
{612, "Salramm the Fleshcrafter", "The Culling of Stratholme", 26581, 2004, 595},
{613, "Chrono-Lord Epoch", "The Culling of Stratholme", 26580, 2003, 595},
{614, "Mal'Ganis", "The Culling of Stratholme", 26582, 2005, 595},
{615, "Bronjahm", "The Forge of Souls", 30226, 2006, 632},
{616, "Devourer of Souls", "The Forge of Souls", 30148, 2007, 632},
{617, "Commander Stoutbeard", "The Nexus", 24366, 519, 576},
{618, "Grand Magus Telestra", "The Nexus", 24066, 521, 576},
{619, "Anomalus", "The Nexus", 26259, 522, 576},
{620, "Ormorok the Tree-Shaper", "The Nexus", 26298, 524, 576},
{621, "Keristrasza", "The Nexus", 24307, 527, 576},
{622, "Drakos the Interrogator", "The Oculus", 27032, 528, 578},
{623, "Varos Cloudstrider", "The Oculus", 27033, 530, 578},
{624, "Mage-Lord Urom", "The Oculus", 25010, 533, 578},
{625, "Ley-Guardian Eregos", "The Oculus", 27034, 534, 578},
{626, "Erekem", "The Violet Hold", 27488, nil, nil},
{627, "Moragg", "The Violet Hold", 20590, nil, nil},
{628, "Ichoron", "The Violet Hold", 27487, nil, nil},
{629, "Xevozz", "The Violet Hold", 27486, nil, nil},
{630, "Lavanthor", "The Violet Hold", 10193, nil, nil},
{631, "Zuramat the Obliterator", "The Violet Hold", 27855, nil, nil},
{632, "Cyanigosa", "The Violet Hold", 27508, 2020, 608},
{634, "Grand Champions", "Trial of the Champion", 28587, 2022, 650},
{635, "Eadric the Pure", "Trial of the Champion", 29616, 2022, 650},
{636, "Argent Confessor Paletress", "Trial of the Champion", 29490, 2022, 650},
{637, "The Black Knight", "Trial of the Champion", 29837, 2021, 650},
{638, "Prince Keleseth", "Utgarde Keep", 25338, 2026, 574},
{639, "Skarvald & Dalronn", "Utgarde Keep", 24605, 2024, 574},
{640, "Ingvar the Plunderer", "Utgarde Keep", 21953, 2025, 574},
{641, "Svala Sorrowgrave", "Utgarde Pinnacle", 26096, 2030, 575},
{642, "Gortok Palehoof", "Utgarde Pinnacle", 27419, 2027, 575},
{643, "Skadi the Ruthless", "Utgarde Pinnacle", 27418, 2029, 575},
{644, "King Ymiron", "Utgarde Pinnacle", 28019, 2028, 575},
{649, "Raigonn", "Gate of the Setting Sun", 39519, 1419, 962},
{654, "Armsmaster Harlan", "Scarlet Halls", 40293, 1421, 1001},
{655, "Saboteur Kip'tilak", "Gate of the Setting Sun", 43122, 1397, 962},
{656, "Flameweaver Koegler", "Scarlet Halls", 40597, 1420, 1001},
{657, "Master Snowdrift", "Shado-Pan Monastery", 41902, 1304, 959},
{658, "Liu Flameheart", "Temple of the Jade Serpent", 39487, 1416, 960},
{659, "Instructor Chillheart", "Scholomance", 40301, 1426, 1007},
{660, "Houndmaster Braun", "Scarlet Halls", 42264, 1422, 1001},
{663, "Jandice Barov", "Scholomance", 40639, 1427, 1007},
{664, "Lorewalker Stonestep", "Temple of the Jade Serpent", 39506, 1417, 960},
{665, "Rattlegore", "Scholomance", 31092, 1428, 1007},
{666, "Lilian Voss", "Scholomance", 40256, 1429, 1007},
{668, "Ook-Ook", "Stormstout Brewery", 39498, 1412, 961},
{669, "Hoptallus", "Stormstout Brewery", 40339, 1413, 961},
{670, "Yan-Zhu the Uncasked", "Stormstout Brewery", 42969, 1414, 961},
{671, "Brother Korloff", "Scarlet Monastery", 41154, 1424, 1004},
{672, "Wise Mari", "Temple of the Jade Serpent", 41125, 1418, 960},
{673, "Gu Cloudstrike", "Shado-Pan Monastery", 39489, 1303, 959},
{674, "High Inquisitor Whitemane", "Scarlet Monastery", 2043, 1425, 1004},
{675, "Striker Ga'dok", "Gate of the Setting Sun", 43275, 1405, 962},
{676, "Commander Ri'mok", "Gate of the Setting Sun", 43286, 1406, 962},
{684, "Darkmaster Gandling", "Scholomance", 40322, 1430, 1007},
{685, "Sha of Violence", "Shado-Pan Monastery", 43283, 1305, 959},
{686, "Taran Zhu", "Shado-Pan Monastery", 41121, 1306, 959},
{687, "The Spirit Kings", "Mogu'shan Vaults", 41813, 1436, 1008},
{688, "Thalnos the Soulrender", "Scarlet Monastery", 27705, 1423, 1004},
{690, "Gekkan", "Mogu'shan Palace", 41920, 2129, 994},
{692, "General Pa'valak", "Siege of Niuzao Temple", 43120, 1447, 1011},
{693, "Vizier Jin'bak", "Siege of Niuzao Temple", 43197, 1465, 1011},
{694, "Adarogg", "Ragefire Chasm", 38759, 1443, 389},
{695, "Dark Shaman Koranthal", "Ragefire Chasm", 42101, 1444, 389},
{696, "Slagmaw", "Ragefire Chasm", 38391, 1445, 389},
{697, "Lava Guard Gordoth", "Ragefire Chasm", 42100, 1446, 389},
{698, "Xin the Weaponmaster", "Mogu'shan Palace", 41987, 1441, 994},
{708, "Trial of the King", "Mogu'shan Palace", 42058, 1442, 994},
{713, "Garalon", "Heart of Fear", 42368, 1463, 1009},
{727, "Wing Leader Ner'onok", "Siege of Niuzao Temple", 43151, 1464, 1011},
{728, "Blood Guard Porung", "The Shattered Halls", 17725, 1935, 540},
{738, "Commander Vo'jak", "Siege of Niuzao Temple", 42169, 1502, 1011},
{748, "Obsidian Sentinel", "Uldaman", 5285, 1887, 70},
{749, "Commander Malor", "Stratholme", 34463, 476, 329},
{833, "Commander Kolurg", "The Nexus", 24352, 519, 576},
{834, "Grand Champions", "Trial of the Champion", 28560, 2022, 650},
{887, "Roltall", "Bloodmaul Slag Mines", 54259, 1652, 1175},
{888, "Slave Watcher Crushto", "Bloodmaul Slag Mines", 52893, 1653, 1175},
{889, "Gug'rokk", "Bloodmaul Slag Mines", 52902, 1654, 1175},
{893, "Magmolatus", "Bloodmaul Slag Mines", 52899, 1655, 1175},
{895, "Roogug", "Razorfen Kraul", 52383, 438, 47},
{896, "Hunter Bonetusk", "Razorfen Kraul", 52047, 1656, 47},
{899, "Warlord Ramtusk", "Razorfen Kraul", 52515, 1659, 47},
{900, "Groyat, the Blind Hunter", "Razorfen Kraul", 52595, 1660, 47},
{901, "Charlga Razorflank", "Razorfen Kraul", 31042, 1661, 47},
{965, "Ranjit", "Skyreach", 56015, 1698, 1209},
{966, "Araknath", "Skyreach", 54006, 1699, 1209},
{967, "Rukhran", "Skyreach", 59007, 1700, 1209},
{968, "High Sage Viryx", "Skyreach", 56016, 1701, 1209},
{1139, "Sadana Bloodfury", "Shadowmoon Burial Grounds", 54587, 1677, 1176},
{1140, "Bonemaw", "Shadowmoon Burial Grounds", 59273, 1679, 1176},
{1141, "Amnennar the Coldbringer", "Razorfen Downs", 32610, 1666, 129},
{1142, "Aarux", "Razorfen Downs", 27683, 1662, 129},
{1143, "Mushlump", "Razorfen Downs", 52354, 1664, 129},
{1144, "Executioner Gore", "Blackfathom Deeps", 52084, 1670, 48},
{1145, "Thruk", "Blackfathom Deeps", 52057, 1675, 48},
{1146, "Death Speaker Blackthorn", "Razorfen Downs", 4644, 1665, 129},
{1160, "Ner'zhul", "Shadowmoon Burial Grounds", 52769, 1682, 1176},
{1168, "Nhallish", "Shadowmoon Burial Grounds", 59978, 1688, 1176},
{1185, "Vigilant Kaathar", "Auchindoun", 58263, 1686, 1182},
{1186, "Soulbinder Nyami", "Auchindoun", 53089, 1685, 1182},
{1216, "Azzakel", "Auchindoun", 52964, 1678, 1182},
{1225, "Teron'gor", "Auchindoun", 54036, 1714, 1182},
{1226, "Orebender Gor'ashan", "Upper Blackrock Spire", 53177, 1761, 1358},
{1227, "Kyrak", "Upper Blackrock Spire", 53005, 1758, 1358},
{1228, "Commander Tharbek", "Upper Blackrock Spire", 53689, 1759, 1358},
{1229, "Ragewing the Untamed", "Upper Blackrock Spire", 53646, 1760, 1358},
{1234, "Warlord Zaela", "Upper Blackrock Spire", 54683, 1762, 1358},
{1235, "Fleshrender Nok'gar", "Iron Docks", 56351, 1749, 1195},
{1236, "Grimrail Enforcers", "Iron Docks", 56033, 1748, 1195},
{1237, "Oshir", "Iron Docks", 55352, 1750, 1195},
{1238, "Skulloc", "Iron Docks", 57836, 1754, 1195},
{1467, "Tirathon Saltheril", "Vault of the Wardens", 65074, 1815, 1493},
{1468, "Ash'golm", "Vault of the Wardens", 65155, 1816, 1493},
{1469, "Glazer", "Vault of the Wardens", 66204, 1817, 1493},
{1470, "Cordana Felsong", "Vault of the Wardens", 66480, 1818, 1493},
{1479, "Serpentrix", "Eye of Azshara", 65110, 1813, 1456},
{1480, "Warlord Parjesh", "Eye of Azshara", 65114, 1810, 1456},
{1485, "Hymdall", "Halls of Valor", 67773, 1805, 1477},
{1486, "Hyrja", "Halls of Valor", 65076, 1806, 1477},
{1487, "Fenryr", "Halls of Valor", 64466, 1807, 1477},
{1488, "God-King Skovald", "Halls of Valor", 65873, 1808, 1477},
{1489, "Odyn", "Halls of Valor", 67230, 1809, 1477},
{1490, "Lady Hatecoil", "Eye of Azshara", 66397, 1811, 1456},
{1491, "King Deepbeard", "Eye of Azshara", 67254, 1812, 1456},
{1492, "Wrath of Azshara", "Eye of Azshara", 66741, 1814, 1456},
{1502, "Ymiron, the Fallen King", "Maw of Souls", 65079, 1822, 1492},
{1512, "Harbaron", "Maw of Souls", 67556, 1823, 1492},
{1518, "The Amalgam of Souls", "Black Rook Hold", 65837, 1832, 1501},
{1653, "Illysanna Ravencrest", "Black Rook Hold", 65951, 1833, 1501},
{1654, "Archdruid Glaidalis", "Darkheart Thicket", 69815, 1836, 1466},
{1655, "Oakheart", "Darkheart Thicket", 68127, 1837, 1466},
{1656, "Dresaron", "Darkheart Thicket", 69096, 1838, 1466},
{1657, "Shade of Xavius", "Darkheart Thicket", 68730, 1839, 1466},
{1662, "Rokmora", "Neltharion's Lair", 62386, 1790, 1458},
{1663, "Helya", "Maw of Souls", 65043, 1824, 1492},
{1664, "Smashspite the Hateful", "Black Rook Hold", 65304, 1834, 1501},
{1665, "Ularogg Cragshaper", "Neltharion's Lair", 62390, 1791, 1458},
{1672, "Lord Kur'talos Ravencrest", "Black Rook Hold", 64656, 1835, 1501},
{1673, "Naraxas", "Neltharion's Lair", 62391, 1792, 1458},
{1686, "Mindflayer Kaahrj", "Assault on Violet Hold", 67433, 1846, 1544},
{1687, "Dargrul the Underking", "Neltharion's Lair", 62392, 1793, 1458},
{1688, "Millificent Manastorm", "Assault on Violet Hold", 67422, 1847, 1544},
{1693, "Festerface", "Assault on Violet Hold", 31006, 1848, 1544},
{1694, "Shivermaw", "Assault on Violet Hold", 27767, 1845, 1544},
{1695, "Inquisitor Tormentorum", "Vault of the Wardens", 64719, 1850, 1493},
{1696, "Anub'esset", "Assault on Violet Hold", 67630, 1852, 1544},
{1697, "Sael'orn", "Assault on Violet Hold", 67636, 1851, 1544},
{1702, "Blood-Princess Thal'ena", "Assault on Violet Hold", 67638, 1855, 1544},
{2030, "Yazma", "Atal'Dazar", 79568, 2087, 1763},
{2036, "Vol'kaal", "Atal'Dazar", 79453, 2085, 1763},
{2082, "Priestess Alun'za", "Atal'Dazar", 80293, 2084, 1763},
{2083, "Rezan", "Atal'Dazar", 78188, 2086, 1763},
{2093, "Council o' Captains", "Freehold", 80346, 2094, 1754},
{2094, "Ring of Booty", "Freehold", 55657, 2095, 1754},
{2095, "Harlan Sweete", "Freehold", 80008, 2096, 1754},
{2096, "Overseer Korgus", "Tol Dagor", 81505, 2104, 1771},
{2097, "The Sand Queen", "Tol Dagor", 82983, 2101, 1771},
{2098, "Jes Howlis", "Tol Dagor", 81739, 2102, 1771},
{2099, "Knight Captain Valyri", "Tol Dagor", 81498, 2103, 1771},
{2102, "Skycap'n Kragg", "Freehold", 80382, 2093, 1754},
{2109, "Coin-Operated Crowd Pummeler", "The MOTHERLODE!!", 80443, 2105, 1594},
{2114, "Azerokk", "The MOTHERLODE!!", 83891, 2106, 1594},
{2115, "Rixxa Fluxflame", "The MOTHERLODE!!", 81489, 2107, 1594},
{2116, "Mogul Razdunk", "The MOTHERLODE!!", 81816, 2108, 1594},
{2125, "Heartsbane Triad", "Waycrest Manor", 81996, 2113, 1862},
{2126, "Soulbound Goliath", "Waycrest Manor", 79398, 2114, 1862},
{2127, "Raal the Gluttonous", "Waycrest Manor", 83656, 2115, 1862},
{2128, "Lord and Lady Waycrest", "Waycrest Manor", 83349, 2116, 1862},
{2129, "Gorak Tul", "Waycrest Manor", 85983, 2117, 1862},
{2130, "Sporecaller Zancha", "The Underrot", 81977, 2112, 1841},
{2131, "Cragmaw the Infested", "The Underrot", 82072, 2118, 1841},
{2142, "Adderis and Aspix", "Temple of Sethraliss", 80545, 2124, 1877},
{2143, "Merektha", "Temple of Sethraliss", 88585, 2125, 1877},
{2144, "Galvazzt", "Temple of Sethraliss", 81654, 2126, 1877},
{2145, "Avatar of Sethraliss", "Temple of Sethraliss", 83203, 2127, 1877},
{2153, "Aqu'sirr", "Shrine of the Storm", 85628, 2130, 1864},
{2154, "Tidesage Council", "Shrine of the Storm", 84679, 2131, 1864},
{2155, "Lord Stormsong", "Shrine of the Storm", 80996, 2132, 1864},
{2156, "Vol'zith the Whisperer", "Shrine of the Storm", 84370, 2133, 1864},
{2157, "Elder Leaxa", "The Underrot", 82394, 2111, 1841},
{2158, "Unbound Abomination", "The Underrot", 86632, 2123, 1841},
{2387, "Echelon", "Halls of Atonement", 95060, 2380, 2287},
{2388, "Kryxis the Voracious", "Sanguine Depths", 93853, 2360, 2284},
{2389, "Kul'tharok", "Theater of Pain", 96088, 2364, 2293},
{2390, "Xav the Unfallen", "Theater of Pain", 95439, 2366, 2293},
{2391, "Amarth, The Harvester", "The Necrotic Wake", 95231, 2388, 2286},
{2392, "Surgeon Stitchflesh", "The Necrotic Wake", 96477, 2389, 2286},
{2395, "Blightbone", "The Necrotic Wake", 95467, 2387, 2286},
{2396, "Nalthor the Rimebinder", "The Necrotic Wake", 96085, 2390, 2286},
{2397, "An Affront of Challengers", "Theater of Pain", 96820, 2391, 2293},
{2398, "Dealer Xy'exa", "De Other Side", 93596, 2400, 2291},
{2399, "Kin-Tara", "Spires of Ascension", 93471, 2357, 2285},
{2400, "Ingra Maloch", "Mists of Tirna Scithe", 95497, 2397, 2290},
{2401, "Gorechop", "Theater of Pain", 95106, 2365, 2293},
{2402, "Mistcaller", "Mists of Tirna Scithe", 96451, 2392, 2290},
{2403, "Doctor Ickus", "Plaguefall", 96919, 2384, 2289},
{2404, "Margrave Stradama", "Plaguefall", 95794, 2386, 2289},
{2405, "Tred'ova", "Mists of Tirna Scithe", 95809, 2393, 2290},
{2406, "Halkias, the Sin-Stained Goliath", "Halls of Atonement", 94941, 2401, 2287},
{2407, "General Kaal", "Sanguine Depths", 95721, 2363, 2284},
{2408, "Hakkar the Soulflayer", "De Other Side", 95484, 2395, 2291},
{2409, "The Manastorms", "De Other Side", 67422, 2394, 2291},
{2410, "Mueh'zala", "De Other Side", 96358, 2396, 2291},
{2411, "High Adjudicator Aleez", "Halls of Atonement", 94503, 2403, 2287},
{2412, "Devos, Paragon of Doubt", "Spires of Ascension", 95665, 2359, 2285},
{2413, "Lord Chamberlain", "Halls of Atonement", 95103, 2381, 2287},
{2414, "Oryphrion", "Spires of Ascension", 93502, 2358, 2285},
{2415, "Executor Tarvold", "Sanguine Depths", 96156, 2361, 2284},
{2416, "Ventunax", "Spires of Ascension", 92193, 2356, 2285},
{2417, "Mordretha, the Endless Empress", "Theater of Pain", 96078, 2404, 2293},
{2419, "Globgrog", "Plaguefall", 95844, 2382, 2289},
{2421, "Grand Proctor Beryllia", "Sanguine Depths", 94781, 2362, 2284},
{2423, "Domina Venomblade", "Plaguefall", 96475, 2385, 2289}
}

--Each entry in the table has 3 values:
-- 1 The name of the dungeon.
-- 2 The name of the Elite
-- 3 A number indicating the amount of that Elite there is in the dungeon.

local dungeonEliteArray = {
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
{"Blackrock Depths", "Anvilrage Captain", 1},
{"Blackrock Depths", "Anvilrage Footman", 1},
{"Blackrock Depths", "Anvilrage Guardsman", 1},
{"Blackrock Depths", "Anvilrage Marshal", 1},
{"Blackrock Depths", "Anvilrage Medic", 1},
{"Blackrock Depths", "Anvilrage Officer", 1},
{"Blackrock Depths", "Anvilrage Overseer", 1},
{"Blackrock Depths", "Anvilrage Soldier", 1},
{"Blackrock Depths", "Anvilrage Warden", 1},
{"Blackrock Depths", "Blackbreath Crony", 1},
{"Blackrock Depths", "Blazing Fireguard", 1},
{"Blackrock Depths", "Dark Guard", 1},
{"Blackrock Depths", "Doomforge Dragoon", 1},
{"Blackrock Depths", "Fireguard", 1},
{"Blackrock Depths", "Fireguard Destroyer", 1},
{"Blackrock Depths", "High Justice Grimstone", 1},
{"Blackrock Depths", "Korv", 1},
{"Blackrock Depths", "Lefty", 1},
{"Blackrock Depths", "Malgen Longspear", 1},
{"Blackrock Depths", "Molten War Golem", 1},
{"Blackrock Depths", "Ragereaver Golem", 1},
{"Blackrock Depths", "Ribbly's Crony", 1},
{"Blackrock Depths", "Rotfang", 1},
{"Blackrock Depths", "Snokh Blackspine", 1},
{"Blackrock Depths", "Twilight Bodyguard", 1},
{"Blackrock Depths", "Twilight Emissary", 1},
{"Blackrock Depths", "Twilight's Hammer Torturer", 1},
{"Blackrock Depths", "Ursula Direbrew", 1},
{"Blackrock Depths", "Warbringer Construct", 1},
{"Blackrock Depths", "Wrath Hammer Construct", 1},
{"Blackrock Spire", "Bloodaxe Evoker", 1},
{"Blackrock Spire", "Bloodaxe Raider", 1},
{"Blackrock Spire", "Bloodaxe Summoner", 1},
{"Blackrock Spire", "Bloodaxe Veteran", 1},
{"Blackrock Spire", "Bloodaxe Warmonger", 1},
{"Blackrock Spire", "Firebrand Darkweaver", 1},
{"Blackrock Spire", "Firebrand Dreadweaver", 1},
{"Blackrock Spire", "Firebrand Grunt", 1},
{"Blackrock Spire", "Firebrand Invoker", 1},
{"Blackrock Spire", "Firebrand Legionnaire", 1},
{"Blackrock Spire", "Firebrand Pyromancer", 1},
{"Blackrock Spire", "Scarshield Acolyte", 1},
{"Blackrock Spire", "Scarshield Legionnaire", 1},
{"Blackrock Spire", "Scarshield Raider", 1},
{"Blackrock Spire", "Scarshield Spellbinder", 1},
{"Blackrock Spire", "Scarshield Warlock", 1},
{"Blackrock Spire", "Smolderthorn Axe Thrower", 1},
{"Blackrock Spire", "Smolderthorn Berserker", 1},
{"Blackrock Spire", "Smolderthorn Headhunter", 1},
{"Blackrock Spire", "Smolderthorn Mystic", 1},
{"Blackrock Spire", "Smolderthorn Seer", 1},
{"Blackrock Spire", "Smolderthorn Shadow Hunter", 1},
{"Blackrock Spire", "Smolderthorn Shadow Priest", 1},
{"Blackrock Spire", "Smolderthorn Witch Doctor", 1},
{"Blackrock Spire", "Spire Spider", 1},
{"Blackrock Spire", "Spirestone Battle Mage", 1},
{"Blackrock Spire", "Spirestone Enforcer", 1},
{"Blackrock Spire", "Spirestone Mystic", 1},
{"Blackrock Spire", "Spirestone Ogre Magus", 1},
{"Blackrock Spire", "Spirestone Reaver", 1},
{"Blackrock Spire", "Spirestone Warlord", 1},
{"Blackrock Spire", "Urok Enforcer", 1},
{"Blackrock Spire", "Urok Ogre Magus", 1},
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
{"Pit of Saron", "Alliance Slave", 1},
{"Pit of Saron", "Archmage Elandra", 1},
{"Pit of Saron", "Archmage Koreln", 1},
{"Pit of Saron", "Coliseum Champion", 1},
{"Pit of Saron", "Dark Ranger Kalira", 1},
{"Pit of Saron", "Dark Ranger Loralen", 1},
{"Pit of Saron", "Deathwhisper Necrolyte", 1},
{"Pit of Saron", "Deathwhisper Shadowcaster", 1},
{"Pit of Saron", "Deathwhisper Torturer", 1},
{"Pit of Saron", "Disturbed Glacial Revenant", 1},
{"Pit of Saron", "Fallen Warrior", 1},
{"Pit of Saron", "Freed Alliance Slave", 1},
{"Pit of Saron", "Freed Horde Slave", 1},
{"Pit of Saron", "Geist Ambusher", 1},
{"Pit of Saron", "Gorkun Ironskull", 1},
{"Pit of Saron", "Horde Slave", 1},
{"Pit of Saron", "Hungering Ghoul", 1},
{"Pit of Saron", "Iceborn Proto-Drake", 1},
{"Pit of Saron", "Plagueborn Horror", 1},
{"Pit of Saron", "Rimefang", 1},
{"Pit of Saron", "Scourgelord Tyrannus", 1},
{"Pit of Saron", "Skeletal Slave", 1},
{"Pit of Saron", "Spider", 1},
{"Pit of Saron", "Stonespine Gargoyle", 1},
{"Pit of Saron", "Wrathbone Coldwraith", 1},
{"Pit of Saron", "Wrathbone Laborer", 1},
{"Pit of Saron", "Wrathbone Reaver", 1},
{"Pit of Saron", "Wrathbone Siegesmith", 1},
{"Pit of Saron", "Wrathbone Skeleton", 1},
{"Pit of Saron", "Wrathbone Sorcerer", 1},
{"Pit of Saron", "Ymijar Deathbringer", 1},
{"Pit of Saron", "Ymijar Flamebearer", 1},
{"Pit of Saron", "Ymijar Skycaller", 1},
{"Pit of Saron", "Ymijar Wrathbringer", 1},
{"The Forge of Souls", "Coliseum Champion", 1},
{"The Forge of Souls", "Corrupted Soul Fragment", 1},
{"The Forge of Souls", "Crucible of souls", 1},
{"The Forge of Souls", "Ghoul Minion", 1},
{"The Forge of Souls", "Soul Horror", 1},
{"The Forge of Souls", "Soulguard Adept", 1},
{"The Forge of Souls", "Soulguard Animator", 1},
{"The Forge of Souls", "Soulguard Bonecaster", 1},
{"The Forge of Souls", "Soulguard Reaper", 1},
{"The Forge of Souls", "Soulguard Watchman", 1},
{"The Forge of Souls", "Spectral Warden", 1},
{"The Forge of Souls", "Spiteful Apparition", 1},
{"Halls of Reflection", "Frostworn General", 1},
{"Halls of Reflection", "Ghostly Priest", 1},
{"Halls of Reflection", "High Captain Justin Bartlett", 1},
{"Halls of Reflection", "Kor'kron Reaver", 1},
{"Halls of Reflection", "Lumbering Abomination", 1},
{"Halls of Reflection", "Orgrim's Hammer Crew", 1},
{"Halls of Reflection", "Orgrim's Hammer Engineer", 1},
{"Halls of Reflection", "Orgrim's Hammer Gunner", 1},
{"Halls of Reflection", "Phantom Hallucination", 1},
{"Halls of Reflection", "Phantom Mage", 1},
{"Halls of Reflection", "Quel'Delar", 1},
{"Halls of Reflection", "Raging Ghoul", 1},
{"Halls of Reflection", "Risen Witch Doctor", 1},
{"Halls of Reflection", "Shadowy Mercenary", 1},
{"Halls of Reflection", "Sky-Reaver Korm Blackscar", 1},
{"Halls of Reflection", "Skybreaker Deckhand", 1},
{"Halls of Reflection", "Skybreaker Shield-Mage", 1},
{"Halls of Reflection", "Skybreaker Footman", 1},
{"Halls of Reflection", "Spiritual Reflection", 1},
{"Halls of Reflection", "Tortured Rifleman", 1},
{"Halls of Reflection", "Utamu", 1},
{"Halls of Reflection", "Vindicator Maraad", 1},
{"The Nexus", "Alliance Berserker", 1},
{"The Nexus", "Alliance Cleric", 1},
{"The Nexus", "Alliance Commander", 1},
{"The Nexus", "Alliance Ranger", 1},
{"The Nexus", "Azure Enforcer", 1},
{"The Nexus", "Azure Magus", 1},
{"The Nexus", "Azure Scale-Binder", 1},
{"The Nexus", "Azure Warder", 1},
{"The Nexus", "Chaotic Rift", 1},
{"The Nexus", "Crazed Mana-Surge", 1},
{"The Nexus", "Crazed Mana-Wraith", 1},
{"The Nexus", "Crystalline Frayer", 1},
{"The Nexus", "Crystalline Keeper", 1},
{"The Nexus", "Crystalline Protector", 1},
{"The Nexus", "Crystalline Tender", 1},
{"The Nexus", "Grand Magus Telestra", 1},
{"The Nexus", "Horde Berserker", 1},
{"The Nexus", "Horde Cleric", 1},
{"The Nexus", "Horde Commander", 1},
{"The Nexus", "Horde Ranger", 1},
{"The Nexus", "Mage Hunter Initiate", 1},
{"The Nexus", "Mage Slayer", 1},
{"The Nexus", "Scalesworn Elite", 1},
{"The Nexus", "Steward", 1},
{"The Nexus", "Thyrinar", 1},
{"The Nexus", "Twilight Invader", 1},
}

--------------------------------------- TIMER

local function StartChronometer()
    startTime = GetTime()
    elapsedSeconds = 0
    
    timerFrame = CreateFrame("Frame")
    local updateInterval = 1
    local timeSinceLastUpdate = 0
    
    timerFrame:SetScript("OnUpdate", function(self, elapsed)
        timeSinceLastUpdate = timeSinceLastUpdate + elapsed
        if timeSinceLastUpdate >= updateInterval then
            timeSinceLastUpdate = timeSinceLastUpdate - updateInterval
            elapsedSeconds = elapsedSeconds + updateInterval
            local minutes = math.floor(elapsedSeconds / 60)
            local seconds = math.floor(elapsedSeconds % 60)
            theTimeElapsed = string.format("%02d:%02d", minutes, seconds)
            UpdateDungeonProgressionText()
        end
    end)
end

local function StopChronometer()
     if not timerFrame then
        print("Chronometer is not running!")
        return
    end
    
    timerFrame:SetScript("OnUpdate", nil)
    timerFrame = nil
    
    local elapsedTime = (GetTime() - startTime + elapsedSeconds) / 2
    local minutes = math.floor(elapsedTime / 60)
    local seconds = math.floor(elapsedTime % 60)
    local milliseconds = math.floor((elapsedTime - math.floor(elapsedTime)) * 100)
    
    local message = string.format("Elapsed time: %02d:%02d.%02d", minutes, seconds, milliseconds)
    
    if timerSelectedChoice == "target" or timerSelectedChoice == "party" or timerSelectedChoice == "raid" then
        SendChatMessage(message, timerSelectedChoice:upper(), nil, targetPlayerName)
    else
        print(message)
    end
    
    startTime = nil
end

-- Define a function to toggle the visibility of the frame
local function ToggleDungeonProgressionFrame()
    if DungeonProgressionFrame:IsShown() then
        DungeonProgressionFrame:Hide()  -- Hide the frame if it's currently shown
    else
        DungeonProgressionFrame:Show()  -- Show the frame if it's currently hidden
    end
end
-- Define a function to toggle the visibility of the frame
local function ToggleDungeonProgressionOptionsFrame()
    if DungeonProgressionOptionsFrame:IsShown() then
        DungeonProgressionOptionsFrame:Hide()  -- Hide the frame if it's currently shown
    else
        DungeonProgressionOptionsFrame:Show()  -- Show the frame if it's currently hidden
    end
end

-- Create a function to toggle the "clamp_to_screen" setting
local function ToggleClampToScreen(self)
    local isChecked = self:GetChecked()
    -- Your code to handle the checkbox state change (saving settings, updating UI, etc.)
end


local function RaidWarningCountdown()
    local count = timeBeforeTimer

    local function AnnounceCountdown()
        if count > 0 then
            local channel = IsInRaid() and (UnitIsGroupLeader("player") and "RAID_WARNING" or "RAID") or (IsInGroup() and "PARTY") or nil
            local message = tostring(count)
            
            if timerSelectedChoice == "target" then
                SendChatMessage(message, "WHISPER", nil, targetPlayerName)
            elseif timerSelectedChoice == "party" then
                SendChatMessage(message, "PARTY", nil, targetPlayerName)
            elseif timerSelectedChoice == "raid" then
                if channel then
                    SendChatMessage(message, channel)
                end
            else
                print(message)
            end

            count = count - 1
            C_Timer.After(1, AnnounceCountdown)
        else
            local startMessage = IsInRaid() and (UnitIsGroupLeader("player") and "Start!" or "Start!") or (IsInGroup() and "Start!") or "Start!"
            local channel = IsInRaid() and (UnitIsGroupLeader("player") and "RAID_WARNING" or "RAID") or (IsInGroup() and "PARTY") or nil
            
            if timerSelectedChoice == "target" then
                SendChatMessage(startMessage, "WHISPER", nil, targetPlayerName)
            elseif timerSelectedChoice == "party" then
                SendChatMessage(startMessage, "PARTY", nil, targetPlayerName)
            elseif timerSelectedChoice == "raid" then
                if channel then
                    SendChatMessage(startMessage, channel)
                end
            else
                print(startMessage)
            end
            
            StartChronometer()
        end
    end

    AnnounceCountdown()
end


-- Your existing pull timer function
local function StartPullTimer()
    -- ... (other code for your pull timer)
    RaidWarningCountdown()  -- Call the countdown function here to start the countdown
end

SLASH_STARTCHRONOMETER1 = "/dpstart"
SlashCmdList["STARTCHRONOMETER"] = function()
    --StartChronometer()
	StartPullTimer()
	-- Start the stopwatch when the boss encounter begins
    Stopwatch_Clear()
    Stopwatch_StartCountdown(0, 0, 0) -- Start the stopwatch with zero hours, minutes, and seconds
end



--SLASH_STOPCHRONOMETER1 = "/stopchrono"
SLASH_STOPCHRONOMETER1 = "/dpstop"
SlashCmdList["STOPCHRONOMETER"] = function()
    StopChronometer()
	Stopwatch_Clear()
    --Stopwatch_StopCountdown()
end

local function GetBossFromInstanceByID(id)
	local bossNames = {}
    for i, boss in ipairs(dungeonEncountersArray) do
        if boss[6] == id then
			--nBossTotal = nBossTotal + 1;
            table.insert(bossNames, {name = boss[2], killed = false})
        end
    end
    return bossNames
end

local function GetEliteFromInstanceByName(name)
	local eliteTable = {}
    for i, elite in ipairs(dungeonEliteArray) do
        if elite[1] == name then
            table.insert(eliteTable, {name = elite[2], total = elite[3], amountKilled=0});
			eliteTotal = eliteTotal + elite[3];
        end
    end
	
	eliteTotal = math.floor(eliteTotal * pourcentageAdd)
	
    return eliteTable
end

local EnterInstanceframe = CreateFrame("FRAME")

EnterInstanceframe:RegisterEvent("PLAYER_ENTERING_WORLD")
EnterInstanceframe:RegisterEvent("ZONE_CHANGED_NEW_AREA")

EnterInstanceframe:SetScript("OnEvent", function(self, event, ...)
	local inInstance, instanceType = IsInInstance()
	
	if inInstance and instanceType == "party" then
		local instanceName = select(1,GetInstanceInfo(1));
		local instanceID = select(8,GetInstanceInfo(1));
		local bossInstance = GetBossFromInstanceByID(instanceID);
		eliteInstance = GetEliteFromInstanceByName(instanceName);

		for i = 1, #dungeons do
			if dungeons[i][3] == instanceID then
				nBossTotal = dungeons[i][4];
				break
			end
		end

		for i, boss in ipairs(bossInstance) do
		nbBoss = nbBoss + 1;
		end
		-- Load the addon
		UpdateDungeonProgressionText();
		
		ToggleDungeonProgressionFrame()
		--DungeonProgressionFrame:Show()
		local mobCalculationframe = CreateFrame("FRAME")
		mobCalculationframe:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

		mobCalculationframe:SetScript("OnEvent", function(self, event, ...)
			local _, eventType, _, _, _, _, _, _, destName = CombatLogGetCurrentEventInfo()
				UpdateDungeonProgressionText();

				if eventType == "UNIT_DIED" and UnitIsPlayer(destName) ~= true then
					--print ("destName==>", destName);

					-- check the number of elite that are killed
					for i, elite in ipairs(eliteInstance) do
						if elite.name == destName then
							eliteTotalKilled = eliteTotalKilled + 1;
							elite.amountKilled = elite.amountKilled + 1;

							formattedPercentage = string.format("%.2f%%", (eliteTotalKilled / eliteTotal * 100));
							if eliteTotalKilled >= eliteTotal then
								formattedPercentage = string.format("%.2f%%", (eliteTotal / eliteTotal * 100));
							end
						end
					end

					for i, boss in ipairs(bossInstance) do
						-- if it is a boss in the instance
						if boss.name == destName and boss.killed==false then
							boss.killed=true;

							nBossKilled = 0;

							-- Check if all the bosses are dead. Write a message if they are all dead
							for i, boss in ipairs(bossInstance) do
								if boss.killed==true then
									nBossKilled = nBossKilled + 1;
									nbDown = nBossKilled;

									if nBossKilled == nBossTotal then 
										StopChronometer();
										print("FINISH");
										PlaySoundFile(soundFile, "Master")
										dpReset();
										break;
									end
								end
							end
						end;
					end
				end
			end
		)

	else
		-- Unload the addon
		DungeonProgressionFrame:Hide()
		EnterInstanceframe:UnregisterEvent("ZONE_CHANGED_NEW_AREA");
	end
end)



------------------------------------------ Box Display

local DungeonProgressionFrame = CreateFrame("Frame", "DungeonProgressionFrame", UIParent, "BasicFrameTemplate")

-- Make the frame movable
DungeonProgressionFrame:SetMovable(mainWindowMovable)
DungeonProgressionFrame:EnableMouse(true)
DungeonProgressionFrame:RegisterForDrag("LeftButton")
DungeonProgressionFrame:SetScript("OnDragStart", DungeonProgressionFrame.StartMoving)
DungeonProgressionFrame:SetScript("OnDragStop", DungeonProgressionFrame.StopMovingOrSizing)

-- Set the position and size of the frame
DungeonProgressionFrame:SetPoint("RIGHT", UIParent, "RIGHT", -50, 0)
DungeonProgressionFrame:SetSize(310, 200)

-- Set the minimum and maximum dimensions for the frame
DungeonProgressionFrame:SetResizeBounds (310, 175, 600, 400)

-- Hide the frame initially
--DungeonProgressionFrame:Hide()
ToggleDungeonProgressionFrame()
DungeonProgressionFrame:SetClampedToScreen(isClamped)

-- Create a reset button with an image
local resetButton = CreateFrame("Frame", "DungeonProgressionResetButton", DungeonProgressionFrame)
resetButton:SetPoint("TOPRIGHT", DungeonProgressionFrame, "TOPRIGHT", -60, -30)
resetButton:SetSize(30, 30)

-- Set the texture as the background of the frame
resetButton.texture = resetButton:CreateTexture(nil, "BACKGROUND")
resetButton.texture:SetAllPoints(true)
resetButton.texture:SetTexture("Interface\\AddOns\\DungeonProgression\\images\\reset.png") -- Replace with your desired texture

-- Register for mouse events
resetButton:SetScript("OnEnter", function(self)
    self.texture:SetVertexColor(1, 1, 1, 0.7) -- Dim the texture on mouseover
end)
resetButton:SetScript("OnLeave", function(self)
    self.texture:SetVertexColor(1, 1, 1, 1) -- Restore the texture's original color
end)
resetButton:SetScript("OnMouseDown", function(self, button)
    self.texture:SetVertexColor(0.7, 0.7, 0.7, 1) -- Darken the texture on mouse click
end)
resetButton:SetScript("OnMouseUp", function(self, button)
    self.texture:SetVertexColor(1, 1, 1, 0.7) -- Restore the texture's color after mouse click
    if button == "LeftButton" then
        -- Show a confirmation dialog before performing the reset
        StaticPopup_Show("RESET_CONFIRMATION")
    end
end)

-- Create a confirmation dialog (same as before)
StaticPopupDialogs["RESET_CONFIRMATION"] = {
    text = "Are you sure you want to reset?",
    button1 = "Yes",
    button2 = "No",
    OnAccept = function()
        -- Perform the reset here
        print("Reset confirmed and performed")
		resetAll()
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
}

--------------------------------------option frame
local DungeonProgressionOptionsFrame = CreateFrame("Frame", "DungeonProgressionOptionsFrame", UIParent, "BasicFrameTemplate")

-- Make the frame movable
DungeonProgressionOptionsFrame:SetMovable(true)
DungeonProgressionOptionsFrame:EnableMouse(true)
DungeonProgressionOptionsFrame:RegisterForDrag("LeftButton")
DungeonProgressionOptionsFrame:SetScript("OnDragStart", DungeonProgressionOptionsFrame.StartMoving)
DungeonProgressionOptionsFrame:SetScript("OnDragStop", DungeonProgressionOptionsFrame.StopMovingOrSizing)

-- Set the position and size of the frame
DungeonProgressionOptionsFrame:SetPoint("RIGHT", DungeonProgressionFrame, "RIGHT", -50, 0)
DungeonProgressionOptionsFrame:SetSize(300, 250)

-- Hide the frame initially
--DungeonProgressionFrame:Hide()
ToggleDungeonProgressionOptionsFrame()
DungeonProgressionOptionsFrame:SetClampedToScreen(isClamped)


-- Create a dropdown menu
local heraldWhisper = CreateFrame("Frame", "DungeonProgressionOptionsDropdown", DungeonProgressionOptionsFrame, "UIDropDownMenuTemplate")
heraldWhisper:SetPoint("TOPLEFT", 20, -50)
UIDropDownMenu_SetWidth(heraldWhisper, 150)

-- Create a text label for the dropdown
local heraldWhisperLabel = DungeonProgressionOptionsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
heraldWhisperLabel:SetPoint("BOTTOMLEFT", heraldWhisper, "TOPLEFT", 0, 5)
heraldWhisperLabel:SetText("Send herald info to:")

-- List of choices for the dropdown
local heraldChoices = {"self", "target", "party", "raid"}

-- Function to handle dropdown menu selections
local function HeraldDropdown_OnClick(self)
    UIDropDownMenu_SetSelectedValue(heraldWhisper, self.value)
    -- Add your code here to handle the selected option
    local selectedValue = UIDropDownMenu_GetSelectedValue(heraldWhisper)
	
	heraldSelectedChoice = selectedValue
end

-- Initialize the dropdown
UIDropDownMenu_Initialize(heraldWhisper, function(self, level, menuList)
    for _, choice in ipairs(heraldChoices) do
        local info = UIDropDownMenu_CreateInfo()
        info.text = choice
        info.value = choice
        info.func = HeraldDropdown_OnClick
        UIDropDownMenu_AddButton(info)
    end
end)

-- Create a dropdown menu
local timerWhisper = CreateFrame("Frame", "DungeonProgressionOptionsDropdown", DungeonProgressionOptionsFrame, "UIDropDownMenuTemplate")
timerWhisper:SetPoint("TOPLEFT", 20, -110)
UIDropDownMenu_SetWidth(timerWhisper, 150)

-- Create a text label for the dropdown
local timerWhisperLabel = DungeonProgressionOptionsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
timerWhisperLabel:SetPoint("BOTTOMLEFT", timerWhisper, "TOPLEFT", 0, 5)
timerWhisperLabel:SetText("Send timer info to:")

local timerChoices = {"self", "party", "instance", "raid"}

-- Function to handle dropdown menu selections
local function TimerDropdown_OnClick(self)
    UIDropDownMenu_SetSelectedValue(timerWhisper, self.value)
    -- Add your code here to handle the selected option
    local selectedValue = UIDropDownMenu_GetSelectedValue(timerWhisper)
    
    timerSelectedChoice = selectedValue
end

-- Initialize the dropdown
UIDropDownMenu_Initialize(timerWhisper, function(self, level, menuList)
    for _, choice in ipairs(timerChoices) do
        local info = UIDropDownMenu_CreateInfo()
        info.text = choice
        info.value = choice
        info.func = TimerDropdown_OnClick
        UIDropDownMenu_AddButton(info)
    end
end)

-- Set the default selected value
UIDropDownMenu_SetSelectedValue(timerWhisper, timerChoices[1])
timerSelectedChoice = timerChoices[1]

-- Add the dropdown to DungeonProgressionFrame
DungeonProgressionFrame.DungeonProgressionOptionsDropdown = timerWhisper


-- Set the default selected value
UIDropDownMenu_SetSelectedValue(heraldWhisper, heraldChoices[1])
heraldSelectedChoice = heraldChoices[1]

-- Add the dropdown to DungeonProgressionFrame
DungeonProgressionFrame.DungeonProgressionOptionsDropdown = heraldWhisper

local function ToggleClampToScreen(self)
    local isClamped = self:GetChecked()
    
	DungeonProgressionFrame:SetClampedToScreen( isClamped )
	DungeonProgressionOptionsFrame:SetClampedToScreen(isClamped)
end

-- Create the checkbox
local clampToScreenCheckbox = CreateFrame("CheckButton", "DungeonProgressionOptionsCheckbox", DungeonProgressionOptionsFrame, "BackdropTemplate")
clampToScreenCheckbox:SetSize(24, 24)  -- Adjust the size as needed
clampToScreenCheckbox:SetPoint("TOPLEFT", 20, -150)  -- Adjust the position as needed
clampToScreenCheckbox:SetChecked(true)
clampToScreenCheckbox:SetScript("OnClick", ToggleClampToScreen)

-- Create the checkbox's texture for different states
clampToScreenCheckbox:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
clampToScreenCheckbox:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
clampToScreenCheckbox:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
clampToScreenCheckbox:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")

-- Create the text label for the checkbox
local clampToScreenLabel = DungeonProgressionOptionsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
clampToScreenLabel:SetPoint("LEFT", clampToScreenCheckbox, "RIGHT", 5, 0)
clampToScreenLabel:SetText("Clamp To Screen")
clampToScreenCheckbox:SetScript("OnClick", ToggleClampToScreen)

-- Add the checkbox and label to DungeonProgressionOptionsFrame
DungeonProgressionOptionsFrame.clampToScreenCheckbox = clampToScreenCheckbox
DungeonProgressionOptionsFrame.clampToScreenLabel = clampToScreenLabel

--- resizeButton
local function ToggleMainWindowResizable(self)
    local isResizable = self:GetChecked()
    
    DungeonProgressionFrame:SetResizable(isResizable)
    -- Add any additional logic related to resizing here
    mainWindowResizable = isResizable;
	if isResizable then
		DungeonProgressionFrame:SetResizable(isResizable)
		DungeonProgressionFrame:SetMovable(false);
	else
		DungeonProgressionFrame:SetResizable(isResizable)
		DungeonProgressionFrame:SetMovable(true);
	end
    -- Update the checkbox's state to reflect resizable status
    self:SetChecked(isResizable)
end

-- Set up the resizing handles
DungeonProgressionFrame:SetScript("OnSizeChanged", ResizeFrame)
DungeonProgressionFrame:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" and mainWindowResizable then
        self:StartSizing("BOTTOMRIGHT")
    end
end)
DungeonProgressionFrame:SetScript("OnMouseUp", function(self)
	local width = DungeonProgressionFrame:GetWidth()
    local height = DungeonProgressionFrame:GetHeight()
    --print(width, height)
    self:StopMovingOrSizing()
end)

-- Create the checkbox
local mainWindowResizableCheckbox = CreateFrame("CheckButton", "DungeonProgressionOptionsCheckbox", DungeonProgressionOptionsFrame, "BackdropTemplate")
mainWindowResizableCheckbox:SetSize(24, 24)  -- Adjust the size as needed
mainWindowResizableCheckbox:SetPoint("TOPLEFT", 20, -180)  -- Adjust the position as needed
mainWindowResizableCheckbox:SetChecked(mainWindowResizable)
mainWindowResizableCheckbox:SetScript("OnClick", ToggleMainWindowResizable)

-- Create the checkbox's texture for different states
mainWindowResizableCheckbox:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
mainWindowResizableCheckbox:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
mainWindowResizableCheckbox:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
mainWindowResizableCheckbox:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")

-- Create the text label for the checkbox
local mainWindowResizableLabel = DungeonProgressionOptionsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
mainWindowResizableLabel:SetPoint("LEFT", mainWindowResizableCheckbox, "RIGHT", 5, 0)
mainWindowResizableLabel:SetText("Resizable Main Window")
mainWindowResizableCheckbox:SetScript("OnClick", ToggleMainWindowResizable)

-- Add the checkbox and label to DungeonProgressionOptionsFrame
DungeonProgressionOptionsFrame.mainWindowResizableCheckbox = mainWindowResizableCheckbox
DungeonProgressionOptionsFrame.mainWindowResizableLabel = mainWindowResizableLabel

------- Locked button
local function ToggleMainWindowLocked(self)
    local isLocked = self:GetChecked()
    
    DungeonProgressionFrame:SetMovable(not isLocked)
    -- Add any additional logic related to locking here
	
	mainWindowLocked = isLocked
	
	DungeonProgressionFrame:EnableMouse(not mainWindowLocked)
	--print("mainWindowLocked==>"..tostring(mainWindowLocked))
	-- Disable mainWindowResizableCheckbox if mainWindowLocked is true
	if mainWindowLocked then 
		DungeonProgressionOptionsFrame.mainWindowResizableCheckbox:Disable()
		--print("color==>"..DungeonProgressionOptionsFrame.mainWindowResizableLabel:GetTextColor())
		DungeonProgressionOptionsFrame.mainWindowResizableLabel:SetTextColor(0.5, 0.5, 0.5, 1)  -- Set gray color
		--DungeonProgressionOptionsFrame.mainWindowResizableCheckbox:SetBackdropColor(0.5, 0.5, 0.5, 1)  -- Set gray color
		mainWindowResizable = false
		mainWindowMovable = false
	else
        DungeonProgressionOptionsFrame.mainWindowResizableCheckbox:Enable()
		DungeonProgressionOptionsFrame.mainWindowResizableLabel:SetTextColor(1, 0.82, 0, 1) -- RGB values for #FFD100  -- Restore original color
        --DungeonProgressionOptionsFrame.mainWindowResizableCheckbox:SetBackdropColor(1, 1, 1, 1)  -- Restore original color
		mainWindowMovable = true
	end
	    
    -- Update the checkbox's state to reflect locked status
    self:SetChecked(isLocked)
end

-- Create the checkbox for locking the main window
local mainWindowLockedCheckbox = CreateFrame("CheckButton", "DungeonProgressionOptionsCheckbox", DungeonProgressionOptionsFrame, "BackdropTemplate")
mainWindowLockedCheckbox:SetSize(24, 24)  -- Adjust the size as needed
mainWindowLockedCheckbox:SetPoint("TOPLEFT", 20, -210)  -- Adjust the position as needed
mainWindowLockedCheckbox:SetChecked(false)  -- You can set the default state here
mainWindowLockedCheckbox:SetScript("OnClick", ToggleMainWindowLocked)

-- Create the checkbox's texture for different states
mainWindowLockedCheckbox:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
mainWindowLockedCheckbox:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
mainWindowLockedCheckbox:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
mainWindowLockedCheckbox:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")

-- Create the text label for the checkbox
local mainWindowLockedLabel = DungeonProgressionOptionsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
mainWindowLockedLabel:SetPoint("LEFT", mainWindowLockedCheckbox, "RIGHT", 5, 0)
mainWindowLockedLabel:SetText("Lock Main Window")
mainWindowLockedCheckbox:SetScript("OnClick", ToggleMainWindowLocked)

-- Add the checkbox and label to DungeonProgressionOptionsFrame
DungeonProgressionOptionsFrame.mainWindowLockedCheckbox = mainWindowLockedCheckbox
DungeonProgressionOptionsFrame.mainWindowLockedLabel = mainWindowLockedLabel

--------------------------------------option frame


-- Create the "Herald" button
local HeraldButton = CreateFrame("Button", "DungeonProgressionHeraldButton", DungeonProgressionFrame, "UIPanelButtonTemplate")
HeraldButton:SetPoint("BOTTOMLEFT", DungeonProgressionFrame, "BOTTOMLEFT", 10, 10)
HeraldButton:SetSize(90, 30)
HeraldButton:SetText("Herald")

-- Create the "Start Timer" button
local StartTimerButton = CreateFrame("Button", "DungeonProgressionStartTimerButton", DungeonProgressionFrame, "UIPanelButtonTemplate")
StartTimerButton:SetPoint("BOTTOM", DungeonProgressionFrame, "BOTTOM", 0, 10)
StartTimerButton:SetSize(90, 30)
StartTimerButton:SetText("Start Timer")

-- Create the "Stop Timer" button
local StopTimerButton = CreateFrame("Button", "DungeonProgressionStopTimerButton", DungeonProgressionFrame, "UIPanelButtonTemplate")
StopTimerButton:SetPoint("BOTTOMRIGHT", DungeonProgressionFrame, "BOTTOMRIGHT", -10, 10)
StopTimerButton:SetSize(90, 30)
StopTimerButton:SetText("Stop Timer")

local OptionsButton = CreateFrame("Button", "DungeonProgressionGearButton", DungeonProgressionFrame)
OptionsButton:SetPoint("TOPRIGHT", DungeonProgressionFrame, "TOPRIGHT", -10, -30)
OptionsButton:SetSize(30, 30)

local normalTexture = OptionsButton:CreateTexture(nil, "ARTWORK")
normalTexture:SetTexture("Interface\\AddOns\\DungeonProgression\\images\\options.png")
normalTexture:SetAllPoints(OptionsButton)
OptionsButton:SetNormalTexture(normalTexture)

OptionsButton:SetScript("OnEnter", function(self)
    self:GetNormalTexture():SetVertexColor(0.7, 0.7, 0.7, 1)
end)
OptionsButton:SetScript("OnLeave", function(self)
    self:GetNormalTexture():SetVertexColor(1, 1, 1, 1)
end)
OptionsButton:SetScript("OnMouseDown", function(self, button)
    self:GetNormalTexture():SetVertexColor(0.5, 0.5, 0.5, 1)
end)
OptionsButton:SetScript("OnMouseUp", function(self, button)
    self:GetNormalTexture():SetVertexColor(0.7, 0.7, 0.7, 1)
    if button == "LeftButton" then
        -- Show a confirmation dialog before performing an action
        StaticPopup_Show("OPTIONS_CONFIRMATION")
    end
end)

local DungeonProgressionTitle = DungeonProgressionFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
DungeonProgressionTitle:SetPoint("TOP", DungeonProgressionFrame, "TOP", 0, -5)
DungeonProgressionTitle:SetText("Dungeon Progression")

local DungeonProgressionOptionsTitle = DungeonProgressionOptionsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
DungeonProgressionOptionsTitle:SetPoint("TOP", DungeonProgressionOptionsFrame, "TOP", 0, -5)
DungeonProgressionOptionsTitle:SetText("Options")

DungeonProgressionText = DungeonProgressionFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
DungeonProgressionText:SetPoint("TOPLEFT", DungeonProgressionFrame, "TOPLEFT", 10, -40)
DungeonProgressionText:SetPoint("BOTTOMRIGHT", DungeonProgressionFrame, "BOTTOMRIGHT", -10, 40)
DungeonProgressionText:SetJustifyH("LEFT")
DungeonProgressionText:SetJustifyV("TOP")
--DungeonProgressionText:SetText("Instance name : "..select(1,GetInstanceInfo(1)).."\n\nBoss down : "..nbDown.." out of "..nBossTotal.."\n\nMob count : ")

local function dpshow()
	UpdateDungeonProgressionText()
	ToggleDungeonProgressionFrame()
end

SLASH_DUNGEONPROGRESSION1 = "/dpshow"
SlashCmdList["DUNGEONPROGRESSION"] = function()
	dpshow();
end

function ScanCharacterSheet(targetPlayerName)
	print("in ScanCharacterSheet", targetPlayerName);
    local maxItemLevel = 107
    local highestItemLevel = 0

    local gearOK = true
    for slotID = 1, 19 do
        local ilvlGood = true
        local expacGood = true
        local itemLink = GetInventoryItemLink("target", slotID)
        if itemLink then
            local effectiveItemLevel, _, baseItemLevel = GetDetailedItemLevelInfo(itemLink)
            local expac = select(15, GetItemInfo(itemLink))
            local nomExpac = {"classic", "BC", "WotLK", "Cataclysm", "MoP", "WoD", "Legion", "BFA", "SL", "DF"}

            -- Check if ilvl is higher than 107
            ilvlGood = effectiveItemLevel and effectiveItemLevel <= 107

            -- Check if expac is more recent than WotLK
            expacGood = not (expac and expac > 2)

            -- If either ilvl or expac is not good, gear is not okay
            if not (ilvlGood and expacGood) then
                gearOK = false
                local reason = "reason: "
                if not ilvlGood then
                    reason = reason .. "ilvl"
                end
                if not expacGood then
                    reason = reason .. " expac"
                end

                -- Build the whisper message
                local whisperMessage = targetPlayerName .. " ==> " .. itemLink .. " " .. reason

                -- Send the message to the target player
                SendChatMessage(whisperMessage, "WHISPER", nil, targetPlayerName)
            end
        end
    end

    if gearOK then
        local whisperMessage = "Gear OK"
        -- Send the message to the target player
        SendChatMessage(whisperMessage, "WHISPER", nil, targetPlayerName)
    end
end
------------------------------------------------------------------------------
-- Define the function to be executed when the slash command is used
function dpTestFunction()
	local val = 0;
    for _, elite in ipairs(eliteInstance) do
		val = val + elite.amountKilled;
        print(elite.name, elite.amountKilled);
    end
    print("Total elite killed: " .. val .. " out of " .. eliteTotal);
end

-- Define the slash command
SLASH_DPTEST1 = "/dptest"
SlashCmdList["DPTEST"] = function()
	dpTestFunction();
end
-------------------------------------------------------------------------------------------
-- Define the function to be executed when the slash command is used
local function dpHerald()
    ScanCharacterSheet();
end

SLASH_DPHERALD1 = "/dpHerald"
SlashCmdList["DPHERALD"] = function()
	dpHerald();
end


------------------------------------------------------------------------------

text = ""
theTimeElapsed = "00:00"

function UpdateDungeonProgressionText()
    local instanceName, _, _, _, _, _, _, instanceID = GetInstanceInfo()
	
	-- Calculate the mob count percentage
    text = formattedPercentage ~= "" and formattedPercentage or "0%"
	
    DungeonProgressionText:SetText("Instance name: " .. instanceName .. "\n\nBoss down: " .. nbDown .. " out of " .. nBossTotal .. "\n\n Mob Count : " .. text  .. "\n\n Timer : " .. theTimeElapsed )
end

-- Define a table to store the mob deaths
local mobDeaths = {}
local mobDeathsTrigger = 0

-- Define the event handler function
local function OnCombatLogEvent(self, event, ...)
  -- Extract data from the combat log
  local _, subEvent, _, _, _, _, _, destGUID = CombatLogGetCurrentEventInfo()
  
  -- Check if a non-player unit has died
  if subEvent == "UNIT_DIED" and not mobDeaths[destGUID] and not UnitIsPlayer(destGUID) then
    -- Update the mobDeaths table to indicate that the mob has died
    mobDeaths[destGUID] = true
    mobDeathsTrigger = mobDeathsTrigger + 1

    -- Perform other actions here
    UpdateDungeonProgressionText()
  end
end

function resetAll()
	nbDown = 0
	eliteTotalKilled = 0;
	formattedPercentage = "0%"
	
	local val = 0;
	for _, elite in ipairs(eliteInstance) do
		elite.amountKilled = 0;
		val = val + elite.amountKilled;
    end
	
	if timerFrame then
		StopChronometer()
	end
	
	text = ""
	theTimeElapsed = "00:00"
	UpdateDungeonProgressionText()
end

-------------------------------------------------------------------------------------------
-- Define the function to be executed when the slash command is used
function dpReset()
    resetAll()
	UpdateDungeonProgressionText()
end

SLASH_DPGROUP1 = "/dpgroup"
SlashCmdList["DPGROUP"] = function()
	dpGroup();
end

-- Define the function to be executed when the slash command is used
function dpGroup()
	print("on est dans dpGroup")
	print("Group members:")
	local numGroupMembers = GetNumGroupMembers()
	print("numGroupMembers:"..numGroupMembers)

	for i = 0, numGroupMembers do
		print("caliss", i)
		local unitId = IsInRaid() and "raid" .. i or "party" .. i
		local playerName = UnitName(unitId)
		if playerName then
			print(i, playerName)
			ScanCharacterSheet(playerName) -- Scan your own character's gear
		end
	end
end

SLASH_DPRESET1 = "/dpreset"
SlashCmdList["DPRESET"] = function()
	dpReset();
end

-- Function to be executed when the "Herald" button is clicked
HeraldButton:SetScript("OnClick", function(self, button, down)
	ScanCharacterSheet()
end)

-- Function to be executed when the "Start Timer" button is clicked
StartTimerButton:SetScript("OnClick", function(self)
    -- Disable the button and modify appearance
    self:Disable()
    self:SetNormalFontObject("GameFontDisable")
    self:SetHighlightFontObject("GameFontDisable")
    self:SetDisabledFontObject("GameFontDisable")
    
    -- Disable and modify appearance of the "Stop Timer" button
    StopTimerButton:Disable()
    StopTimerButton:SetNormalFontObject("GameFontDisable")
    StopTimerButton:SetHighlightFontObject("GameFontDisable")
    StopTimerButton:SetDisabledFontObject("GameFontDisable")
    
    -- Delayed re-enable and appearance restore for "Stop Timer" button
    C_Timer.After(timeBeforeTimer, function()
        StopTimerButton:Enable()
        StopTimerButton:SetNormalFontObject("GameFontNormal")
        StopTimerButton:SetHighlightFontObject("GameFontHighlight")
        StopTimerButton:SetDisabledFontObject("GameFontDisable")
    end)
    
    -- Start the pull timer
    StartPullTimer()
end)

-- Function to be executed when the "Stop Timer" button is clicked
StopTimerButton:SetScript("OnClick", function(self, button, down)
	-- Change the button color
    self:SetNormalFontObject("GameFontDisable")
    self:SetHighlightFontObject("GameFontDisable")
    self:SetDisabledFontObject("GameFontDisable")
    
    -- Disable the button
    self:Disable()
	
	-- Revert the appearance of the button
	StartTimerButton:SetNormalFontObject("GameFontNormal")
	StartTimerButton:SetHighlightFontObject("GameFontHighlight")
	StartTimerButton:SetDisabledFontObject("GameFontDisable")

	-- Enable the button
	StartTimerButton:Enable()
	StopChronometer()
end)

-- Function to be executed when the "Options" button is clicked
OptionsButton:SetScript("OnClick", function(self, button, down)
    -- Add your code here to open the options menu
	ToggleDungeonProgressionOptionsFrame()
end)

-- Create minimap button
 
local minibtn = CreateFrame("Button", nil, Minimap)
minibtn:SetFrameLevel(8)
minibtn:SetSize(32,32)
minibtn:SetMovable(true)
 
minibtn:SetNormalTexture("Interface\\AddOns\\DungeonProgression\\images\\logo.png")
minibtn:SetPushedTexture("Interface\\AddOns\\DungeonProgression\\images\\logo.png")
minibtn:SetHighlightTexture("Interface\\AddOns\\DungeonProgression\\images\\logo.png")


-- minibtn:SetNormalTexture("Interface/AddOns/AutoSell/Leatrix_Plus_Up.blp")
-- minibtn:SetPushedTexture("Interface/AddOns/AutoSell/Leatrix_Plus_Up.blp")
-- minibtn:SetHighlightTexture("Interface/AddOns/AutoSell/Leatrix_Plus_Up.blp")
 
 
 
local myIconPos = 0
 
-- Control movement
local function UpdateMapBtn()
    local Xpoa, Ypoa = GetCursorPosition()
    local Xmin, Ymin = Minimap:GetLeft(), Minimap:GetBottom()
    Xpoa = Xmin - Xpoa / Minimap:GetEffectiveScale() + 70
    Ypoa = Ypoa / Minimap:GetEffectiveScale() - Ymin - 70
    myIconPos = math.deg(math.atan2(Ypoa, Xpoa))
    minibtn:ClearAllPoints()
    minibtn:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 52 - (80 * cos(myIconPos)), (80 * sin(myIconPos)) - 52)
end
 
minibtn:RegisterForDrag("LeftButton")
minibtn:SetScript("OnDragStart", function()
    minibtn:StartMoving()
    minibtn:SetScript("OnUpdate", UpdateMapBtn)
end)
 
minibtn:SetScript("OnDragStop", function()
    minibtn:StopMovingOrSizing();
    minibtn:SetScript("OnUpdate", nil)
    UpdateMapBtn();
end)
 
-- Set position
minibtn:ClearAllPoints();
minibtn:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 52 - (80 * cos(myIconPos)),(80 * sin(myIconPos)) - 52)
 
-- Control clicks
minibtn:SetScript("OnClick", function()
	dpshow();
end)