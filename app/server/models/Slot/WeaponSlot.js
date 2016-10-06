/*
 * @file   server/models/Slot/WeaponSlot.js
 * @date   2016-10-06
 * @author gillis.katharine@gmail.com
 */

'use strict';

import Slot from '../Slot';

export default class WeaponSlot extends Slot {
	constructor(gear_type) {
		super(gear_type);

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
			'captain'
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
			'captain'
		];
	}
};