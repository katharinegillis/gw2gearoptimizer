/*
 * @file   test/models/Slot/WeaponSlot/OneHandedWeaponSlotTest.js
 * @date   2016-10-06
 * @author gillis.katharine@gmail.com
 */

'use strict';

import { expect } from 'chai';

import OneHandedWeaponSlot from '../../../../server/models/Slot/WeaponSlot/OneHandedWeaponSlot';
import Slot from '../../../../server/models/Slot';

describe('OneHandedWeaponSlot', function() {
	describe('property', function() {
		describe('.stats', function() {
			it('returns major: 125 and minor: 90 for a major minor minor stat combo ascended', function() {
				// Berserker is a major minor minor stat combo, with power precision ferocity.
				let subject = new OneHandedWeaponSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('berserker'));

				expect(subject.stats).to.deep.equal({
					power: 125,
					precision: 90,
					ferocity: 90
				});
			});

			it('returns major: 108 and minor: 59 for a major major minor minor stat combo ascended', function() {
				// Marauder is a major major minor minor stat combo, with power precision vitality ferocity.
				let subject = new OneHandedWeaponSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('marauder'));

				expect(subject.stats).to.deep.equal({
					power: 108,
					precision: 108,
					vitality: 59,
					ferocity: 59
				});
			});

			it('returns major: 59 for a major x7 stat combo ascended', function() {
				// Celestial is a major x7 stat combo, with power precision toughness vitality condition damage ferocity
				// healing power.
				let subject = new OneHandedWeaponSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('celestial'));

				expect(subject.stats).to.deep.equal({
					power: 59,
					precision: 59,
					toughness: 59,
					vitality: 59,
					condition_damage: 59,
					ferocity: 59,
					healing_power: 59
				});
			});

			it('returns major: 120 and minor: 85 for a major minor minor stat combo exotic', function() {
				// Berserker is a major minor minor stat combo, with power precision ferocity.
				let subject = new OneHandedWeaponSlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('berserker'));

				expect(subject.stats).to.deep.equal({
					power: 120,
					precision: 85,
					ferocity: 85
				});
			});

			it('returns major: 102 and minor: 56 for a major major minor minor stat combo exotic', function() {
				// Marauder is a major major minor minor stat combo, with power precision vitality ferocity.
				let subject = new OneHandedWeaponSlot(Slot.EXOTIC);
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
				let subject = new OneHandedWeaponSlot(Slot.EXOTIC);
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