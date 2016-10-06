/*
 * @file   test/models/Slot/WeaponSlot/TwoHandedWeaponSlotTest.js
 * @date   2016-10-06
 * @author gillis.katharine@gmail.com
 */

'use strict';

import { expect } from 'chai';

import TwoHandedWeaponSlot from '../../../../server/models/Slot/WeaponSlot/TwoHandedWeaponSlot';
import Slot from '../../../../server/models/Slot';

describe('TwoHandedWeaponSlot', function() {
	describe('property', function() {
		describe('.stats', function() {
			it('returns major: 251 and minor: 179 for a major minor minor stat combo ascended', function() {
				// Berserker is a major minor minor stat combo, with power precision ferocity.
				let subject = new TwoHandedWeaponSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('berserker'));

				expect(subject.stats).to.deep.equal({
					power: 251,
					precision: 179,
					ferocity: 179
				});
			});

			it('returns major: 215 and minor: 118 for a major major minor minor stat combo ascended', function() {
				// Marauder is a major major minor minor stat combo, with power precision vitality ferocity.
				let subject = new TwoHandedWeaponSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('marauder'));

				expect(subject.stats).to.deep.equal({
					power: 215,
					precision: 215,
					vitality: 118,
					ferocity: 118
				});
			});

			it('returns major: 118 for a major x7 stat combo ascended', function() {
				// Celestial is a major x7 stat combo, with power precision toughness vitality condition damage ferocity
				// healing power.
				let subject = new TwoHandedWeaponSlot(Slot.ASCENDED);
				subject.setData(subject.availableStatCombos.indexOf('celestial'));

				expect(subject.stats).to.deep.equal({
					power: 118,
					precision: 118,
					toughness: 118,
					vitality: 118,
					condition_damage: 118,
					ferocity: 118,
					healing_power: 118
				});
			});

			it('returns major: 239 and minor: 171 for a major minor minor stat combo exotic', function() {
				// Berserker is a major minor minor stat combo, with power precision ferocity.
				let subject = new TwoHandedWeaponSlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('berserker'));

				expect(subject.stats).to.deep.equal({
					power: 239,
					precision: 171,
					ferocity: 171
				});
			});

			it('returns major: 205 and minor: 113 for a major major minor minor stat combo exotic', function() {
				// Marauder is a major major minor minor stat combo, with power precision vitality ferocity.
				let subject = new TwoHandedWeaponSlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('marauder'));

				expect(subject.stats).to.deep.equal({
					power: 205,
					precision: 205,
					vitality: 113,
					ferocity: 113
				});
			});

			it('returns major: 113 for a major x7 stat combo exotic', function() {
				// Celestial is a major x7 stat combo, with power precision toughness vitality condition damage ferocity
				// healing power.
				let subject = new TwoHandedWeaponSlot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('celestial'));

				expect(subject.stats).to.deep.equal({
					power: 113,
					precision: 113,
					toughness: 113,
					vitality: 113,
					condition_damage: 113,
					ferocity: 113,
					healing_power: 113
				});
			});
		});
	});
});