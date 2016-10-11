/*
 * @file   test/models/Slot/TrinketSlotTest.js
 * @date   2016-10-06
 * @author gillis.katharine@gmail.com
 */

'use strict';

import { expect } from 'chai';

import TrinketSlot from '../../../server/models/Slot/TrinketSlot';
import Slot from '../../../server/models/Slot';

describe('TrinketSlot', function() {
	let trinket_ascended_stat_combos = [
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

	let trinket_exotic_stat_combos = [
		'berserker',
		'zealot',
		'soldier',
		'valkyrie',
		'rampager',
		'assassin',
		'knight',
		'cavalier',
		'nomad',
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
		'captain',
		'givers_armour'
	];

	describe('constructor()', function() {
		it('sets available stat combos to trinket stat combos', function() {
			let subject = new TrinketSlot(Slot.EXOTIC);

			expect(subject.availableStatCombos).to.deep.equal(trinket_stat_combos);
		});

		it('sets slot stat combos to trinket stat combos', function() {
			let subject = new TrinketSlot(Slot.EXOTIC);

			expect(subject.slotStatCombos).to.deep.equal(trinket_stat_combos);
		});
	});
});