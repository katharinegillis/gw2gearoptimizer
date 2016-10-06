/*
 * @file   test/models/Slot/ArmourSlot/HeadgearSlotTest.js
 * @date   2016-10-06
 * @author gillis.katharine@gmail.com
 */

'use strict';

import { expect } from 'chai';

import HeadgearSlot from '../../../../server/models/Slot/ArmourSlot/HeadgearSlot';
import Slot from '../../../../server/models/Slot';

describe('HeadgearSlot', function() {
	describe('property', function() {
		describe('.stats', function() {
			it('returns major: 63 and minor: 45 for a major minor minor stat combo ascended', function() {
				// Berserker is a major minor minor stat combo, with power precision ferocity.
				let subject = new HeadgearSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('berserker'));

				expect(subject.stats).to.deep.equal({
					power: 63,
					precision: 45,
					ferocity: 45
				});
			});

			it('returns major: 54 and minor: 30 for a major major minor minor stat combo ascended', function() {
				// Marauder is a major major minor minor stat combo, with power precision vitality ferocity.
				let subject = new HeadgearSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('marauder'));

				expect(subject.stats).to.deep.equal({
					power: 54,
					precision: 54,
					vitality: 30,
					ferocity: 30
				});
			});

			it('returns major: 30 for a major x7 stat combo ascended', function() {
				// Celestial is a major x7 stat combo, with power precision toughness vitality condition damage ferocity
				// healing power.
				let subject = new HeadgearSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('celestial'));

				expect(subject.stats).to.deep.equal({
					power: 30,
					precision: 30,
					toughness: 30,
					vitality: 30,
					condition_damage: 30,
					ferocity: 30,
					healing_power: 30
				});
			});

			it('returns major: 60 and minor: 43 for a major minor minor stat combo exotic', function() {
				// Berserker is a major minor minor stat combo, with power precision ferocity.
				let subject = new HeadgearSlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('berserker'));

				expect(subject.stats).to.deep.equal({
					power: 60,
					precision: 43,
					ferocity: 43
				});
			});

			it('returns major: 51 and minor: 28 for a major major minor minor stat combo exotic', function() {
				// Marauder is a major major minor minor stat combo, with power precision vitality ferocity.
				let subject = new HeadgearSlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('marauder'));

				expect(subject.stats).to.deep.equal({
					power: 51,
					precision: 51,
					vitality: 28,
					ferocity: 28
				});
			});

			it('returns major: 28 for a major x7 stat combo exotic', function() {
				// Celestial is a major x7 stat combo, with power precision toughness vitality condition damage ferocity
				// healing power.
				let subject = new HeadgearSlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('celestial'));

				expect(subject.stats).to.deep.equal({
					power: 28,
					precision: 28,
					toughness: 28,
					vitality: 28,
					condition_damage: 28,
					ferocity: 28,
					healing_power: 28
				});
			});
		});
	});
});