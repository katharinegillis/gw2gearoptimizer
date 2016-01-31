# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Loads in the models.

modelsConfig = (app) ->
	models = {}

	models.Slot              = require('../models/slot')(app, models)
	models.HeadgearSlot      = require('../models/headgear_slot')(app, models)
	models.ShoulderSlot      = require('../models/shoulder_slot')(app, models)
	models.ChestSlot         = require('../models/chest_slot')(app, models)
	models.GlovesSlot        = require('../models/gloves_slot')(app, models)
	models.LeggingsSlot      = require('../models/leggings_slot')(app, models)
	models.BootsSlot         = require('../models/boots_slot')(app, models)
	models.OneHandWeaponSlot = require('../models/one_hand_weapon_slot')(app, models)
	models.TwoHandWeaponSlot = require('../models/two_hand_weapon_slot')(app, models)
	models.AmuletSlot        = require('../models/amulet_slot')(app, models)
	models.RingSlot          = require('../models/ring_slot')(app, models)
	models.AccessorySlot     = require('../models/accessory_slot')(app, models)
	models.BackSlot          = require('../models/back_slot')(app, models)
	models.GearSet           = require('../models/gear_set')(app, models)
	models.Population        = require('../models/population')(app, models)
	models.GA                = require('../models/ga')(app, models)

	app.set 'models', models

module.exports = modelsConfig