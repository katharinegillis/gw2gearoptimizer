/*
 * @file   test/models/Slot/ArmourSlot/ChestSlotTest.js
 * @date   2016-10-06
 * @author gillis.katharine@gmail.com
 */

'use strict';

import { expect } from 'chai';

import ChestSlot from '../../../../server/models/Slot/ArmourSlot/ChestSlot';
import Slot from '../../../../server/models/Slot';

describe('ChestSlot', function() {
	describe('property', function() {
		describe('.stats', function() {
			it('returns major: 141 and minor: 101 for a major minor minor stat combo ascended', function() {
				// Berserker is a major minor minor stat combo, with power precision ferocity.
				let subject = new ChestSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('berserker'));

				expect(subject.stats).to.deep.equal({
					power: 141,
					precision: 101,
					ferocity: 101
				});
			});

			it('returns major: 121 and minor: 67 for a major major minor minor stat combo ascended', function() {
				// Marauder is a major major minor minor stat combo, with power precision vitality ferocity.
				let subject = new ChestSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('marauder'));

				expect(subject.stats).to.deep.equal({
					power: 121,
					precision: 121,
					vitality: 67,
					ferocity: 67
				});
			});

			it('returns major: 67 for a major x7 stat combo ascended', function() {
				// Celestial is a major x7 stat combo, with power precision toughness vitality condition damage ferocity
				// healing power.
				let subject = new ChestSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('celestial'));

				expect(subject.stats).to.deep.equal({
					power: 67,
					precision: 67,
					toughness: 67,
					vitality: 67,
					condition_damage: 67,
					ferocity: 67,
					healing_power: 67
				});
			});

			it('returns major: 134 and minor: 96 for a major minor minor stat combo exotic', function() {
				// Berserker is a major minor minor stat combo, with power precision ferocity.
				let subject = new ChestSlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('berserker'));

				expect(subject.stats).to.deep.equal({
					power: 134,
					precision: 96,
					ferocity: 96
				});
			});

			it('returns major: 115 and minor: 63 for a major major minor minor stat combo exotic', function() {
				// Marauder is a major major minor minor stat combo, with power precision vitality ferocity.
				let subject = new ChestSlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('marauder'));

				expect(subject.stats).to.deep.equal({
					power: 115,
					precision: 115,
					vitality: 63,
					ferocity: 63
				});
			});

			it('returns major: 63 for a major x7 stat combo exotic', function() {
				// Celestial is a major x7 stat combo, with power precision toughness vitality condition damage ferocity
				// healing power.
				let subject = new ChestSlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('celestial'));

				expect(subject.stats).to.deep.equal({
					power: 63,
					precision: 63,
					toughness: 63,
					vitality: 63,
					condition_damage: 63,
					ferocity: 63,
					healing_power: 63
				});
			});
		});
	});
});