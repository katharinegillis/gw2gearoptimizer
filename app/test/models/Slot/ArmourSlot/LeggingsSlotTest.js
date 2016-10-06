/*
 * @file   test/models/Slot/ArmourSlot/LeggingsSlotTest.js
 * @date   2016-10-06
 * @author gillis.katharine@gmail.com
 */

'use strict';

import { expect } from 'chai';

import LeggingsSlot from '../../../../server/models/Slot/ArmourSlot/LeggingsSlot';
import Slot from '../../../../server/models/Slot';

describe('LeggingsSlot', function() {
	describe('property', function() {
		describe('.stats', function() {
			it('returns major: 94 and minor: 67 for a major minor minor stat combo ascended', function() {
				// Berserker is a major minor minor stat combo, with power precision ferocity.
				let subject = new LeggingsSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('berserker'));

				expect(subject.stats).to.deep.equal({
					power: 94,
					precision: 67,
					ferocity: 67
				});
			});

			it('returns major: 81 and minor: 44 for a major major minor minor stat combo ascended', function() {
				// Marauder is a major major minor minor stat combo, with power precision vitality ferocity.
				let subject = new LeggingsSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('marauder'));

				expect(subject.stats).to.deep.equal({
					power: 81,
					precision: 81,
					vitality: 44,
					ferocity: 44
				});
			});

			it('returns major: 44 for a major x7 stat combo ascended', function() {
				// Celestial is a major x7 stat combo, with power precision toughness vitality condition damage ferocity
				// healing power.
				let subject = new LeggingsSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('celestial'));

				expect(subject.stats).to.deep.equal({
					power: 44,
					precision: 44,
					toughness: 44,
					vitality: 44,
					condition_damage: 44,
					ferocity: 44,
					healing_power: 44
				});
			});

			it('returns major: 90 and minor: 64 for a major minor minor stat combo exotic', function() {
				// Berserker is a major minor minor stat combo, with power precision ferocity.
				let subject = new LeggingsSlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('berserker'));

				expect(subject.stats).to.deep.equal({
					power: 90,
					precision: 64,
					ferocity: 64
				});
			});

			it('returns major: 77 and minor: 42 for a major major minor minor stat combo exotic', function() {
				// Marauder is a major major minor minor stat combo, with power precision vitality ferocity.
				let subject = new LeggingsSlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('marauder'));

				expect(subject.stats).to.deep.equal({
					power: 77,
					precision: 77,
					vitality: 42,
					ferocity: 42
				});
			});

			it('returns major: 42 for a major x7 stat combo exotic', function() {
				// Celestial is a major x7 stat combo, with power precision toughness vitality condition damage ferocity
				// healing power.
				let subject = new LeggingsSlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('celestial'));

				expect(subject.stats).to.deep.equal({
					power: 42,
					precision: 42,
					toughness: 42,
					vitality: 42,
					condition_damage: 42,
					ferocity: 42,
					healing_power: 42
				});
			});
		});
	});
});