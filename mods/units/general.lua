local unitName  =  "general"

--Attribute Defintions
local HP = 200
local ATKDMG = 30
local ATKSPD = 1
local ATKRNG = 20
local MOVESPD = {2,0.15} -- {walkspeed, acceleration}

local unitDef  =  {
--Internal settings
    BuildPic = "general.png",
    Category = "TANK SMALL NOTAIR NOTSUB",
    ObjectName = "general.s3o",
	corpse = "dead",
    name = "General",
    script = "generalscript.lua",

    customParams = {
        real_speed = 90,
        class = "infantry",
        level = 3,
        supply_cost = 3,
        morph_into = "heroinfantry",
        max_xp = 1000,
    },

    sounds = {
      select = {
            "come_on_2",
            "come_on_3",
        },
      ok = {
            "yes_1",
        },
    },
    
--Unit limitations and properties
    BuildTime = 5,
    Description = "Sword-wielding brute",
    MaxDamage = HP,
    idleAutoHeal = 0,
	mass = 500,
    RadarDistance = 0,
    SightDistance = 400,	--This may be too high
    SoundCategory = "TANK",
    Upright = 0,
    
--Energy and metal related
    BuildCostEnergy = 0,
    BuildCostMetal = 5,
    
--Pathfinding and related
    Acceleration = MOVESPD[2],
    BrakeRate = 0.1,
    FootprintX = 1,	--Affects Bounding Box (the green colored one)
    FootprintZ = 1,	--Affects Bounding Box (the green colored one)
    MaxSlope = 15,
    MaxVelocity = 3,
    MaxWaterDepth = 20,
    MovementClass = "Default2x2",
    TurnRate = 900,
    
--Abilities
    Builder = 0,
    canAttack = true,
	canFight = true,
    CanGuard = 1,
    CanMove = 1,
    CanPatrol = 1,
    CanStop = 1,
    LeaveTracks = 0,
    Reclaimable = 0,
    
--Hitbox
	collisionVolumeOffsets = "0 0 0",
	collisionVolumeScales = "10 25 10",
	collisionVolumeType = "Box",
	collisionVolumeTest = 1,
    
--Weapons and related

	weapons = {
		[1] = {
			def = "SWORD",
			mainDir = "0 0 1",
			maxAngleDif = 180,
		},
	},
	
	weaponDefs = {
	SWORD = {
        soundStart = "swordhit2.wav",
		avoidFriendly = 1,
		collideFriendly = false,
		name = "Sword",
		cylinderTargetting = 1,
		energypershot = 0,
		endsmoke = "0",
		impactonly = true,
		noSelfDamage = true,
		range = ATKRNG,
		reloadtime = ATKSPD,
		size = 0,
		targetBorder = 1,
		tolerance = 5000,
		turret = true,
		weaponTimer = 0.1,
		weaponType = "Cannon",
		weaponVelocity = 100,
		damage = {
			default  = ATKDMG,
			infantry = ATKDMG,
			ranged   = ATKDMG,
			cavalry  = 1.5*ATKDMG,
			hero     = 1.25*ATKDMG,
			clergy   = ATKDMG,
			god 	 = ATKDMG,
		},
		
	},
	
	},
	
    BadTargetCategory = "NOTAIR",
    ExplodeAs = "TANKDEATH",
    NoChaseCategory = "AIR",

}

--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = false,
	customParams          = {
		resurrectintounit	= "General",
		featuredecaytime	= 10		
	},  	
    damage             = 300,
    description        = "Dead General",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "5",
    hitdensity         = "100",
    metal              = 0,
    object             = "Tombstone.s3o",
    reclaimable        = false,
	resurrectable  	   = 1,
	smoketime 		   = 0,	
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName]  =  unitDef })



