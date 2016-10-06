/*
 * @file   test/models/Slot/ArmourSlot/BootsSlotTest.js
 * @date   2016-10-06
 * @author gillis.katharine@gmail.com
 */

'use strict';

import { expect } from 'chai';

import BootsSlot from '../../../../server/models/Slot/ArmourSlot/BootsSlot';
import Slot from '../../../../server/models/Slot';

describe('BootsSlot', function() {
	describe('property', function() {
		describe('.stats', function() {
			it('returns major: 47 and minor: 34 for a major minor minor stat combo ascended', function() {
				// Berserker is a major minor minor stat combo, with power precision ferocity.
				let subject = new BootsSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('berserker'));

				expect(subject.stats).to.deep.equal({
					power: 47,
					precision: 34,
					ferocity: 34
				});
			});

			it('returns major: 40 and minor: 22 for a major major minor minor stat combo ascended', function() {
				// Marauder is a major major minor minor stat combo, with power precision vitality ferocity.
				let subject = new BootsSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('marauder'));

				expect(subject.stats).to.deep.equal({
					power: 40,
					precision: 40,
					vitality: 22,
					ferocity: 22
				});
			});

			it('returns major: 22 for a major x7 stat combo ascended', function() {
				// Celestial is a major x7 stat combo, with power precision toughness vitality condition damage ferocity
				// healing power.
				let subject = new BootsSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('celestial'));

				expect(subject.stats).to.deep.equal({
					power: 22,
					precision: 22,
					toughness: 22,
					vitality: 22,
					condition_damage: 22,
					ferocity: 22,
					healing_power: 22
				});
			});

			it('returns major: 45 and minor: 32 for a major minor minor stat combo exotic', function() {
				// Berserker is a major minor minor stat combo, with power precision ferocity.
				let subject = new BootsSlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('berserker'));

				expect(subject.stats).to.deep.equal({
					power: 45,
					precision: 32,
					ferocity: 32
				});
			});

			it('returns major: 38 and minor: 21 for a major major minor minor stat combo exotic', function() {
				// Marauder is a major major minor minor stat combo, with power precision vitality ferocity.
				let subject = new BootsSlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('marauder'));

				expect(subject.stats).to.deep.equal({
					power: 38,
					precision: 38,
					vitality: 21,
					ferocity: 21
				});
			});

			it('returns major: 21 for a major x7 stat combo exotic', function() {
				// Celestial is a major x7 stat combo, with power precision toughness vitality condition damage ferocity
				// healing power.
				let subject = new BootsSlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('celestial'));

				expect(subject.stats).to.deep.equal({
					power: 21,
					precision: 21,
					toughness: 21,
					vitality: 21,
					condition_damage: 21,
					ferocity: 21,
					healing_power: 21
				});
			});
		});
	});
});