local E, L, V, P, G = unpack(select(2, ...)); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local CopyTable = CopyTable -- Our function doesn't exist yet.

P.gridSize = 64

--Core
P.general = {
	messageRedirect = _G.DEFAULT_CHAT_FRAME:GetName(),
	smoothingAmount = 0.33,
	taintLog = false,
	stickyFrames = true,
	loginmessage = true,
	interruptAnnounce = 'NONE',
	autoRepair = 'NONE',
	autoRoll = false,
	autoAcceptInvite = false,
	bottomPanel = true,
	hideErrorFrame = true,
	enhancedPvpMessages = true,
	objectiveFrameHeight = 480,
	objectiveFrameAutoHide = true,
	bonusObjectivePosition = 'LEFT',
	talkingHeadFrameScale = 0.9,
	talkingHeadFrameBackdrop = false,
	vehicleSeatIndicatorSize = 128,
	objectiveTracker = true,
	resurrectSound = false,
	questRewardMostValueIcon = true,
	itemLevel = {
		displayCharacterInfo = true,
		displayInspectInfo = true,
		itemLevelFont = 'PT Sans Narrow',
		itemLevelFontSize = 12,
		itemLevelFontOutline = 'OUTLINE',
	},
	durabilityScale = 1,
	afk = true,
	numberPrefixStyle = 'ENGLISH',
	decimalLength = 1,
	altPowerBar = {
		enable = true,
		width = 250,
		height = 20,
		font = 'PT Sans Narrow',
		fontSize = 12,
		fontOutline = 'OUTLINE',
		statusBar = 'ElvUI Norm',
		textFormat = 'NAMECURMAX',
		statusBarColorGradient = false,
		statusBarColor = { r = 0.2, g = 0.4, b = 0.8 },
		smoothbars = false,
	},
	fontSize = 12,
	font = 'PT Sans Narrow',
	fontStyle = 'OUTLINE',
	bordercolor = { r = 0.1, g = 0.1, b = 0.1 },
	backdropcolor = { r = 0.1, g = 0.1, b = 0.1 },
	backdropfadecolor = { r = .06, g = .06, b = .06, a = 0.8 },
	valuecolor = {r = 254/255, g = 123/255, b = 44/255},
	cropIcon = 2,
	minimap = {
		size = 176,
		locationText = 'MOUSEOVER',
		locationFontSize = 12,
		locationFontOutline = 'OUTLINE',
		locationFont = 'PT Sans Narrow',
		resetZoom = {
			enable = false,
			time = 3,
		},
		icons = {
			classHall = {
				scale = 0.8,
				position = 'TOPLEFT',
				xOffset = 0,
				yOffset = 0,
				hide = false,
			},
			calendar = {
				scale = 1,
				position = 'TOPRIGHT',
				xOffset = 0,
				yOffset = 0,
				hide = true,
			},
			mail = {
				scale = 1,
				position = 'TOPRIGHT',
				xOffset = 3,
				yOffset = 4,
			},
			lfgEye = {
				scale = 1,
				position = 'BOTTOMRIGHT',
				xOffset = 3,
				yOffset = 0,
			},
			difficulty = {
				scale = 1,
				position = 'TOPLEFT',
				xOffset = 0,
				yOffset = 0,
			},
			challengeMode = {
				scale = 1,
				position = 'TOPLEFT',
				xOffset = 8,
				yOffset = -8,
			},
			ticket = {
				scale = 1,
				position = 'TOPRIGHT',
				xOffset = 0,
				yOffset = 0,
			},
		}
	},
	threat = {
		enable = true,
		position = 'RIGHTCHAT',
		textSize = 12,
		textOutline = 'NONE',
	},
	totems = {
		enable = true,
		growthDirection = 'VERTICAL',
		sortDirection = 'ASCENDING',
		size = 40,
		spacing = 4,
	},
	kittys = false
};

P.databars = {}

for _, databar in pairs({ 'experience', 'reputation', 'honor', 'azerite'}) do
	P.databars[databar] = {
		enable = true,
		width = 10,
		height = 180,
		textFormat = 'NONE',
		textSize = 11,
		font = 'PT Sans Narrow',
		fontOutline = 'NONE',
		mouseover = false,
		orientation = 'VERTICAL',
		reverseFill = false,
	}
end

P.databars.experience.hideAtMaxLevel = true
P.databars.experience.hideInVehicle = false
P.databars.experience.hideInCombat = false

P.databars.reputation.enable = false
P.databars.reputation.hideInVehicle = false
P.databars.reputation.hideInCombat = false

P.databars.honor.hideInVehicle = false
P.databars.honor.hideInCombat = false
P.databars.honor.hideOutsidePvP = false
P.databars.honor.hideBelowMaxLevel = false

P.databars.azerite.hideAtMaxLevel = true
P.databars.azerite.hideInVehicle = false
P.databars.azerite.hideInCombat = false

--Bags
P.bags = {
	sortInverted = true,
	bagSize = 34,
	bankSize = 34,
	bagWidth = 406,
	bankWidth = 406,
	currencyFormat = 'ICON_TEXT_ABBR',
	moneyFormat = 'SMART',
	moneyCoins = true,
	junkIcon = false,
	junkDesaturate = false,
	scrapIcon = false,
	upgradeIcon = true,
	newItemGlow = true,
	ignoredItems = {},
	itemLevel = true,
	itemLevelThreshold = 1,
	itemLevelFont = 'Homespun',
	itemLevelFontSize = 10,
	itemLevelFontOutline = 'MONOCHROMEOUTLINE',
	itemLevelCustomColorEnable = false,
	itemLevelCustomColor = { r = 1, g = 1, b = 1 },
	countFont = 'Homespun',
	countFontSize = 10,
	countFontOutline = 'MONOCHROMEOUTLINE',
	countFontColor = {r = 1, g = 1, b = 1},
	reverseLoot = false,
	reverseSlots = false,
	clearSearchOnClose = false,
	disableBagSort = false,
	disableBankSort = false,
	showAssignedColor = true,
	useBlizzardCleanup = false,
	strata = 'HIGH',
	qualityColors = true,
	specialtyColors = true,
	showBindType = false,
	transparent = false,
	colors = {
		profession = {
			leatherworking = { r = .88, g = .73, b = .29 },
			inscription = { r = .29, g = .30, b = .88 },
			herbs = { r = .07, g = .71, b = .13 },
			enchanting = { r = .76, g = .02, b = .8 },
			engineering = { r = .91, g = .46, b = .18 },
			gems = { r = .03, g = .71, b = .81 },
			mining = { r = .54, g = .40, b = .04 },
			fishing = { r = .42, g = .59, b = 1 },
			cooking = { r = .87, g = .05, b = .25 },
		},
		assignment = {
			equipment = { r = 0, g = .50, b = .47 },
			consumables = { r = .57, g = .95, b = .66 },
			tradegoods = { r = 1, g = .32, b = .66 },
		},
		items = {
			questStarter = {r = 1, g = 1, b = 0},
			questItem = {r = 1, g = 0.30, b = 0.30},
		}
	},
	vendorGrays = {
		enable = false,
		interval = 0.2,
		details = false,
		progressBar = true,
	},
	split = {
		bagSpacing = 5,
		player = false,
		bank = false,
		bag1 = false,
		bag2 = false,
		bag3 = false,
		bag4 = false,
		bag5 = false,
		bag6 = false,
		bag7 = false,
		bag8 = false,
		bag9 = false,
		bag10 = false,
		bag11 = false,
	},
	bagBar = {
		growthDirection = 'VERTICAL',
		sortDirection = 'ASCENDING',
		size = 30,
		spacing = 4,
		backdropSpacing = 4,
		showBackdrop = false,
		mouseover = false,
		visibility = '[petbattle] hide; show',
	},
};

local NP_Auras = {
	enable = true,
	desaturate = true,
	numAuras = 5,
	size = 27,
	width = 18,
	height = 18,
	anchorPoint = 'TOPLEFT',
	growthX = 'RIGHT',
	growthY = 'UP',
	onlyShowPlayer = false,
	spacing = 1,
	yOffset = 5,
	xOffset = 0,
	font = 'PT Sans Narrow',
	fontOutline = 'OUTLINE',
	fontSize = 11,
	countFont = 'PT Sans Narrow',
	countFontOutline = 'OUTLINE',
	countFontSize = 9,
	countPosition = 'BOTTOMRIGHT',
	durationPosition = 'CENTER',
	minDuration = 0,
	maxDuration = 0,
	priority = ''
}

local NP_Health = {
	enable = true,
	healPrediction = true,
	height = 10,
	useClassColor = true,
	text = {
		enable = true,
		format = '[health:percent]',
		position = 'CENTER',
		parent = 'Nameplate',
		xOffset = 0,
		yOffset = 0,
		font = 'PT Sans Narrow',
		fontOutline = 'OUTLINE',
		fontSize = 11,
	},
}

local NP_Power = {
	enable = false,
	classColor = false,
	hideWhenEmpty = false,
	costPrediction = true,
	width = 150,
	height = 8,
	xOffset = 0,
	yOffset = -10,
	displayAltPower = false,
	useAtlas = false,
	text = {
		enable = false,
		format = '[power:percent]',
		position = 'CENTER',
		parent = 'Nameplate',
		xOffset = 0,
		yOffset = -10,
		font = 'PT Sans Narrow',
		fontOutline = 'OUTLINE',
		fontSize = 11,
	},
}

local NP_PvPIcon = {
	enable = false,
	showBadge = true,
	position = 'RIGHT',
	size = 36,
	xOffset = 0,
	yOffset = 0,
}

local NP_PvPClassificationIndicator = {
	enable = false,
	position = 'LEFT',
	size = 36,
	xOffset = 0,
	yOffset = 0,
}

local NP_Portrait = {
	enable = false,
	position = 'RIGHT',
	classicon = true,
	height = 28,
	width = 28,
	xOffset = 3,
	yOffset = -5,
}

local NP_Name = {
	enable = true,
	format = '[namecolor][name]',
	position = 'TOPLEFT',
	parent = 'Nameplate',
	xOffset = 0,
	yOffset = -7,
	font = 'PT Sans Narrow',
	fontOutline = 'OUTLINE',
	fontSize = 11,
}

local NP_Level = {
	enable = true,
	format = '[difficultycolor][level]',
	position = 'TOPRIGHT',
	parent = 'Nameplate',
	xOffset = 0,
	yOffset = -7,
	font = 'PT Sans Narrow',
	fontOutline = 'OUTLINE',
	fontSize = 11,
}

local NP_RaidTargetIndicator = {
	enable = true,
	size = 24,
	position = 'LEFT',
	xOffset = -4,
	yOffset = 0,
}

local NP_Castbar = {
	enable = true,
	width = 150,
	height = 8,
	displayTarget = false,
	hideSpellName = false,
	hideTime = false,
	sourceInterrupt = true,
	sourceInterruptClassColor = true,
	castTimeFormat = 'CURRENT',
	channelTimeFormat = 'CURRENT',
	timeToHold = 0,
	textPosition = 'BELOW',
	iconPosition = 'RIGHT',
	iconSize = 30,
	iconOffsetX = 0,
	iconOffsetY = 0,
	showIcon = true,
	xOffset = 0,
	yOffset = -10,
	font = 'PT Sans Narrow',
	fontOutline = 'OUTLINE',
	fontSize = 11,
}

local NP_Title = {
	enable = false,
	format = '[guild:brackets]',
	position = 'TOPRIGHT',
	parent = 'Nameplate',
	xOffset = 0,
	yOffset = -7,
	font = 'PT Sans Narrow',
	fontOutline = 'OUTLINE',
	fontSize = 11,
}

local NP_EliteIcon = {
	enable = false,
	size = 20,
	position = 'RIGHT',
	xOffset = 15,
	yOffset = 0,
}

local NP_QuestIcon = {
	enable = true,
	position = 'RIGHT',
	textPosition = 'BOTTOMRIGHT',
	size = 20,
	xOffset = 0,
	yOffset = 0,
	font = 'PT Sans Narrow',
	fontOutline = 'OUTLINE',
	fontSize = 12
}

--NamePlate
P.nameplates = {
	smoothbars = false,
	clampToScreen = false,
	clickThrough = {
		personal = false,
		friendly = false,
		enemy = false,
	},
	plateSize ={
		personalWidth = 150,
		personalHeight = 30,
		friendlyWidth = 150,
		friendlyHeight = 30,
		enemyWidth = 150,
		enemyHeight = 30,
	},
	colors = {
		glowColor = {r = 1, g = 1, b = 1, a = 1},
		castColor = {r = 1, g = 0.81, b = 0},
		tapped = {r = 0.6, g = 0.6, b = 0.6},
		castNoInterruptColor = {r = 0.78, g = 0.25, b = 0.25},
		castbarDesaturate = true,
		reactions = {
			good = {r = .29,  g = .68, b = .30},
			neutral = {r = .85, g = .77, b = .36},
			bad = {r = 0.78, g = 0.25, b = 0.25},
		},
		healPrediction = {
			personal = {r = 0, g = 1, b = 0.5, a = 0.25},
			others = {r = 0, g = 1, b = 0, a = 0.25},
			absorbs = {r = 1, g = 1, b = 0, a = 0.25},
			healAbsorbs = {r = 1, g = 0, b = 0, a = 0.25},
			--overabsorbs = {r = 1, g = 1, b = 0, a = 0.25},
			--overhealabsorbs = {r = 1, g = 0, b = 0, a = 0.25},
		},
		threat = {
			goodColor = {r = 050/255, g = 180/255, b = 000/255},
			badColor = {r = 254/255, g = 045/255, b = 045/255},
			goodTransition = {r = 255/255, g = 217/255, b = 050/255},
			badTransition ={r = 255/255, g = 129/255, b = 050/255},
			offTankColor = {r = 187/255, g = 050/255, b = 255/255},
			offTankColorGoodTransition = {r = .31, g = .45, b = .63},
			offTankColorBadTransition = {r = 0.71, g = 0.43, b = 0.27},
		},
		power = {
			ENERGY = {r = 0.65, g = 0.63, b = 0.35},
			FOCUS = {r = 0.71, g = 0.43, b = 0.27},
			FURY = {r = 227/255, g = 126/255, b = 39/255, atlas = '_DemonHunter-DemonicFuryBar'},
			INSANITY = {r = 0.55, g = 0.14, b = 0.69, atlas = '_Priest-InsanityBar'},
			LUNAR_POWER = {r = .9, g = .86, b = .12, atlas = '_Druid-LunarBar'},
			MAELSTROM = {r = 0, g = 0.5, b = 1, atlas = '_Shaman-MaelstromBar'},
			MANA = {r = 0.31, g = 0.45, b = 0.63},
			PAIN = {r = 225/255, g = 225/255, b = 225/255, atlas = '_DemonHunter-DemonicPainBar'},
			RAGE = {r = 0.78, g = 0.25, b = 0.25},
			RUNIC_POWER = {r = 0, g = 0.82, b = 1},
			ALT_POWER = {r = 0.2, g = 0.4, b = 0.8},
		},
		selection = {
			[ 0] = {r = 254/255, g = 045/255, b = 045/255}, -- HOSTILE
			[ 1] = {r = 255/255, g = 129/255, b = 050/255}, -- UNFRIENDLY
			[ 2] = {r = 255/255, g = 217/255, b = 050/255}, -- NEUTRAL
			[ 3] = {r = 050/255, g = 180/255, b = 000/255}, -- FRIENDLY
			[ 5] = {r = 102/255, g = 136/255, b = 255/255}, -- PLAYER_EXTENDED
			[ 6] = {r = 102/255, g = 050/255, b = 255/255}, -- PARTY
			[ 7] = {r = 187/255, g = 050/255, b = 255/255}, -- PARTY_PVP
			[ 8] = {r = 050/255, g = 255/255, b = 108/255}, -- FRIEND
			[ 9] = {r = 153/255, g = 153/255, b = 153/255}, -- DEAD
			[13] = {r = 025/255, g = 147/255, b = 072/255}, -- BATTLEGROUND_FRIENDLY_PVP
		},
		classResources = {
			comboPoints = {
				[1] = {r = .69, g = .31, b = .31},
				[2] = {r = .65, g = .42, b = .31},
				[3] = {r = .65, g = .63, b = .35},
				[4] = {r = .46, g = .63, b = .35},
				[5] = {r = .33, g = .63, b = .33},
				[6] = {r = .33, g = .63, b = .33},
			},
			DEATHKNIGHT = { r = .31, g = .45, b = .63},
			PALADIN = { r = 228/255, g = 225/255, b = 16/255},
			MAGE = { r = 0, g = 157/255, b = 1},
			MONK = {
				[1] = {r = .57, g = .63, b = .35},
				[2] = {r = .47, g = .63, b = .35},
				[3] = {r = .37, g = .63, b = .35},
				[4] = {r = .27, g = .63, b = .33},
				[5] = {r = .17, g = .63, b = .33},
				[6] = {r = 12/255, g = 145/255, b = 58/255}
			},
			WARLOCK = {r = 148/255, g = 130/255, b = 201/255}
		},
	},
	filters = {
		ElvUI_Boss = {triggers = {enable = false}},
		ElvUI_Target = {triggers = {enable = true}},
		ElvUI_NonTarget = {triggers = {enable = true}},
		ElvUI_Explosives = {triggers = {enable = true}},
	},
	font = 'PT Sans Narrow',
	fontOutline = 'OUTLINE',
	fontSize = 11,
	loadDistance = 40,
	lowHealthThreshold = 0.4,
	motionType =  'STACKED',
	nameColoredGlow = false,
	showEnemyCombat = 'DISABLED',
	showFriendlyCombat = 'DISABLED',
	statusbar = 'ElvUI Norm',
	highlight = true,
	fadeIn = true,
	threat = {
		enable = true,
		beingTankedByTank = true,
		goodScale = 1,
		badScale = 1,
		useThreatColor = true,
		indicator = false,
	},
	visibility = {
		showAll = true,
		enemy = {
			guardians = false,
			minions = false,
			minus = true,
			pets = false,
			totems = false,
		},
		friendly = {
			guardians = false,
			minions = false,
			npcs = true,
			pets = false,
			totems = false,
		},
	},
	cutaway =  {
		health = {
			enabled = false,
			fadeOutTime = 0.6,
			lengthBeforeFade = 0.3,
			forceBlankTexture = true,
		},
		power = {
			enabled = false,
			fadeOutTime = 0.6,
			lengthBeforeFade = 0.3,
			forceBlankTexture = true,
		},
	},
	units = {
		PLAYER = {
			enable = false,
			showTitle = true,
			nameOnly = false,
			useStaticPosition = false,
			clickthrough = false,
			classpower = {
				enable = true,
				classColor = false,
				height = 7,
				sortDirection = 'NONE',
				width = 130,
				xOffset = 0,
				yOffset = 10,
			},
			visibility = {
				hideDelay = 3,
				showAlways = false,
				showInCombat = true,
				showWithTarget = false,
			},
			buffs = CopyTable(NP_Auras),
			castbar = CopyTable(NP_Castbar),
			debuffs = CopyTable(NP_Auras),
			health = CopyTable(NP_Health),
			level = CopyTable(NP_Level),
			name = CopyTable(NP_Name),
			portrait = CopyTable(NP_Portrait),
			power = CopyTable(NP_Power),
			pvpclassificationindicator = CopyTable(NP_PvPClassificationIndicator),
			pvpindicator = CopyTable(NP_PvPIcon),
			raidTargetIndicator = CopyTable(NP_RaidTargetIndicator),
			title = CopyTable(NP_Title),
		},
		TARGET = {
			enable = true,
			glowStyle = 'style4',
			classpower = {
				enable = false,
				classColor = false,
				height = 7,
				sortDirection = 'NONE',
				width = 125,
				xOffset = 0,
				yOffset = 30,
			},
		},
		FRIENDLY_PLAYER = {
			enable = true,
			showTitle = true,
			nameOnly = false,
			markHealers = true,
			markTanks = true,
			buffs = CopyTable(NP_Auras),
			castbar = CopyTable(NP_Castbar),
			debuffs =  CopyTable(NP_Auras),
			health = CopyTable(NP_Health),
			level = CopyTable(NP_Level),
			name = CopyTable(NP_Name),
			portrait = CopyTable(NP_Portrait),
			power = CopyTable(NP_Power),
			pvpclassificationindicator = CopyTable(NP_PvPClassificationIndicator),
			pvpindicator = CopyTable(NP_PvPIcon),
			raidTargetIndicator = CopyTable(NP_RaidTargetIndicator),
			title = CopyTable(NP_Title),
		},
		ENEMY_PLAYER = {
			enable = true,
			showTitle = true,
			nameOnly = false,
			markHealers = true,
			markTanks = true,
			buffs = CopyTable(NP_Auras),
			castbar = CopyTable(NP_Castbar),
			debuffs =  CopyTable(NP_Auras),
			health = CopyTable(NP_Health),
			level = CopyTable(NP_Level),
			name = CopyTable(NP_Name),
			portrait = CopyTable(NP_Portrait),
			power = CopyTable(NP_Power),
			pvpclassificationindicator = CopyTable(NP_PvPClassificationIndicator),
			pvpindicator = CopyTable(NP_PvPIcon),
			raidTargetIndicator = CopyTable(NP_RaidTargetIndicator),
			title = CopyTable(NP_Title),
		},
		FRIENDLY_NPC = {
			enable = true,
			showTitle = true,
			nameOnly = true,
			widgetXPBar = {
				enable = true,
				yOffset = -4,
				color = {
					r = 0.529,
					g = 0.808,
					b = 0.922
				}
			},
			buffs = CopyTable(NP_Auras),
			castbar = CopyTable(NP_Castbar),
			debuffs = CopyTable(NP_Auras),
			eliteIcon = CopyTable(NP_EliteIcon),
			health = CopyTable(NP_Health),
			level = CopyTable(NP_Level),
			name = CopyTable(NP_Name),
			portrait = CopyTable(NP_Portrait),
			power = CopyTable(NP_Power),
			pvpindicator = CopyTable(NP_PvPIcon),
			questIcon = CopyTable(NP_QuestIcon),
			raidTargetIndicator = CopyTable(NP_RaidTargetIndicator),
			title = CopyTable(NP_Title),
		},
		ENEMY_NPC = {
			enable = true,
			showTitle = true,
			nameOnly = false,
			widgetXPBar = {
				enable = true,
				yOffset = -4,
				color = {
					r = 0.529,
					g = 0.808,
					b = 0.922
				}
			},
			buffs = CopyTable(NP_Auras),
			castbar = CopyTable(NP_Castbar),
			debuffs = CopyTable(NP_Auras),
			eliteIcon = CopyTable(NP_EliteIcon),
			health = CopyTable(NP_Health),
			level = CopyTable(NP_Level),
			name = CopyTable(NP_Name),
			portrait = CopyTable(NP_Portrait),
			power = CopyTable(NP_Power),
			pvpindicator = CopyTable(NP_PvPIcon),
			questIcon = CopyTable(NP_QuestIcon),
			raidTargetIndicator = CopyTable(NP_RaidTargetIndicator),
			title = CopyTable(NP_Title),
		},
	},
};

P.nameplates.units.PLAYER.buffs.maxDuration = 300
P.nameplates.units.PLAYER.buffs.priority = 'Blacklist,blockNoDuration,Personal,TurtleBuffs,PlayerBuffs'
P.nameplates.units.PLAYER.debuffs.anchorPoint = 'TOPRIGHT'
P.nameplates.units.PLAYER.debuffs.growthX = 'LEFT'
P.nameplates.units.PLAYER.debuffs.growthY = 'UP'
P.nameplates.units.PLAYER.debuffs.yOffset = 35
P.nameplates.units.PLAYER.debuffs.priority = 'Blacklist,blockNoDuration,Personal,Boss,CCDebuffs,RaidDebuffs,Dispellable'
P.nameplates.units.PLAYER.name.enable = false
P.nameplates.units.PLAYER.name.format = '[name]'
P.nameplates.units.PLAYER.level.enable = false
P.nameplates.units.PLAYER.power.enable = true
P.nameplates.units.PLAYER.castbar.yOffset = -20

P.nameplates.units.FRIENDLY_PLAYER.buffs.priority = 'Blacklist,blockNoDuration,Personal,TurtleBuffs'
P.nameplates.units.FRIENDLY_PLAYER.debuffs.anchorPoint = 'TOPRIGHT'
P.nameplates.units.FRIENDLY_PLAYER.debuffs.growthX = 'LEFT'
P.nameplates.units.FRIENDLY_PLAYER.debuffs.growthY = 'UP'
P.nameplates.units.FRIENDLY_PLAYER.debuffs.yOffset = 35
P.nameplates.units.FRIENDLY_PLAYER.debuffs.priority = 'Blacklist,Dispellable,blockNoDuration,Personal,Boss,CCDebuffs'

P.nameplates.units.ENEMY_PLAYER.buffs.priority = 'Blacklist,Dispellable,PlayerBuffs,TurtleBuffs'
P.nameplates.units.ENEMY_PLAYER.buffs.maxDuration = 300
P.nameplates.units.ENEMY_PLAYER.debuffs.anchorPoint = 'TOPRIGHT'
P.nameplates.units.ENEMY_PLAYER.debuffs.growthX = 'LEFT'
P.nameplates.units.ENEMY_PLAYER.debuffs.growthY = 'UP'
P.nameplates.units.ENEMY_PLAYER.debuffs.yOffset = 35
P.nameplates.units.ENEMY_PLAYER.debuffs.priority = 'Blacklist,blockNoDuration,Personal,Boss,CCDebuffs,RaidDebuffs'
P.nameplates.units.ENEMY_PLAYER.name.format = '[namecolor][name:abbrev:long]'

P.nameplates.units.FRIENDLY_NPC.buffs.priority = 'Blacklist,blockNoDuration,Personal,TurtleBuffs'
P.nameplates.units.FRIENDLY_NPC.debuffs.anchorPoint = 'TOPRIGHT'
P.nameplates.units.FRIENDLY_NPC.debuffs.growthX = 'LEFT'
P.nameplates.units.FRIENDLY_NPC.debuffs.growthY = 'UP'
P.nameplates.units.FRIENDLY_NPC.debuffs.yOffset = 35
P.nameplates.units.FRIENDLY_NPC.debuffs.priority = 'Blacklist,Boss,CCDebuffs,RaidDebuffs,Dispellable'
P.nameplates.units.FRIENDLY_NPC.level.format = '[difficultycolor][level][shortclassification]'
P.nameplates.units.FRIENDLY_NPC.title.format = '[npctitle]'

P.nameplates.units.ENEMY_NPC.buffs.priority = 'Blacklist,RaidBuffsElvUI,Dispellable,blockNoDuration,PlayerBuffs,TurtleBuffs,CastByUnit'
P.nameplates.units.ENEMY_NPC.debuffs.anchorPoint = 'TOPRIGHT'
P.nameplates.units.ENEMY_NPC.debuffs.growthX = 'LEFT'
P.nameplates.units.ENEMY_NPC.debuffs.growthY = 'UP'
P.nameplates.units.ENEMY_NPC.debuffs.yOffset = 35
P.nameplates.units.ENEMY_NPC.debuffs.priority = 'Blacklist,Personal,CCDebuffs'
P.nameplates.units.ENEMY_NPC.level.format = '[difficultycolor][level][shortclassification]'
P.nameplates.units.ENEMY_NPC.title.format = '[npctitle]'
P.nameplates.units.ENEMY_NPC.name.format = '[name]'

--Auras
P.auras = {
	font = 'Homespun',
	fontOutline = 'MONOCHROMEOUTLINE',
	countYOffset = 0,
	countXOffset = 0,
	timeYOffset = 0,
	timeXOffset = 0,
	fadeThreshold = 6,
	showDuration = true,
	barShow = false,
	barTexture = 'ElvUI Norm',
	barPosition = 'BOTTOM',
	barWidth = 2,
	barHeight = 2,
	barSpacing = 2,
	barColor = { r = 0, g = .8, b = 0 },
	barColorGradient = false,
	barNoDuration = true,
	buffs = {
		growthDirection = 'LEFT_DOWN',
		wrapAfter = 12,
		maxWraps = 3,
		horizontalSpacing = 6,
		verticalSpacing = 16,
		sortMethod = 'TIME',
		sortDir = '-',
		seperateOwn = 1,
		size = 32,
		countFontsize = 10,
		durationFontSize = 10,
	},
	debuffs = {
		growthDirection = 'LEFT_DOWN',
		wrapAfter = 12,
		maxWraps = 1,
		horizontalSpacing = 6,
		verticalSpacing = 16,
		sortMethod = 'TIME',
		sortDir = '-',
		seperateOwn = 1,
		size = 32,
		countFontsize = 10,
		durationFontSize = 10,
	},
}

--Chat
P.chat = {
	lockPositions = true,
	url = true,
	shortChannels = true,
	hyperlinkHover = true,
	throttleInterval = 45,
	scrollDownInterval = 15,
	fade = true,
	font = 'PT Sans Narrow',
	fontOutline = 'NONE',
	sticky = true,
	emotionIcons = true,
	keywordSound = 'None',
	whisperSound = 'Whisper Alert',
	noAlertInCombat = false,
	chatHistory = true,
	lfgIcons = true,
	timeStampFormat = 'NONE',
	keywords = 'ElvUI',
	separateSizes = false,
	panelWidth = 412,
	panelHeight = 180,
	panelWidthRight = 412,
	panelHeightRight = 180,
	panelBackdropNameLeft = '',
	panelBackdropNameRight = '',
	panelBackdrop = 'SHOWBOTH',
	panelTabBackdrop = false,
	panelTabTransparency = false,
	editBoxPosition = 'BELOW_CHAT',
	fadeUndockedTabs = true,
	fadeTabsNoBackdrop = true,
	useAltKey = false,
	classColorMentionsChat = true,
	numAllowedCombatRepeat = 5,
	useCustomTimeColor = true,
	customTimeColor = {r = 0.7, g = 0.7, b = 0.7},
	numScrollMessages = 3,
	autoClosePetBattleLog = true,
	socialQueueMessages = false,
	tabFont = 'PT Sans Narrow',
	tabFontSize = 12,
	tabFontOutline = 'NONE',
	copyChatLines = false,
	useBTagName = false,
	panelColor = {r = .06, g = .06, b = .06, a = 0.8},
	pinVoiceButtons = true,
	hideVoiceButtons = false,
	desaturateVoiceIcons = true,
}

--Datatexts
P.datatexts = {
	font = 'PT Sans Narrow',
	fontSize = 12,
	fontOutline = 'NONE',
	wordWrap = false,
	panels = {
		LeftChatDataPanel = {
			left = 'Talent/Loot Specialization',
			middle = 'Durability',
			right = 'BfA Missions',
		},
		RightChatDataPanel = {
			left = 'System',
			middle = 'Time',
			right = 'Gold',
		},
		LeftMiniPanel = 'Guild',
		RightMiniPanel = 'Friends',
		BottomMiniPanel = '',
		TopMiniPanel = '',
		BottomLeftMiniPanel = '',
		BottomRightMiniPanel = '',
		TopRightMiniPanel = '',
		TopLeftMiniPanel = '',
	},
	battleground = true,
	panelTransparency = false,
	panelBackdrop = true,
	noCombatClick = false,
	noCombatHover = false,

	--Datatext Options
	---General
	goldFormat = 'BLIZZARD',
	goldCoins = false,
	---Currencies
	currencies = {
		displayedCurrency = 'GOLD',
		displayStyle = 'ICON',
	},
	---Time
	localtime = true,
	time24 = _G.GetCurrentRegion() ~= 1, -- Non US region will default to the 24-hour clock
	---Friends
	friends = {
		--status
		hideAFK = false,
		hideDND = false,
		--clients
		hideWoW = false,
		hideD3 = false,
		hideWTCG = false, --Hearthstone
		hideHero = false, --Heros of the Storm
		hidePro = false, --Overwatch
		hideS1 = false,
		hideS2 = false,
		hideDST2 = false,
		hideBSAp = false, --Mobile
		hideApp = false, --Launcher
	},

	--Enabled/Disabled Panels
	minimapPanels = true,
	leftChatPanel = true,
	rightChatPanel = true,
	minimapTop = false,
	minimapTopLeft = false,
	minimapTopRight = false,
	minimapBottom = false,
	minimapBottomLeft = false,
	minimapBottomRight = false,
}

--Tooltip
P.tooltip = {
	cursorAnchor = false,
	cursorAnchorType = 'ANCHOR_CURSOR',
	cursorAnchorX = 0,
	cursorAnchorY = 0,
	alwaysShowRealm = false,
	targetInfo = true,
	playerTitles = true,
	guildRanks = true,
	itemCount = 'BAGS_ONLY',
	spellID = true,
	showMount = true,
	npcID = true,
	role = true,
	font = 'PT Sans Narrow',
	fontOutline = 'NONE',
	headerFontSize = 12,
	textFontSize = 12,
	smallTextFontSize = 12,
	colorAlpha = 0.8,
	visibility = {
		unitFrames = 'NONE',
		bags = 'NONE',
		actionbars = 'NONE',
		combat = false,
		combatOverride = 'ALL',
	},
	healthBar = {
		text = true,
		height = 7,
		font = 'Homespun',
		fontSize = 10,
		fontOutline = 'OUTLINE',
		statusPosition = 'BOTTOM',
	},
	useCustomFactionColors = false,
	factionColors = {
		[1] = {r = 0.8, g = 0.3, b = 0.22},
		[2] = {r = 0.8, g = 0.3, b = 0.22},
		[3] = {r = 0.75, g = 0.27, b = 0},
		[4] = {r = 0.9, g = 0.7, b = 0},
		[5] = {r = 0, g = 0.6, b = 0.1},
		[6] = {r = 0, g = 0.6, b = 0.1},
		[7] = {r = 0, g = 0.6, b = 0.1},
		[8] = {r = 0, g = 0.6, b = 0.1},
	}
}

local UF_Auras = {
	anchorPoint = 'TOPLEFT',
	attachTo = 'FRAME',
	clickThrough = false,
	countFont = 'PT Sans Narrow',
	countFontOutline = 'OUTLINE',
	countFontSize = 12,
	durationPosition = 'CENTER',
	enable = false,
	numrows = 1,
	perrow = 8,
	sortDirection = 'DESCENDING',
	sortMethod = 'TIME_REMAINING',
	xOffset = 0,
	yOffset = 0,
	minDuration = 0,
	maxDuration = 0,
	priority = '',
	sizeOverride = 0,
	spacing = 1,
}

local UF_AuraBars = {
	anchorPoint = 'ABOVE',
	attachTo = 'DEBUFFS',
	detachedWidth = 270,
	enable = true,
	enemyAuraType = 'HARMFUL',
	friendlyAuraType = 'HELPFUL',
	height = 20,
	maxBars = 6,
	maxDuration = 0,
	minDuration = 0,
	sortDirection = 'DESCENDING',
	sortMethod = 'TIME_REMAINING',
	priority = '',
	spacing = 0,
	yOffset = 0,
}

local UF_AuraWatch = {
	enable = true,
	size = 8,
	style = 'texturedIcon',
	profileSpecific = false,
}

local UF_Castbar = {
	displayTarget = false,
	enable = true,
	format = 'REMAINING',
	height = 18,
	hidetext = false,
	icon = true,
	iconAttached = true,
	iconAttachedTo = 'Frame',
	iconPosition = 'LEFT',
	iconSize = 42,
	iconXOffset = -10,
	iconYOffset = 0,
	insideInfoPanel = true,
	latency = true,
	overlayOnFrame = 'None',
	spark = true,
	textColor = {r = 0.84, g = 0.75, b = 0.65, a = 1},
	tickColor = {r = 0, g = 0, b = 0, a = 0.8},
	ticks = true,
	tickWidth = 1,
	timeToHold = 0,
	width = 270,
	xOffsetText = 4,
	xOffsetTime = -4,
	yOffsetText = 0,
	yOffsetTime = 0,
	strataAndLevel = {
		useCustomStrata = false,
		frameStrata = 'LOW',
		useCustomLevel = false,
		frameLevel = 1,
	},
}

local UF_Cutaway = {
	health = {
		enabled = false,
		fadeOutTime = 0.6,
		forceBlankTexture = true,
		lengthBeforeFade = 0.3,
	},
	power = {
		enabled = false,
		fadeOutTime = 0.6,
		forceBlankTexture = true,
		lengthBeforeFade = 0.3,
	},
}

local UF_Health = {
	attachTextTo = 'Health',
	orientation = 'HORIZONTAL',
	position = 'RIGHT',
	reverseFill = false,
	text_format = '',
	xOffset = -2,
	yOffset = 0,
}

local UF_HealthPrediction = {
	enable = false,
	showAbsorbAmount = false,
	showOverAbsorbs = true,
}

local UF_InfoPanel = {
	enable = false,
	height = 20,
	transparent = false,
}

local UF_Fader = {
	casting = false,
	combat = false,
	delay = 0,
	enable = true,
	focus = false,
	health = false,
	hover = false,
	maxAlpha = 1,
	minAlpha = 0.35,
	playertarget = false,
	power = false,
	range = true,
	smooth = 0.33,
	unittarget = false,
	vehicle = false,
}

local UF_Name = {
	attachTextTo = 'Health',
	position = 'CENTER',
	text_format = '',
	xOffset = 0,
	yOffset = 0,
}

local UF_PhaseIndicator = {
	anchorPoint = 'CENTER',
	enable = true,
	scale = 0.8,
	xOffset = 0,
	yOffset = 0,
}

local UF_Portrait = {
	enable = false,
	paused = false,
	fullOverlay = false,
	overlay = false,
	overlayAlpha = 0.5,
	camDistanceScale = 2,
	desaturation =  0,
	rotation = 0,
	style = '3D',
	width = 45,
	xOffset = 0,
	yOffset = 0,
}

local UF_Power = {
	attachTextTo = 'Health',
	autoHide = false,
	detachedWidth = 250,
	detachFromFrame = false,
	enable = true,
	height = 10,
	hideonnpc = false,
	offset = 0,
	parent = 'FRAME',
	position = 'LEFT',
	powerPrediction = false,
	reverseFill = false,
	text_format = '',
	width = 'fill',
	xOffset = 2,
	yOffset = 0,
	displayAltPower = false,
	strataAndLevel = {
		frameLevel = 1,
		frameStrata = 'LOW',
		useCustomLevel = false,
		useCustomStrata = false,
	},
}

local UF_PVPIcon = {
	anchorPoint = 'CENTER',
	enable = false,
	scale = 1,
	xOffset = 0,
	yOffset = 0,
}

local UF_RaidRoles = {
	enable = true,
	position = 'TOPLEFT',
	xOffset = 0,
	yOffset = 0,
}

local UF_Ressurect = {
	attachTo = 'CENTER',
	attachToObject = 'Frame',
	enable = true,
	size = 30,
	xOffset = 0,
	yOffset = 0,
}

local UF_RaidIcon = {
	attachTo = 'TOP',
	attachToObject = 'Frame',
	enable = true,
	size = 18,
	xOffset = 0,
	yOffset = 8,
}

local UF_RaidDebuffs = {
	enable = true,
	showDispellableDebuff = true,
	onlyMatchSpellID = true,
	fontSize = 10,
	font = 'Homespun',
	fontOutline = 'MONOCHROMEOUTLINE',
	size = 26,
	xOffset = 0,
	yOffset = 0,
	duration = {
		position = 'CENTER',
		xOffset = 0,
		yOffset = 0,
		color = {r = 1, g = 0.9, b = 0, a = 1}
	},
	stack = {
		position = 'BOTTOMRIGHT',
		xOffset = 0,
		yOffset = 2,
		color = {r = 1, g = 0.9, b = 0, a = 1}
	},
}

local UF_RoleIcon = {
	enable = true,
	position = 'BOTTOMRIGHT',
	attachTo = 'Health',
	xOffset = -1,
	yOffset = 1,
	size = 15,
	tank = true,
	healer = true,
	damager = true,
	combatHide = false,
}

local UF_ReadyCheckIcon = {
	enable = true,
	size = 12,
	attachTo = 'Health',
	position = 'BOTTOM',
	xOffset = 0,
	yOffset = 2,
}

local UF_SummonIcon = {
	enable = true,
	size = 30,
	attachTo = 'CENTER',
	attachToObject = 'Frame',
	xOffset = 0,
	yOffset = 0,
}

local UF_SubGroup = {
	enable = false,
	anchorPoint = 'RIGHT',
	xOffset = 1,
	yOffset = 0,
	width = 120,
	height = 28,
	colorOverride = 'USE_DEFAULT',
	name = CopyTable(UF_Name),
	raidicon = CopyTable(UF_RaidIcon),
}

local UF_ClassBar = {
	enable = true,
	fill = 'fill',
	height = 10,
	autoHide = false,
	sortDirection = 'asc',
	additionalPowerText = false,
	altPowerColor = { r = 0.2, g = 0.4, b = 0.8 },
	altPowerTextFormat = '[altpower:current]',
	detachFromFrame = false,
	detachedWidth = 250,
	parent = 'FRAME',
	verticalOrientation = false,
	orientation = 'HORIZONTAL',
	spacing = 5,
	strataAndLevel = {
		useCustomStrata = false,
		frameStrata = 'LOW',
		useCustomLevel = false,
		frameLevel = 1,
	},
}

--UnitFrame
P.unitframe = {
	smoothbars = false,
	statusbar = 'ElvUI Norm',
	font = 'Homespun',
	fontSize = 10,
	fontOutline = 'MONOCHROMEOUTLINE',
	debuffHighlighting = 'FILL',
	smartRaidFilter = true,
	targetOnMouseDown = false,
	auraBlacklistModifier = 'SHIFT',
	thinBorders = false,
	targetSound = false,
	colors = {
		borderColor = {r = 0, g = 0, b = 0},
		healthclass = false,
		--healththreat = false,
		healthselection = false,
		forcehealthreaction = false,
		powerclass = false,
		--powerthreat = false,
		powerselection = false,
		colorhealthbyvalue = true,
		customhealthbackdrop = false,
		custompowerbackdrop = false,
		customcastbarbackdrop = false,
		customaurabarbackdrop = false,
		customclasspowerbackdrop = false,
		useDeadBackdrop = false,
		classbackdrop = false,
		healthMultiplier = 0,
		auraBarByType = true,
		auraBarTurtle = true,
		auraBarTurtleColor = {r = 143/255, g = 101/255, b = 158/255},
		transparentHealth = false,
		transparentPower = false,
		transparentCastbar = false,
		transparentAurabars = false,
		transparentClasspower = false,
		invertCastBar = false,
		invertAurabars = false,
		invertPower = false,
		invertClasspower = false,
		castColor = { r = .31, g = .31, b = .31 },
		castNoInterrupt = { r = 0.78, g = 0.25, b = 0.25 },
		castClassColor = false,
		castReactionColor = false,
		health = { r = .31, g = .31, b = .31 },
		health_backdrop = { r = .8, g = .01, b = .01 },
		health_backdrop_dead = { r = .8, g = .01, b = .01 },
		castbar_backdrop = { r = 0.5, g = 0.5, b = 0.5 },
		classpower_backdrop = { r = 0.5, g = 0.5, b = 0.5 },
		aurabar_backdrop = { r = 0.5, g = 0.5, b = 0.5 },
		power_backdrop = { r = 0.5, g = 0.5, b = 0.5 },
		tapped = { r = 0.55, g = 0.57, b = 0.61},
		disconnected = { r = 0.84, g = 0.75, b = 0.65},
		auraBarBuff = { r = .31, g = .31, b = .31 },
		auraBarDebuff = {r = 0.8, g = 0.1, b = 0.1},
		power = {
			MANA = {r = 0.31, g = 0.45, b = 0.63},
			RAGE = {r = 0.78, g = 0.25, b = 0.25},
			FOCUS = {r = 0.71, g = 0.43, b = 0.27},
			ENERGY = {r = 0.65, g = 0.63, b = 0.35},
			RUNIC_POWER = {r = 0, g = 0.82, b = 1},
			PAIN = {r = 225/255, g = 225/255, b = 225/255},
			FURY = {r = 227/255, g = 126/255, b = 39/255},
			LUNAR_POWER = {r = .9, g = .86, b = .12},
			INSANITY = {r = 0.55, g = 0.14, b = 0.69},
			MAELSTROM = {r = 0, g = 0.5, b = 1},
			ALT_POWER = {r = 0.2, g = 0.4, b = 0.8},
		},
		reaction = {
			BAD = { r = 199/255, g = 64/255, b = 64/255 },
			NEUTRAL = { r = 218/255, g = 197/255, b = 92/255 },
			GOOD = { r = 75/255, g = 175/255, b = 76/255 },
		},
		threat = {
			[ 0] = {r = 0.5, g = 0.5, b = 0.5}, -- low
			[ 1] = {r = 1.0, g = 1.0, b = 0.5}, -- overnuking
			[ 2] = {r = 1.0, g = 0.5, b = 0.0}, -- losing threat
			[ 3] = {r = 1.0, g = 0.2, b = 0.2}, -- tanking securely
		},
		selection = {
			[ 0] = {r = 254/255, g = 045/255, b = 045/255}, -- HOSTILE
			[ 1] = {r = 255/255, g = 129/255, b = 050/255}, -- UNFRIENDLY
			[ 2] = {r = 255/255, g = 217/255, b = 050/255}, -- NEUTRAL
			[ 3] = {r = 050/255, g = 180/255, b = 000/255}, -- FRIENDLY
			[ 5] = {r = 102/255, g = 136/255, b = 255/255}, -- PLAYER_EXTENDED
			[ 6] = {r = 102/255, g = 050/255, b = 255/255}, -- PARTY
			[ 7] = {r = 187/255, g = 050/255, b = 255/255}, -- PARTY_PVP
			[ 8] = {r = 050/255, g = 255/255, b = 108/255}, -- FRIEND
			[ 9] = {r = 153/255, g = 153/255, b = 153/255}, -- DEAD
			[13] = {r = 025/255, g = 147/255, b = 072/255}, -- BATTLEGROUND_FRIENDLY_PVP
		},
		healPrediction = {
			personal = {r = 0, g = 1, b = 0.5, a = 0.25},
			others = {r = 0, g = 1, b = 0, a = 0.25},
			absorbs = {r = 1, g = 1, b = 0, a = 0.25},
			healAbsorbs = {r = 1, g = 0, b = 0, a = 0.25},
			overabsorbs = {r = 1, g = 1, b = 0, a = 0.25},
			overhealabsorbs = {r = 1, g = 0, b = 0, a = 0.25},
			maxOverflow = 0,
		},
		powerPrediction = {
			enable = false,
			additional = {r = 1, g = 1, b = 1, a = 1},
			color = {r = 1, g = 1, b = 1, a = 1},
		},
		classResources = {
			comboPoints = {
				[1] = {r = 0.69, g = 0.31, b = 0.31},
				[2] = {r = 0.65, g = 0.63, b = 0.34},
				[3] = {r = 0.33, g = 0.59, b = 0.33},
			},
			DEATHKNIGHT = {r = 0, g = 1, b = 1},
			PALADIN = {r = 228/255, g = 225/255, b = 16/255},
			MAGE = {r = 0, g = 157/255, b = 255/255},
			MONK = {
				[1] = {r = .57, g = .63, b = .35},
				[2] = {r = .47, g = .63, b = .35},
				[3] = {r = .37, g = .63, b = .35},
				[4] = {r = .27, g = .63, b = .33},
				[5] = {r = .17, g = .63, b = .33},
				[6] = {r = 12/255, g = 145/255, b = 58/255}
			},
			WARLOCK = {r = 148/255, g = 130/255, b = 201/255}
		},
		frameGlow = {
			mainGlow = {
				enable = false,
				class = false,
				color = {r=1, g=1, b=1, a=1}
			},
			targetGlow = {
				enable = true,
				class = true,
				color = {r=1, g=1, b=1, a=1}
			},
			mouseoverGlow = {
				enable = true,
				class = false,
				texture = 'ElvUI Blank',
				color = {r=1, g=1, b=1, a=0.1}
			}
		},
		debuffHighlight = {
			Magic = {r = 0.2, g = 0.6, b = 1, a = 0.45},
			Curse = {r = 0.6, g = 0, b = 1, a = 0.45},
			Disease = {r = 0.6, g = 0.4, b = 0, a = 0.45},
			Poison = {r = 0, g = 0.6, b = 0, a = 0.45},
			blendMode = 'ADD',
		},
	},
	units = {
		player = {
			enable = true,
			orientation = 'LEFT',
			width = 270,
			height = 54,
			lowmana = 30,
			threatStyle = 'GLOW',
			smartAuraPosition = 'DISABLED',
			colorOverride = 'USE_DEFAULT',
			disableMouseoverGlow = false,
			disableTargetGlow = true,
			pvp = {
				position = 'BOTTOM',
				text_format = '||cFFB04F4F[pvptimer][mouseover]||r',
				xOffset = 0,
				yOffset = 0,
			},
			RestIcon = {
				enable = true,
				defaultColor = true,
				color = {r = 1, g = 1, b = 1, a = 1},
				anchorPoint = 'TOPLEFT',
				xOffset = -3,
				yOffset = 6,
				size = 22,
				texture = 'DEFAULT',
			},
			CombatIcon = {
				enable = true,
				defaultColor = true,
				color = {r = 1, g = 0.2, b = 0.2, a = 1},
				anchorPoint = 'CENTER',
				xOffset = 0,
				yOffset = 0,
				size = 20,
				texture = 'DEFAULT',
			},
			classbar = CopyTable(UF_ClassBar),
			stagger = {
				enable = true,
				width = 10,
			},
			aurabar = CopyTable(UF_AuraBars),
			buffs = CopyTable(UF_Auras),
			castbar = CopyTable(UF_Castbar),
			cutaway = CopyTable(UF_Cutaway),
			debuffs = CopyTable(UF_Auras),
			fader = CopyTable(UF_Fader),
			healPrediction = CopyTable(UF_HealthPrediction),
			health = CopyTable(UF_Health),
			infoPanel = CopyTable(UF_InfoPanel),
			name = CopyTable(UF_Name),
			portrait = CopyTable(UF_Portrait),
			power = CopyTable(UF_Power),
			pvpIcon = CopyTable(UF_PVPIcon),
			raidicon = CopyTable(UF_RaidIcon),
			raidRoleIcons = CopyTable(UF_RaidRoles),
			resurrectIcon = CopyTable(UF_Ressurect),
		},
		target = {
			enable = true,
			width = 270,
			height = 54,
			orientation = 'RIGHT',
			threatStyle = 'GLOW',
			smartAuraPosition = 'DISABLED',
			colorOverride = 'USE_DEFAULT',
			middleClickFocus = true,
			disableMouseoverGlow = false,
			disableTargetGlow = true,
			aurabar = CopyTable(UF_AuraBars),
			buffs = CopyTable(UF_Auras),
			castbar = CopyTable(UF_Castbar),
			cutaway = CopyTable(UF_Cutaway),
			debuffs = CopyTable(UF_Auras),
			fader = CopyTable(UF_Fader),
			healPrediction = CopyTable(UF_HealthPrediction),
			health = CopyTable(UF_Health),
			infoPanel = CopyTable(UF_InfoPanel),
			name = CopyTable(UF_Name),
			phaseIndicator = CopyTable(UF_PhaseIndicator),
			portrait = CopyTable(UF_Portrait),
			power = CopyTable(UF_Power),
			pvpIcon = CopyTable(UF_PVPIcon),
			raidicon = CopyTable(UF_RaidIcon),
			raidRoleIcons = CopyTable(UF_RaidRoles),
			resurrectIcon = CopyTable(UF_Ressurect),
		},
		targettarget = {
			enable = true,
			threatStyle = 'NONE',
			orientation = 'MIDDLE',
			smartAuraPosition = 'DISABLED',
			colorOverride = 'USE_DEFAULT',
			width = 130,
			height = 36,
			disableMouseoverGlow = false,
			disableTargetGlow = true,
			buffs = CopyTable(UF_Auras),
			cutaway = CopyTable(UF_Cutaway),
			debuffs = CopyTable(UF_Auras),
			fader = CopyTable(UF_Fader),
			health = CopyTable(UF_Health),
			infoPanel = CopyTable(UF_InfoPanel),
			name = CopyTable(UF_Name),
			portrait = CopyTable(UF_Portrait),
			power = CopyTable(UF_Power),
			raidicon = CopyTable(UF_RaidIcon),
		},
		focus = {
			enable = true,
			threatStyle = 'GLOW',
			orientation = 'MIDDLE',
			smartAuraPosition = 'DISABLED',
			colorOverride = 'USE_DEFAULT',
			width = 190,
			height = 36,
			disableMouseoverGlow = false,
			disableTargetGlow = false,
			aurabar = CopyTable(UF_AuraBars),
			buffIndicator = CopyTable(UF_AuraWatch),
			buffs = CopyTable(UF_Auras),
			castbar = CopyTable(UF_Castbar),
			cutaway = CopyTable(UF_Cutaway),
			debuffs = CopyTable(UF_Auras),
			fader = CopyTable(UF_Fader),
			healPrediction = CopyTable(UF_HealthPrediction),
			health = CopyTable(UF_Health),
			infoPanel = CopyTable(UF_InfoPanel),
			name = CopyTable(UF_Name),
			portrait = CopyTable(UF_Portrait),
			power = CopyTable(UF_Power),
			raidicon = CopyTable(UF_RaidIcon),
		},
		pet = {
			enable = true,
			orientation = 'MIDDLE',
			threatStyle = 'GLOW',
			smartAuraPosition = 'DISABLED',
			colorOverride = 'USE_DEFAULT',
			width = 130,
			height = 36,
			disableMouseoverGlow = false,
			disableTargetGlow = true,
			aurabar = CopyTable(UF_AuraBars),
			buffIndicator = CopyTable(UF_AuraWatch),
			buffs = CopyTable(UF_Auras),
			castbar = CopyTable(UF_Castbar),
			cutaway = CopyTable(UF_Cutaway),
			debuffs = CopyTable(UF_Auras),
			fader = CopyTable(UF_Fader),
			healPrediction = CopyTable(UF_HealthPrediction),
			health = CopyTable(UF_Health),
			infoPanel = CopyTable(UF_InfoPanel),
			name = CopyTable(UF_Name),
			portrait = CopyTable(UF_Portrait),
			power = CopyTable(UF_Power),
		},
		boss = {
			enable = true,
			growthDirection = 'DOWN',
			orientation = 'RIGHT',
			smartAuraPosition = 'DISABLED',
			colorOverride = 'USE_DEFAULT',
			width = 216,
			height = 46,
			spacing = 25,
			disableMouseoverGlow = false,
			disableTargetGlow = false,
			health = CopyTable(UF_Health),
			fader = CopyTable(UF_Fader),
			power = CopyTable(UF_Power),
			portrait = CopyTable(UF_Portrait),
			infoPanel = CopyTable(UF_InfoPanel),
			name = CopyTable(UF_Name),
			buffs = CopyTable(UF_Auras),
			debuffs = CopyTable(UF_Auras),
			castbar = CopyTable(UF_Castbar),
			raidicon = CopyTable(UF_RaidIcon),
			cutaway = CopyTable(UF_Cutaway),
		},
		arena = {
			enable = true,
			growthDirection = 'DOWN',
			orientation = 'RIGHT',
			smartAuraPosition = 'DISABLED',
			spacing = 25,
			width = 246,
			height = 47,
			pvpSpecIcon = true,
			colorOverride = 'USE_DEFAULT',
			disableMouseoverGlow = false,
			disableTargetGlow = false,
			pvpTrinket = {
				enable = true,
				position = 'RIGHT',
				size = 46,
				xOffset = 1,
				yOffset = 0,
			},
			buffs = CopyTable(UF_Auras),
			castbar = CopyTable(UF_Castbar),
			cutaway = CopyTable(UF_Cutaway),
			debuffs = CopyTable(UF_Auras),
			fader = CopyTable(UF_Fader),
			healPrediction = CopyTable(UF_HealthPrediction),
			health = CopyTable(UF_Health),
			infoPanel = CopyTable(UF_InfoPanel),
			name = CopyTable(UF_Name),
			portrait = CopyTable(UF_Portrait),
			power = CopyTable(UF_Power),
			raidicon = CopyTable(UF_RaidIcon),
		},
		party = {
			enable = true,
			threatStyle = 'GLOW',
			orientation = 'LEFT',
			visibility = '[@raid6,exists][nogroup] hide;show',
			growthDirection = 'UP_RIGHT',
			horizontalSpacing = 0,
			verticalSpacing = 3,
			numGroups = 1,
			groupsPerRowCol = 1,
			groupBy = 'GROUP',
			sortDir = 'ASC',
			raidWideSorting = false,
			invertGroupingOrder = false,
			startFromCenter = false,
			showPlayer = true,
			colorOverride = 'USE_DEFAULT',
			width = 184,
			height = 54,
			groupSpacing = 0,
			disableMouseoverGlow = false,
			disableTargetGlow = false,
			buffIndicator = CopyTable(UF_AuraWatch),
			buffs = CopyTable(UF_Auras),
			castbar = CopyTable(UF_Castbar),
			classbar = CopyTable(UF_ClassBar),
			cutaway = CopyTable(UF_Cutaway),
			debuffs = CopyTable(UF_Auras),
			fader = CopyTable(UF_Fader),
			healPrediction = CopyTable(UF_HealthPrediction),
			health = CopyTable(UF_Health),
			infoPanel = CopyTable(UF_InfoPanel),
			name = CopyTable(UF_Name),
			petsGroup = CopyTable(UF_SubGroup),
			phaseIndicator = CopyTable(UF_PhaseIndicator),
			portrait = CopyTable(UF_Portrait),
			power = CopyTable(UF_Power),
			raidicon = CopyTable(UF_RaidIcon),
			raidRoleIcons = CopyTable(UF_RaidRoles),
			rdebuffs = CopyTable(UF_RaidDebuffs),
			readycheckIcon = CopyTable(UF_ReadyCheckIcon),
			resurrectIcon = CopyTable(UF_Ressurect),
			roleIcon = CopyTable(UF_RoleIcon),
			summonIcon = CopyTable(UF_SummonIcon),
			targetsGroup = CopyTable(UF_SubGroup),
		},
		tank = {
			enable = true,
			orientation = 'LEFT',
			threatStyle = 'GLOW',
			colorOverride = 'USE_DEFAULT',
			width = 120,
			height = 28,
			disableMouseoverGlow = false,
			disableTargetGlow = false,
			disableDebuffHighlight = true,
			verticalSpacing = 7,
			targetsGroup = CopyTable(UF_SubGroup),
			buffIndicator = CopyTable(UF_AuraWatch),
			buffs = CopyTable(UF_Auras),
			cutaway = CopyTable(UF_Cutaway),
			debuffs = CopyTable(UF_Auras),
			fader = CopyTable(UF_Fader),
			name = CopyTable(UF_Name),
			raidicon = CopyTable(UF_RaidIcon),
			rdebuffs = CopyTable(UF_RaidDebuffs),
		},
	},
}

P.unitframe.units.player.aurabar.enemyAuraType = 'HARMFUL'
P.unitframe.units.player.aurabar.friendlyAuraType = 'HELPFUL'
P.unitframe.units.player.aurabar.maxDuration = 120
P.unitframe.units.player.aurabar.priority = 'Blacklist,blockNoDuration,Personal,Boss,RaidDebuffs,PlayerBuffs'
P.unitframe.units.player.buffs.attachTo = 'DEBUFFS'
P.unitframe.units.player.buffs.priority = 'Blacklist,Personal,PlayerBuffs,Whitelist,blockNoDuration,nonPersonal'
P.unitframe.units.player.classbar.additionalPowerText = true
P.unitframe.units.player.debuffs.enable = true
P.unitframe.units.player.debuffs.priority = 'Blacklist,Personal,nonPersonal'
P.unitframe.units.player.fader.enable = false
P.unitframe.units.player.fader.casting = true
P.unitframe.units.player.fader.combat = true
P.unitframe.units.player.fader.focus = false
P.unitframe.units.player.fader.health = true
P.unitframe.units.player.fader.hover = true
P.unitframe.units.player.fader.unittarget = false
P.unitframe.units.player.fader.playertarget = true
P.unitframe.units.player.fader.power = true
P.unitframe.units.player.fader.range = false
P.unitframe.units.player.fader.vehicle = true
P.unitframe.units.player.healPrediction.enable = true
P.unitframe.units.player.health.position = 'LEFT'
P.unitframe.units.player.health.text_format = '[healthcolor][health:current-percent]'
P.unitframe.units.player.health.xOffset = 2
P.unitframe.units.player.power.position = 'RIGHT'
P.unitframe.units.player.power.text_format = '[powercolor][power:current]'
P.unitframe.units.player.power.xOffset = -2

P.unitframe.units.target.aurabar.maxDuration = 120
P.unitframe.units.target.aurabar.priority = 'Blacklist,Personal,blockNoDuration,PlayerBuffs,Boss,RaidDebuffs'
P.unitframe.units.target.buffs.enable = true
P.unitframe.units.target.buffs.anchorPoint = 'TOPRIGHT'
P.unitframe.units.target.buffs.priority = 'Blacklist,Personal,nonPersonal'
P.unitframe.units.target.debuffs.enable = true
P.unitframe.units.target.debuffs.anchorPoint = 'TOPRIGHT'
P.unitframe.units.target.debuffs.attachTo = 'BUFFS'
P.unitframe.units.target.debuffs.maxDuration = 300
P.unitframe.units.target.debuffs.priority = 'Blacklist,Personal,RaidDebuffs,CCDebuffs,Friendly:Dispellable'
P.unitframe.units.target.healPrediction.enable = true
P.unitframe.units.target.health.text_format = '[healthcolor][health:current-percent]'
P.unitframe.units.target.name.text_format = '[namecolor][name:medium] [difficultycolor][smartlevel] [shortclassification]'
P.unitframe.units.target.power.text_format = '[powercolor][power:current]'

P.unitframe.units.targettarget.buffs.anchorPoint = 'BOTTOMLEFT'
P.unitframe.units.targettarget.buffs.maxDuration = 300
P.unitframe.units.targettarget.buffs.numrows = 1
P.unitframe.units.targettarget.buffs.perrow = 7
P.unitframe.units.targettarget.buffs.priority = 'Blacklist,Personal,PlayerBuffs,Dispellable'
P.unitframe.units.targettarget.debuffs.enable = true
P.unitframe.units.targettarget.debuffs.anchorPoint = 'BOTTOMRIGHT'
P.unitframe.units.targettarget.debuffs.attachTo = 'BUFFS'
P.unitframe.units.targettarget.debuffs.maxDuration = 300
P.unitframe.units.targettarget.debuffs.numrows = 1
P.unitframe.units.targettarget.debuffs.perrow = 5
P.unitframe.units.targettarget.debuffs.priority = 'Blacklist,Personal,Boss,RaidDebuffs,CCDebuffs,Dispellable,Whitelist'
P.unitframe.units.targettarget.infoPanel.height = 14
P.unitframe.units.targettarget.name.text_format = '[namecolor][name:medium]'
P.unitframe.units.targettarget.power.text_format = ''

P.unitframe.units.targettargettarget = CopyTable(P.unitframe.units.targettarget)
P.unitframe.units.targettargettarget.enable = false
P.unitframe.units.targettargettarget.buffs.priority = 'Blacklist,Personal,nonPersonal'
P.unitframe.units.targettargettarget.debuffs.attachTo = 'FRAME'
P.unitframe.units.targettargettarget.debuffs.priority = 'Blacklist,Personal,nonPersonal'
P.unitframe.units.targettargettarget.infoPanel.height = 12

P.unitframe.units.focus.aurabar.enable = false
P.unitframe.units.focus.aurabar.detachedWidth = 190
P.unitframe.units.focus.aurabar.maxBars = 3
P.unitframe.units.focus.aurabar.maxDuration = 120
P.unitframe.units.focus.aurabar.priority = 'Blacklist,blockNoDuration,Personal,PlayerBuffs,Boss,RaidDebuffs'
P.unitframe.units.focus.buffs.anchorPoint = 'BOTTOMLEFT'
P.unitframe.units.focus.buffs.maxDuration = 300
P.unitframe.units.focus.buffs.numrows = 1
P.unitframe.units.focus.buffs.perrow = 7
P.unitframe.units.focus.buffs.priority = 'Blacklist,Personal,PlayerBuffs,CastByUnit,Dispellable,RaidBuffsElvUI'
P.unitframe.units.focus.castbar.width = 190
P.unitframe.units.focus.debuffs.enable = true
P.unitframe.units.focus.debuffs.anchorPoint = 'TOPRIGHT'
P.unitframe.units.focus.debuffs.maxDuration = 300
P.unitframe.units.focus.debuffs.numrows = 1
P.unitframe.units.focus.debuffs.perrow = 5
P.unitframe.units.focus.debuffs.priority = 'Blacklist,Personal,Boss,RaidDebuffs,Dispellable,Whitelist'
P.unitframe.units.focus.healPrediction.enable = true
P.unitframe.units.focus.infoPanel.height = 14
P.unitframe.units.focus.name.text_format = '[namecolor][name:medium]'

P.unitframe.units.focustarget = CopyTable(P.unitframe.units.focus)
P.unitframe.units.focustarget.enable = false
P.unitframe.units.focustarget.aurabar = nil
P.unitframe.units.focustarget.buffs.priority = 'Blacklist,Personal,PlayerBuffs,Dispellable,CastByUnit,RaidBuffsElvUI'
P.unitframe.units.focustarget.debuffs.enable = false
P.unitframe.units.focustarget.debuffs.anchorPoint = 'BOTTOMRIGHT'
P.unitframe.units.focustarget.debuffs.priority = 'Blacklist,Personal,Boss,RaidDebuffs,Dispellable,Whitelist'
P.unitframe.units.focustarget.healPrediction = nil
P.unitframe.units.focustarget.height = 26
P.unitframe.units.focustarget.infoPanel.height = 12
P.unitframe.units.focustarget.threatStyle = 'NONE'

P.unitframe.units.pet.aurabar.enable = false
P.unitframe.units.pet.aurabar.attachTo = 'FRAME'
P.unitframe.units.pet.aurabar.maxDuration = 120
P.unitframe.units.pet.aurabar.detachedWidth = 130
P.unitframe.units.pet.aurabar.yOffset = 2
P.unitframe.units.pet.aurabar.spacing = 2
P.unitframe.units.pet.buffs.anchorPoint = 'BOTTOMLEFT'
P.unitframe.units.pet.buffs.maxDuration = 300
P.unitframe.units.pet.buffs.numrows = 1
P.unitframe.units.pet.buffs.perrow = 7
P.unitframe.units.pet.buffs.priority = 'Blacklist,Personal,PlayerBuffs'
P.unitframe.units.pet.debuffs.anchorPoint = 'BOTTOMRIGHT'
P.unitframe.units.pet.debuffs.maxDuration = 300
P.unitframe.units.pet.debuffs.numrows = 1
P.unitframe.units.pet.debuffs.perrow = 5
P.unitframe.units.pet.debuffs.priority = 'Blacklist,Personal,Boss,RaidDebuffs'
P.unitframe.units.pet.healPrediction.enable = true
P.unitframe.units.pet.infoPanel.height = 12
P.unitframe.units.pet.name.text_format = '[namecolor][name:medium]'

P.unitframe.units.pettarget = CopyTable(P.unitframe.units.pet)
P.unitframe.units.pettarget.enable = false
P.unitframe.units.pettarget.buffs.maxDuration = 300
P.unitframe.units.pettarget.buffs.priority = 'Blacklist,PlayerBuffs,CastByUnit,Whitelist,RaidBuffsElvUI'
P.unitframe.units.pettarget.debuffs.maxDuration = 300
P.unitframe.units.pettarget.debuffs.priority = 'Blacklist,Boss,RaidDebuffs,Dispellable,Whitelist'
P.unitframe.units.pettarget.healPrediction = nil
P.unitframe.units.pettarget.height = 26
P.unitframe.units.pettarget.threatStyle = 'NONE'

P.unitframe.units.boss.buffs.enable = true
P.unitframe.units.boss.buffs.anchorPoint = 'LEFT'
P.unitframe.units.boss.buffs.numrows = 1
P.unitframe.units.boss.buffs.perrow = 3
P.unitframe.units.boss.buffs.priority = 'Blacklist,CastByUnit,Dispellable,Whitelist,RaidBuffsElvUI'
P.unitframe.units.boss.buffs.sizeOverride = 22
P.unitframe.units.boss.buffs.yOffset = 20
P.unitframe.units.boss.castbar.width = 215
P.unitframe.units.boss.debuffs.enable = true
P.unitframe.units.boss.debuffs.anchorPoint = 'LEFT'
P.unitframe.units.boss.debuffs.numrows = 1
P.unitframe.units.boss.debuffs.perrow = 3
P.unitframe.units.boss.debuffs.priority = 'Blacklist,Boss,Personal,RaidDebuffs,CastByUnit,Whitelist'
P.unitframe.units.boss.debuffs.sizeOverride = 22
P.unitframe.units.boss.debuffs.yOffset = -3
P.unitframe.units.boss.health.text_format = '[healthcolor][health:current]'
P.unitframe.units.boss.health.position = 'LEFT'
P.unitframe.units.boss.health.xOffset = 2
P.unitframe.units.boss.infoPanel.height = 16
P.unitframe.units.boss.name.text_format = '[namecolor][name:medium]'
P.unitframe.units.boss.power.position = 'RIGHT'
P.unitframe.units.boss.power.text_format = '[powercolor][power:current]'
P.unitframe.units.boss.power.xOffset = -2

P.unitframe.units.arena.buffs.enable = true
P.unitframe.units.arena.buffs.anchorPoint = 'LEFT'
P.unitframe.units.arena.buffs.maxDuration = 300
P.unitframe.units.arena.buffs.numrows = 1
P.unitframe.units.arena.buffs.perrow = 3
P.unitframe.units.arena.buffs.priority = 'Blacklist,TurtleBuffs,PlayerBuffs,Dispellable'
P.unitframe.units.arena.buffs.sizeOverride = 27
P.unitframe.units.arena.buffs.yOffset = 16
P.unitframe.units.arena.castbar.width = 256
P.unitframe.units.arena.debuffs.enable = true
P.unitframe.units.arena.debuffs.anchorPoint = 'LEFT'
P.unitframe.units.arena.debuffs.maxDuration = 300
P.unitframe.units.arena.debuffs.numrows = 1
P.unitframe.units.arena.debuffs.perrow = 3
P.unitframe.units.arena.debuffs.priority = 'Blacklist,blockNoDuration,Personal,CCDebuffs,Whitelist'
P.unitframe.units.arena.debuffs.sizeOverride = 27
P.unitframe.units.arena.debuffs.yOffset = -16
P.unitframe.units.arena.healPrediction.enable = true
P.unitframe.units.arena.health.text_format = '[healthcolor][health:current]'
P.unitframe.units.arena.infoPanel.height = 17
P.unitframe.units.arena.name.text_format = '[namecolor][name:medium]'
P.unitframe.units.arena.power.text_format = '[powercolor][power:current]'
P.unitframe.units.arena.health.position = 'LEFT'
P.unitframe.units.arena.health.xOffset = 2
P.unitframe.units.arena.power.position = 'RIGHT'
P.unitframe.units.arena.power.xOffset = -2

P.unitframe.units.party.health.position = 'LEFT'
P.unitframe.units.party.health.xOffset = 2
P.unitframe.units.party.buffs.anchorPoint = 'LEFT'
P.unitframe.units.party.buffs.maxDuration = 300
P.unitframe.units.party.buffs.priority = 'Blacklist,TurtleBuffs'
P.unitframe.units.party.castbar.enable = false
P.unitframe.units.party.castbar.width = 256
P.unitframe.units.party.debuffs.enable = true
P.unitframe.units.party.debuffs.anchorPoint = 'RIGHT'
P.unitframe.units.party.debuffs.maxDuration = 300
P.unitframe.units.party.debuffs.priority = 'Blacklist,Boss,RaidDebuffs,CCDebuffs,Dispellable,Whitelist'
P.unitframe.units.party.debuffs.sizeOverride = 52
P.unitframe.units.party.health.position = 'LEFT'
P.unitframe.units.party.health.xOffset = 2
P.unitframe.units.party.health.text_format = '[healthcolor][health:current-percent]'
P.unitframe.units.party.infoPanel.height = 15
P.unitframe.units.party.name.text_format = '[namecolor][name:medium] [difficultycolor][smartlevel]'
P.unitframe.units.party.petsGroup.name.text_format = '[namecolor][name:short]'
P.unitframe.units.party.power.height = 7
P.unitframe.units.party.power.position = 'RIGHT'
P.unitframe.units.party.power.text_format = '[powercolor][power:current]'
P.unitframe.units.party.power.xOffset = -2
P.unitframe.units.party.targetsGroup.name.text_format = '[namecolor][name:medium] [difficultycolor][smartlevel]'
P.unitframe.units.party.targetsGroup.enable = false

P.unitframe.units.raid = CopyTable(P.unitframe.units.party)
P.unitframe.units.raid.buffs.numrows = 1
P.unitframe.units.raid.buffs.perrow = 3
P.unitframe.units.raid.castbar = nil
P.unitframe.units.raid.debuffs.enable = false
P.unitframe.units.raid.debuffs.numrows = 1
P.unitframe.units.raid.debuffs.perrow = 3
P.unitframe.units.raid.debuffs.sizeOverride = 0
P.unitframe.units.raid.growthDirection = 'RIGHT_DOWN'
P.unitframe.units.raid.health.position = 'BOTTOM'
P.unitframe.units.raid.health.text_format = '[healthcolor][health:deficit]'
P.unitframe.units.raid.health.yOffset = 2
P.unitframe.units.raid.height = 44
P.unitframe.units.raid.horizontalSpacing = 3
P.unitframe.units.raid.infoPanel.height = 12
P.unitframe.units.raid.name.text_format = '[namecolor][name:short]'
P.unitframe.units.raid.numGroups = 5
P.unitframe.units.raid.orientation = 'MIDDLE'
P.unitframe.units.raid.petsGroup = nil
P.unitframe.units.raid.power.position = 'BOTTOMRIGHT'
P.unitframe.units.raid.power.text_format = ''
P.unitframe.units.raid.power.xOffset = -2
P.unitframe.units.raid.power.yOffset = 2
P.unitframe.units.raid.targetsGroup = nil
P.unitframe.units.raid.visibility = '[@raid6,noexists][@raid26,exists] hide;show'
P.unitframe.units.raid.width = 80

P.unitframe.units.raid40 = CopyTable(P.unitframe.units.raid)
P.unitframe.units.raid40.debuffs.anchorPoint = 'RIGHT'
P.unitframe.units.raid40.height = 27
P.unitframe.units.raid40.numGroups = 8
P.unitframe.units.raid40.visibility = '[@raid26,noexists] hide;show'
P.unitframe.units.raid40.rdebuffs.enable = false
P.unitframe.units.raid40.power.enable = false
P.unitframe.units.raid40.roleIcon.enable = false

P.unitframe.units.raidpet = CopyTable(P.unitframe.units.raid)
P.unitframe.units.raidpet.enable = false
P.unitframe.units.raidpet.buffs.numrows = 1
P.unitframe.units.raidpet.buffs.perrow = 3
P.unitframe.units.raidpet.buffs.priority = 'Blacklist,Personal,Boss,PlayerBuffs,blockNoDuration,nonPersonal'
P.unitframe.units.raidpet.debuffs.numrows = 1
P.unitframe.units.raidpet.debuffs.perrow = 3
P.unitframe.units.raidpet.debuffs.priority = 'Blacklist,Personal,Boss,Whitelist,RaidDebuffs,blockNoDuration,nonPersonal'
P.unitframe.units.raidpet.growthDirection = 'DOWN_RIGHT'
P.unitframe.units.raidpet.height = 30
P.unitframe.units.raidpet.numGroups = 2
P.unitframe.units.raidpet.visibility = '[group:raid] show; hide'

P.unitframe.units.tank.buffs.numrows = 1
P.unitframe.units.tank.buffs.perrow = 6
P.unitframe.units.tank.buffs.yOffset = 2
P.unitframe.units.tank.debuffs.anchorPoint = 'TOPRIGHT'
P.unitframe.units.tank.debuffs.numrows = 1
P.unitframe.units.tank.debuffs.perrow = 6
P.unitframe.units.tank.debuffs.yOffset = 1
P.unitframe.units.tank.name.position = 'CENTER'
P.unitframe.units.tank.name.text_format = '[namecolor][name:medium]'
P.unitframe.units.tank.name.xOffset = 0
P.unitframe.units.tank.targetsGroup.name.position = 'CENTER'
P.unitframe.units.tank.targetsGroup.name.text_format = '[namecolor][name:medium]'
P.unitframe.units.tank.targetsGroup.name.xOffset = 0
P.unitframe.units.tank.targetsGroup.enable = true

P.unitframe.units.assist = CopyTable(P.unitframe.units.tank)

--Cooldown
P.cooldown = {
	threshold = 3,
	hideBlizzard = false,
	useIndicatorColor = false,
	drawSwipe = true,
	expiringColor = { r = 1, g = 0, b = 0 },
	secondsColor = { r = 1, g = 1, b = 0 },
	minutesColor = { r = 1, g = 1, b = 1 },
	hoursColor = { r = 0.4, g = 1, b = 1 },
	daysColor = { r = 0.4, g = 0.4, b = 1 },
	expireIndicator = { r = 1, g = 1, b = 1 },
	secondsIndicator = { r = 1, g = 1, b = 1 },
	minutesIndicator = { r = 1, g = 1, b = 1 },
	hoursIndicator = { r = 1, g = 1, b = 1 },
	daysIndicator = { r = 1, g = 1, b = 1 },
	hhmmColorIndicator = { r = 1, g = 1, b = 1 },
	mmssColorIndicator = { r = 1, g = 1, b = 1 },

	checkSeconds = false,
	hhmmColor = { r = 0.43, g = 0.43, b = 0.43 },
	mmssColor = { r = 0.56, g = 0.56, b = 0.56 },
	hhmmThreshold = -1,
	mmssThreshold = -1,

	fonts = {
		enable = false,
		font = 'PT Sans Narrow',
		fontOutline = 'OUTLINE',
		fontSize = 18,
	},
}

--Actionbar
P.actionbar = {
	font = 'Homespun',
	fontSize = 10,
	fontOutline = 'MONOCHROMEOUTLINE',
	fontColor = { r = 1, g = 1, b = 1 },

	macrotext = false,
	hotkeytext = true,

	hotkeyTextPosition = 'TOPRIGHT',
	hotkeyTextXOffset = 0,
	hotkeyTextYOffset = -3,

	countTextPosition = 'BOTTOMRIGHT',
	countTextXOffset = 0,
	countTextYOffset = 2,

	equippedItem = false,
	equippedItemColor = { r = 0.4, g = 1.0, b = 0.4 },

	useRangeColorText = false,
	noRangeColor = { r = 0.8, g = 0.1, b = 0.1 },
	noPowerColor = { r = 0.5, g = 0.5, b = 1 },
	usableColor = { r = 1, g = 1, b = 1 },
	notUsableColor = { r = 0.4, g = 0.4, b = 0.4 },

	flashAnimation = false,

	keyDown = true,
	movementModifier = 'SHIFT',
	transparent = false,

	microbar = {
		enabled = false,
		mouseover = false,
		buttonsPerRow = 11,
		buttonSize = 20,
		buttonSpacing = 2,
		alpha = 1,
		visibility = 'show',
	},

	globalFadeAlpha = 0,
	lockActionBars = true,
	hideCooldownBling = false,
	useDrawSwipeOnCharges = false,
	addNewSpells = false,
	rightClickSelfCast = false,
	desaturateOnCooldown = false,
	chargeCooldown = false,

	barPet = {
		enabled = true,
		mouseover = false,
		clickThrough = false,
		buttons = _G.NUM_PET_ACTION_SLOTS,
		buttonsPerRow = 1,
		point = 'TOPRIGHT',
		backdrop = true,
		heightMult = 1,
		widthMult = 1,
		buttonsize = 32,
		buttonspacing = 2,
		backdropSpacing = 2,
		alpha = 1,
		inheritGlobalFade = false,
		visibility = '[petbattle] hide;[pet,novehicleui,nooverridebar,nopossessbar] show;hide',
	},
	stanceBar = {
		enabled = true,
		style = 'darkenInactive',
		mouseover = false,
		clickThrough = false,
		buttonsPerRow = _G.NUM_STANCE_SLOTS,
		buttons = _G.NUM_STANCE_SLOTS,
		point = 'TOPLEFT',
		backdrop = false,
		heightMult = 1,
		widthMult = 1,
		buttonsize = 32,
		buttonspacing = 2,
		backdropSpacing = 2,
		alpha = 1,
		inheritGlobalFade = false,
		usePositionOverride = true,
		visibility = '[vehicleui] hide; [petbattle] hide;show',
	},
	extraActionButton = {
		alpha = 1,
		scale = 1,
		inheritGlobalFade = false,
	},
	vehicleExitButton = {
		enable = true,
		size = 32,
		level = 1,
		strata = 'MEDIUM'
	}
};

for i = 1, 10 do
	P.actionbar['bar'..i] = {
		enabled = false,
		mouseover = false,
		clickThrough = false,
		buttons = 12,
		buttonsPerRow = 12,
		point = 'BOTTOMLEFT',
		backdrop = false,
		heightMult = 1,
		widthMult = 1,
		buttonsize = 32,
		buttonspacing = 2,
		backdropSpacing = 2,
		alpha = 1,
		inheritGlobalFade = false,
		showGrid = true,
		flyoutDirection = 'AUTOMATIC',
		paging = {},
		visibility = '[vehicleui] hide; [overridebar] hide; [petbattle] hide; show',
	}
end

P.actionbar.bar1.enabled = true
P.actionbar.bar1.visibility = '[petbattle] hide; show'
P.actionbar.bar1.paging = {
	DRUID = '[bonusbar:1,nostealth] 7; [bonusbar:1,stealth] 8; [bonusbar:2] 8; [bonusbar:3] 9; [bonusbar:4] 10;',
	PRIEST = '[bonusbar:1] 7;',
	ROGUE = '[stance:1] 7;  [stance:2] 7; [stance:3] 7;', -- set to '[stance:1] 7; [stance:3] 10;' if you want a shadow dance bar
	MONK = '[bonusbar:1] 7; [bonusbar:2] 8; [bonusbar:3] 9;',
	WARRIOR = '[bonusbar:1] 7; [bonusbar:2] 8;'
}

P.actionbar.bar3.enabled = true
P.actionbar.bar3.buttons = 6
P.actionbar.bar3.buttonsPerRow = 6

P.actionbar.bar4.enabled = true
P.actionbar.bar4.buttonsPerRow = 1
P.actionbar.bar4.point = 'TOPRIGHT'
P.actionbar.bar4.backdrop = true

P.actionbar.bar5.enabled = true
P.actionbar.bar5.buttons = 6
P.actionbar.bar5.buttonsPerRow = 6

do -- cooldown stuff
	P.actionbar.cooldown = CopyTable(P.cooldown)
	P.actionbar.cooldown.expiringColor = { r = 1, g = 0, b = 0 }
	P.actionbar.cooldown.secondsColor = { r = 1, g = 1, b = 1 }
	P.actionbar.cooldown.hoursColor = { r = 1, g = 1, b = 1 }
	P.actionbar.cooldown.daysColor = { r = 1, g = 1, b = 1 }

	P.auras.cooldown = CopyTable(P.actionbar.cooldown)
	P.bags.cooldown = CopyTable(P.actionbar.cooldown)
	P.nameplates.cooldown = CopyTable(P.actionbar.cooldown)
	P.unitframe.cooldown = CopyTable(P.actionbar.cooldown)

	-- color override
	P.auras.cooldown.override = false
	P.bags.cooldown.override = false
	P.actionbar.cooldown.override = true
	P.nameplates.cooldown.override = true
	P.unitframe.cooldown.override = true

	-- auras doesn't have a reverse option
	P.actionbar.cooldown.reverse = false
	P.nameplates.cooldown.reverse = false
	P.unitframe.cooldown.reverse = false
	P.bags.cooldown.reverse = false

	-- auras don't have override font settings
	P.auras.cooldown.fonts = nil

	-- we gonna need this on by default :3
	P.cooldown.enable = true
end
