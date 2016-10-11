/*
 * @file   test/models/Slot/TrinketSlot/RingSlotTest.js
 * @date   2016-10-07
 * @author gillis.katharine@gmail.com
 */

'use strict';

import { expect } from 'chai';

import RingSlot from '../../../../server/models/Slot/TrinketSlot/RingSlot';
import Slot from '../../../../server/models/Slot';

describe('RingSlot', function() {
	describe('property', function() {
		describe('.stats', function() {
			it('returns major: 126 and minor: 85 for a major minor minor stat combo ascended', function() {
				// Berserker is a major minor minor stat combo, with power precision ferocity.
				let subject = new RingSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('berserker'));

				expect(subject.stats).to.deep.equal({
					power: 126,
					precision: 85,
					ferocity: 85
				});
			});

			it('returns major: 106 and minor: 56 for a major major minor minor stat combo ascended', function() {
				// Marauder is a major major minor minor stat combo, with power precision vitality ferocity.
				let subject = new RingSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('marauder'));

				expect(subject.stats).to.deep.equal({
					power: 106,
					precision: 106,
					vitality: 56,
					ferocity: 56
				});
			});

			it('returns major: 57 for a major x7 stat combo ascended', function() {
				// Celestial is a major x7 stat combo, with power precision toughness vitality condition damage ferocity
				// healing power.
				let subject = new RingSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('celestial'));

				expect(subject.stats).to.deep.equal({
					power: 57,
					precision: 57,
					toughness: 57,
					vitality: 57,
					condition_damage: 57,
					ferocity: 57,
					healing_power: 57
				});
			});

			it('returns major: 90 and minor: 64 for a major minor minor stat combo exotic', function() {
				// Berserker is a major minor minor stat combo, with power precision ferocity.
				let subject = new RingSlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('berserker'));

				expect(subject.stats).to.deep.equal({
					power: 90,
					precision: 64,
					ferocity: 64
				});
			});

			it('returns major: 77 and minor: 42 for a major major minor minor stat combo exotic', function() {
				// Marauder is a major major minor minor stat combo, with power precision vitality ferocity.
				let subject = new RingSlot(Slot.EXOTIC);
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
				let subject = new RingSlot(Slot.EXOTIC);
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