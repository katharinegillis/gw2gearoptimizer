/*
 * @file   test/models/Slot/TrinketSlot/BackSlotTest.js
 * @date   2016-10-07
 * @author gillis.katharine@gmail.com
 */

'use strict';

import { expect } from 'chai';

import BackSlot from '../../../../server/models/Slot/TrinketSlot/BackSlot';
import Slot from '../../../../server/models/Slot';

describe('BackSlot', function() {
	describe('property', function() {
		describe('.stats', function() {
			it('returns major: 63 and minor: 40 for a major minor minor stat combo ascended', function() {
				// Berserker is a major minor minor stat combo, with power precision ferocity.
				let subject = new BackSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('berserker'));

				expect(subject.stats).to.deep.equal({
					power: 63,
					precision: 40,
					ferocity: 40
				});
			});

			it('returns major: 52 and minor: 27 for a major major minor minor stat combo ascended', function() {
				// Marauder is a major major minor minor stat combo, with power precision vitality ferocity.
				let subject = new BackSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('marauder'));

				expect(subject.stats).to.deep.equal({
					power: 52,
					precision: 52,
					vitality: 27,
					ferocity: 27
				});
			});

			it('returns major: 28 for a major x7 stat combo ascended', function() {
				// Celestial is a major x7 stat combo, with power precision toughness vitality condition damage ferocity
				// healing power.
				let subject = new BackSlot(Slot.ASCENDED);
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

			it('returns major: 30 and minor: 21 for a major minor minor stat combo exotic', function() {
				// Berserker is a major minor minor stat combo, with power precision ferocity.
				let subject = new BackSlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('berserker'));

				expect(subject.stats).to.deep.equal({
					power: 30,
					precision: 21,
					ferocity: 21
				});
			});

			it('returns major: 14 for a major x7 stat combo exotic', function() {
				// Celestial is a major x7 stat combo, with power precision toughness vitality condition damage ferocity
				// healing power.
				let subject = new BackSlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('celestial'));

				expect(subject.stats).to.deep.equal({
					power: 14,
					precision: 14,
					toughness: 14,
					vitality: 14,
					condition_damage: 14,
					ferocity: 14,
					healing_power: 14
				});
			});
		});
	});
});