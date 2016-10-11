/*
 * @file   test/models/Slot/TrinketSlot/AmuletSlotTest.js
 * @date   2016-10-07
 * @author gillis.katharine@gmail.com
 */

'use strict';

import { expect } from 'chai';

import AmuletSlot from '../../../../server/models/Slot/TrinketSlot/AmuletSlot';
import Slot from '../../../../server/models/Slot';

describe('AmuletSlot', function() {
	describe('property', function() {
		describe('.stats', function() {
			it('returns major: 157 and minor: 108 for a major minor minor stat combo ascended', function() {
				// Berserker is a major minor minor stat combo, with power precision ferocity.
				let subject = new AmuletSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('berserker'));

				expect(subject.stats).to.deep.equal({
					power: 157,
					precision: 108,
					ferocity: 108
				});
			});

			it('returns major: 133 and minor: 71 for a major major minor minor stat combo ascended', function() {
				// Marauder is a major major minor minor stat combo, with power precision vitality ferocity.
				let subject = new AmuletSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('marauder'));

				expect(subject.stats).to.deep.equal({
					power: 133,
					precision: 133,
					vitality: 71,
					ferocity: 71
				});
			});

			it('returns major: 72 for a major x7 stat combo ascended', function() {
				// Celestial is a major x7 stat combo, with power precision toughness vitality condition damage ferocity
				// healing power.
				let subject = new AmuletSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('celestial'));

				expect(subject.stats).to.deep.equal({
					power: 72,
					precision: 72,
					toughness: 72,
					vitality: 72,
					condition_damage: 72,
					ferocity: 72,
					healing_power: 72
				});
			});

			it('returns major: 120 and minor: 85 for a major minor minor stat combo exotic', function() {
				// Berserker is a major minor minor stat combo, with power precision ferocity.
				let subject = new AmuletSlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('berserker'));

				expect(subject.stats).to.deep.equal({
					power: 120,
					precision: 85,
					ferocity: 85
				});
			});

			it('returns major: 102 and minor: 56 for a major major minor minor stat combo exotic', function() {
				// Marauder is a major major minor minor stat combo, with power precision vitality ferocity.
				let subject = new AmuletSlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('marauder'));

				expect(subject.stats).to.deep.equal({
					power: 102,
					precision: 102,
					vitality: 56,
					ferocity: 56
				});
			});

			it('returns major: 56 for a major x7 stat combo exotic', function() {
				// Celestial is a major x7 stat combo, with power precision toughness vitality condition damage ferocity
				// healing power.
				let subject = new AmuletSlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('celestial'));

				expect(subject.stats).to.deep.equal({
					power: 56,
					precision: 56,
					toughness: 56,
					vitality: 56,
					condition_damage: 56,
					ferocity: 56,
					healing_power: 56
				});
			});
		});
	});
});