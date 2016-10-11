/*
 * @file   server/models/Slot/ArmourSlot.js
 * @date   2016-10-06
 * @author gillis.katharine@gmail.com
 */

'use strict';

import Slot from '../Slot';

export default class ArmourSlot extends Slot {
	constructor(gear_type) {
		super(gear_type);

		if (this.gearType == Slot.ASCENDED) {
			this._availableStatCombos = [
				'berserker',
				'zealot',
				'soldier',
				'valkyrie',
				'rampager',
				'assassin',
				'knight',
				'cavalier',
				'nomad',
				'settler',
				'sentinel',
				'shaman',
				'sinister',
				'carrion',
				'rabid',
				'dire',
				'cleric',
				'magi',
				'apothecary',
				'commander',
				'marauder',
				'vigilant',
				'crusader',
				'wanderer',
				'viper',
				'trailblazer',
				'minstrel',
				'celestial'
			];

			this._slotStatCombos = [
				'berserker',
				'zealot',
				'soldier',
				'valkyrie',
				'rampager',
				'assassin',
				'knight',
				'cavalier',
				'nomad',
				'settler',
				'sentinel',
				'shaman',
				'sinister',
				'carrion',
				'rabid',
				'dire',
				'cleric',
				'magi',
				'apothecary',
				'commander',
				'marauder',
				'vigilant',
				'crusader',
				'wanderer',
				'viper',
				'trailblazer',
				'minstrel',
				'celestial'
			];
		} else {
			this._availableStatCombos = [
				'berserker',
				'zealot',
				'soldier',
				'valkyrie',
				'rampager',
				'assassin',
				'knight',
				'cavalier',
				'nomad',
				'settler',
				'sentinel',
				'shaman',
				'sinister',
				'carrion',
				'rabid',
				'dire',
				'cleric',
				'magi',
				'apothecary',
				'commander',
				'marauder',
				'vigilant',
				'crusader',
				'wanderer',
				'viper',
				'trailblazer',
				'minstrel',
				'celestial',
				'givers_armour'
			];

			this._slotStatCombos = [
				'berserker',
				'zealot',
				'soldier',
				'valkyrie',
				'rampager',
				'assassin',
				'knight',
				'cavalier',
				'nomad',
				'settler',
				'sentinel',
				'shaman',
				'sinister',
				'carrion',
				'rabid',
				'dire',
				'cleric',
				'magi',
				'apothecary',
				'commander',
				'marauder',
				'vigilant',
				'crusader',
				'wanderer',
				'viper',
				'trailblazer',
				'minstrel',
				'celestial',
				'givers_armour'
			];
		}
	}
};