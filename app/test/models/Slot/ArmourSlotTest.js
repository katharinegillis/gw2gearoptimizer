/*
 * @file   test/models/Slot/ArmourSlotTest.js
 * @date   2016-10-06
 * @author gillis.katharine@gmail.com
 */

'use strict';

import { expect } from 'chai';

import ArmourSlot from '../../../server/models/Slot/ArmourSlot';
import Slot from '../../../server/models/Slot';

describe('ArmourSlot', function() {
	let armour_ascended_stat_combos = [
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

	let armour_exotic_stat_combos = [
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

	describe('constructor()', function() {
		it('sets available stat combos to ascended armour stat combos', function() {
			let subject = new ArmourSlot(Slot.ASCENDED);

			expect(subject.availableStatCombos).to.deep.equal(armour_ascended_stat_combos);
		});

		it('sets slot stat combos to ascended armour stat combos', function() {
			let subject = new ArmourSlot(Slot.ASCENDED);

			expect(subject.slotStatCombos).to.deep.equal(armour_ascended_stat_combos);
		});

		it('sets available stat combos to exotic armour stat combos', function() {
			let subject = new ArmourSlot(Slot.EXOTIC);

			expect(subject.availableStatCombos).to.deep.equal(armour_exotic_stat_combos);
		});

		it('sets slot stat combos to exotic armour stat combos', function() {
			let subject = new ArmourSlot(Slot.EXOTIC);

			expect(subject.slotStatCombos).to.deep.equal(armour_exotic_stat_combos);
		});
	});
});