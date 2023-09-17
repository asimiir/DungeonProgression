--Each entry in the table has six values:

-- 1 A number indicating the boss's index in the game's database.
-- 2 The name of the boss (as a string).
-- 3 The name of the dungeon or instance where the boss is located (as a string).
-- 4 A number indicating the boss's encounter ID.
-- 5 A number indicating the boss's journal ID.
-- 6 A number indicating the dungeon's map ID.

dungeonEncountersArray = {
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