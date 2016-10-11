/*
 * @file   test/models/Slot/TrinketSlot/AccessorySlotTest.js
 * @date   2016-10-07
 * @author gillis.katharine@gmail.com
 */

'use strict';

import { expect } from 'chai';

import AccessorySlot from '../../../../server/models/Slot/TrinketSlot/AccessorySlot';
import Slot from '../../../../server/models/Slot';

describe('AccessorySlot', function() {
	describe('property', function() {
		describe('.stats', function() {
			it('returns major: 110 and minor: 74 for a major minor minor stat combo ascended', function() {
				// Berserker is a major minor minor stat combo, with power precision ferocity.
				let subject = new AccessorySlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('berserker'));

				expect(subject.stats).to.deep.equal({
					power: 110,
					precision: 74,
					ferocity: 74
				});
			});

			it('returns major: 92 and minor: 49 for a major major minor minor stat combo ascended', function() {
				// Marauder is a major major minor minor stat combo, with power precision vitality ferocity.
				let subject = new AccessorySlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('marauder'));

				expect(subject.stats).to.deep.equal({
					power: 92,
					precision: 92,
					vitality: 49,
					ferocity: 49
				});
			});

			it('returns major: 50 for a major x7 stat combo ascended', function() {
				// Celestial is a major x7 stat combo, with power precision toughness vitality condition damage ferocity
				// healing power.
				let subject = new AccessorySlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('celestial'));

				expect(subject.stats).to.deep.equal({
					power: 50,
					precision: 50,
					toughness: 50,
					vitality: 50,
					condition_damage: 50,
					ferocity: 50,
					healing_power: 50
				});
			});

			it('returns major: 75 and minor: 53 for a major minor minor stat combo exotic', function() {
				// Berserker is a major minor minor stat combo, with power precision ferocity.
				let subject = new AccessorySlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('berserker'));

				expect(subject.stats).to.deep.equal({
					power: 75,
					precision: 53,
					ferocity: 53
				});
			});

			it('returns major: 64 and minor: 35 for a major major minor minor stat combo exotic', function() {
				// Marauder is a major major minor minor stat combo, with power precision vitality ferocity.
				let subject = new AccessorySlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('marauder'));

				expect(subject.stats).to.deep.equal({
					power: 64,
					precision: 64,
					vitality: 35,
					ferocity: 35
				});
			});

			it('returns major: 35 for a major x7 stat combo exotic', function() {
				// Celestial is a major x7 stat combo, with power precision toughness vitality condition damage ferocity
				// healing power.
				let subject = new AccessorySlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('celestial'));

				expect(subject.stats).to.deep.equal({
					power: 35,
					precision: 35,
					toughness: 35,
					vitality: 35,
					condition_damage: 35,
					ferocity: 35,
					healing_power: 35
				});
			});
		});
	});
});