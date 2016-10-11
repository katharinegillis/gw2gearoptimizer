/*
 * @file   test/models/Slot/WeaponSlotTest.js
 * @date   2016-10-06
 * @author gillis.katharine@gmail.com
 */

'use strict';

import { expect } from 'chai';

import WeaponSlot from '../../../server/models/Slot/WeaponSlot';
import Slot from '../../../server/models/Slot';

describe('WeaponSlot', function() {
	let weapon_ascended_stat_combos = [
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

	let weapon_exotic_stat_combos = [
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
		'givers_weapon'
	];

	describe('constructor()', function() {
		it('sets available stat combos to weapon stat combos for ascended gear type', function() {
			let subject = new WeaponSlot(Slot.ASCENDED);

			expect(subject.availableStatCombos).to.deep.equal(weapon_ascended_stat_combos);
		});

		it('sets slot stat combos to weapon stat combos for ascended gear type', function() {
			let subject = new WeaponSlot(Slot.ASCENDED);

			expect(subject.slotStatCombos).to.deep.equal(weapon_ascended_stat_combos);
		});

		it('sets available stat combos to weapon stat combos for exotic gear type', function() {
			let subject = new WeaponSlot(Slot.EXOTIC);

			expect(subject.availableStatCombos).to.deep.equal(weapon_exotic_stat_combos);
		});

		it('sets slot stat combos to weapon stat combos for exotic gear type', function() {
			let subject = new WeaponSlot(Slot.EXOTIC);

			expect(subject.slotStatCombos).to.deep.equal(weapon_exotic_stat_combos);
		});
	});
});