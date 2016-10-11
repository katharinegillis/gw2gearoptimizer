/*
 * @file   test/models/SlotTest.js
 * @date   2016-10-06
 * @author gillis.katharine@gmail.com
 */

'use strict';

import { expect } from 'chai';
import sinon from 'sinon';

import Slot from '../../server/models/Slot';
import RandomUtil from '../../server/utils/RandomUtil';

describe('Slot', function() {
	let all_stat_combos = [
		'berserker',
		'zealot',
		'soldier',
		'valkyrie',
		'rampager',
		'assassin',
		'knight',
		'cavalier',
		'nomad',
		'settler',
		'sentinel',
		'shaman',
		'sinister',
		'carrion',
		'rabid',
		'dire',
		'cleric',
		'magi',
		'apothecary',
		'commander',
		'marauder',
		'vigilant',
		'crusader',
		'wanderer',
		'viper',
		'trailblazer',
		'minstrel',
		'celestial',
		'captain',
		'givers_weapon',
		'givers_armour'
	];

	describe('constructor()', function() {
		it('sets available stat combos to all stat combos', function() {
			let subject = new Slot(Slot.EXOTIC);

			expect(subject.availableStatCombos).to.deep.equal(all_stat_combos);
		});

		it('sets slot stat combos to all stat combos', function() {
			let subject = new Slot(Slot.EXOTIC);

			expect(subject.slotStatCombos).to.deep.equal(all_stat_combos);
		});

		it('sets the type to what was given', function() {
			let subject = new Slot(Slot.EXOTIC);

			expect(subject.gearType).to.equal(Slot.EXOTIC);
		});
	});

	describe('constant', function() {
		describe('EXOTIC', function() {
			it('returns the string \'exotic\'', function() {
				expect(Slot.EXOTIC).to.equal('exotic');
			});
		});

		describe('ASCENDED', function() {
			it('returns the string \'ascended\'', function () {
				expect(Slot.ASCENDED).to.equal('ascended');
			});
		});
	});

	describe('property', function() {
		describe('.data', function() {
			it('returns the stat combo data', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(1);

				expect(subject.data).to.equal(1);
			});
		});

		describe('.statComboName', function() {
			it('returns the name of the selected stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('berserker'));

				expect(subject.statComboName).to.equal('berserker');
			});
		});

		describe('.statList', function() {
			it('returns major: power, minor: precision and ferocity for berserker stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('berserker'));

				expect(subject.statList).to.deep.equal({
					major: [ 'power' ],
					minor: [ 'precision', 'ferocity' ]
				});
			});

			it('returns major: power, minor: precision and healing power for zealot stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('zealot'));

				expect(subject.statList).to.deep.equal({
					major: [ 'power' ],
					minor: [ 'precision', 'healing_power' ]
				});
			});

			it('returns major: power, minor: toughness and vitality for soldier stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('soldier'));

				expect(subject.statList).to.deep.equal({
					major: [ 'power' ],
					minor: [ 'toughness', 'vitality' ]
				});
			});

			it('returns major: power, minor: vitality and ferocity for valkyrie stat combo', function() {
				let subject = new Slot(Slot.Exotic);
				subject.setData(subject.availableStatCombos.indexOf('valkyrie'));

				expect(subject.statList).to.deep.equal({
					major: [ 'power' ],
					minor: [ 'vitality', 'ferocity' ]
				});
			});

			it('returns major: precision, minor: power and condition damage for rampager stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('rampager'));

				expect(subject.statList).to.deep.equal({
					major: [ 'precision' ],
					minor: [ 'power', 'condition_damage']
				});
			});

			it('returns major: precision, minor: power and ferocity for assassin stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('assassin'));

				expect(subject.statList).to.deep.equal({
					major: [ 'precision' ],
					minor: [ 'power', 'ferocity' ]
				});
			});

			it('returns major: toughness, minor: power and precision for knight stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('knight'));

				expect(subject.statList).to.deep.equal({
					major: [ 'toughness' ],
					minor: [ 'power', 'precision' ]
				});
			});

			it('returns major: toughness, minor: power and ferocity for cavalier stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('cavalier'));

				expect(subject.statList).to.deep.equal({
					major: [ 'toughness' ],
					minor: [ 'power', 'ferocity' ]
				});
			});

			it('returns major: toughness, minor: vitality and healing power for nomad stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('nomad'));

				expect(subject.statList).to.deep.equal({
					major: [ 'toughness' ],
					minor: [ 'vitality', 'healing_power' ]
				});
			});

			it('returns major: toughness, minor: condition damage and healing power for settler stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('settler'));

				expect(subject.statList).to.deep.equal({
					major: [ 'toughness' ],
					minor: [ 'condition_damage', 'healing_power' ]
				});
			});

			it('returns major: vitality, minor: power and toughness for sentinel stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('sentinel'));

				expect(subject.statList).to.deep.equal({
					major: [ 'vitality' ],
					minor: [ 'power', 'toughness' ]
				});
			});

			it('returns major: vitality, minor: condition damage and healing power for shaman stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('shaman'));

				expect(subject.statList).to.deep.equal({
					major: [ 'vitality' ],
					minor: [ 'condition_damage', 'healing_power' ]
				});
			});

			it('returns major: condition damage, minor: power and precision for sinister stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('sinister'));

				expect(subject.statList).to.deep.equal({
					major: [ 'condition_damage' ],
					minor: [ 'power', 'precision' ]
				});
			});

			it('returns major: condition damage, minor: power and vitality for carrion stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('carrion'));

				expect(subject.statList).to.deep.equal({
					major: [ 'condition_damage' ],
					minor: [ 'power', 'vitality' ]
				});
			});

			it('returns major: condition damage, minor: precision and toughness for rabid stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('rabid'));

				expect(subject.statList).to.deep.equal({
					major: [ 'condition_damage' ],
					minor: [ 'precision', 'toughness' ]
				});
			});

			it('returns major: condition damage, minor: toughness and vitality for dire stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('dire'));

				expect(subject.statList).to.deep.equal({
					major: [ 'condition_damage' ],
					minor: [ 'toughness', 'vitality' ]
				});
			});

			it('returns major: healing power, minor: power and toughness for cleric stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('cleric'));

				expect(subject.statList).to.deep.equal({
					major: [ 'healing_power' ],
					minor: [ 'power', 'toughness' ]
				});
			});

			it('returns major: healing power, minor: precision and vitality for magi stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('magi'));

				expect(subject.statList).to.deep.equal({
					major: [ 'healing_power' ],
					minor: [ 'precision', 'vitality' ]
				});
			});

			it('returns major: healing power, minor: toughness and condition damage for apothecary stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('apothecary'));

				expect(subject.statList).to.deep.equal({
					major: [ 'healing_power' ],
					minor: [ 'toughness', 'condition_damage' ]
				});
			});

			it('returns major: power and precision, minor: toughness and concentration for commander stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('commander'));

				expect(subject.statList).to.deep.equal({
					major: [ 'power', 'precision' ],
					minor: [ 'toughness', 'concentration' ]
				});
			});

			it('returns major: power and precision, minor: vitality and ferocity for marauder stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('marauder'));

				expect(subject.statList).to.deep.equal({
					major: [ 'power', 'precision' ],
					minor: [ 'vitality', 'ferocity' ]
				});
			});

			it('returns major: power and toughness, minor: concentration and expertise for vigilant stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('vigilant'));

				expect(subject.statList).to.deep.equal({
					major: [ 'power', 'toughness' ],
					minor: [ 'concentration', 'expertise' ]
				});
			});

			it('returns major: power and toughness, minor: ferocity and healing power for crusader stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('crusader'));

				expect(subject.statList).to.deep.equal({
					major: [ 'power', 'toughness' ],
					minor: [ 'ferocity', 'healing_power' ]
				});
			});

			it('returns major: power and vitality, minor: toughness and concentration for wanderer stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('wanderer'));

				expect(subject.statList).to.deep.equal({
					major: [ 'power', 'vitality' ],
					minor: [ 'toughness', 'concentration' ]
				});
			});

			it('returns major: power and condition damage, minor: precision and expertise for viper stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('viper'));

				expect(subject.statList).to.deep.equal({
					major: [ 'power', 'condition_damage' ],
					minor: [ 'precision', 'expertise' ]
				});
			});

			it('returns major: toughness and condition damage, minor: vitality and expertise for trailblazer stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('trailblazer'));

				expect(subject.statList).to.deep.equal({
					major: [ 'toughness', 'condition_damage' ],
					minor: [ 'vitality', 'expertise' ]
				});
			});

			it('returns major: toughness and healing power, minor: vitality and concentration for minstrel stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('minstrel'));

				expect(subject.statList).to.deep.equal({
					major: [ 'toughness', 'healing_power' ],
					minor: [ 'vitality', 'concentration' ]
				});
			});

			it('returns major: power, precision, toughness, vitality, condition damage, ferocity, and healing power', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('celestial'));

				expect(subject.statList).to.deep.equal({
					major: [
						'power',
						'precision',
						'toughness',
						'vitality',
						'condition_damage',
						'ferocity',
						'healing_power'
					]
				});
			});

			it('returns major: precision, minor: power and toughness for captain stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('captain'));

				expect(subject.statList).to.deep.equal({
					major: [ 'precision' ],
					minor: [ 'power', 'toughness' ]
				});
			});

			it('returns major: expertise, minor: precision and vitality for givers_weapon stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('givers_weapon'));

				expect(subject.statList).to.deep.equal({
					major: [ 'expertise' ],
					minor: [ 'precision', 'vitality' ]
				});
			});

			it('returns major: toughness, minor: healing power and concentration for givers_armour stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(subject.availableStatCombos.indexOf('givers_armour'));

				expect(subject.statList).to.deep.equal({
					major: [ 'toughness' ],
					minor: [ 'healing_power', 'concentration' ]
				});
			});
		});

		describe('.dataMaskLength', function() {
			it('returns null for zero available stat combos', function() {
				let subject = new Slot(Slot.EXOTIC);

				subject._availableStatCombos = [];
				expect(subject.dataMaskLength).to.equal(null);
			});

			it('returns the length of the string binary number of available stat combos minus one', function() {
				let subject = new Slot(Slot.EXOTIC);

				subject._availableStatCombos = ['0'];
				expect(subject.dataMaskLength).to.equal(1);

				subject._availableStatCombos = all_stat_combos;
				expect(subject.dataMaskLength).to.equal(5);
			});
		});

		describe('.dataMask', function() {
			it('returns null for zero available stat combos', function() {
				let subject = new Slot(Slot.EXOTIC);

				subject._availableStatCombos = [];
				expect(subject.dataMask).to.equal(null);
			});

			it('returns the binary mask of the available stat combos minus one', function() {
				let subject = new Slot(Slot.EXOTIC);

				subject._availableStatCombos = ['0'];
				expect(subject.dataMask).to.equal(1);

				subject._availableStatCombos = all_stat_combos;
				expect(subject.dataMask).to.equal(31);
			});
		})
	});

	describe('method', function() {
		describe('setData()', function() {
			it('returns true if the data represents one of the available stat combos and sets the data property', function() {
				let subject = new Slot(Slot.EXOTIC);

				expect(subject.setData(1)).to.equal(true);
				expect(subject.data).to.equal(1);
			});

			it('returns false if the data is outside the available stat combos', function() {
				let subject = new Slot(Slot.EXOTIC);

				expect(subject.setData(300)).to.equal(false);
			});
		});

		describe('randomizeData()', function() {
			let randomStub = null;
			beforeEach(function() {
				randomStub = sinon.stub(RandomUtil, 'random');
			});

			afterEach(function() {
				randomStub.restore();
			});

			it('sets data to 0 if the random value is 0', function() {
				randomStub.returns(0);

				let subject = new Slot(Slot.EXOTIC);
				subject.randomizeData();

				expect(subject.data).to.equal(0);
			});

			it('sets data to the index of the last element in availableStatCombos', function() {
				randomStub.returns(0.99999999999);

				let subject = new Slot(Slot.EXOTIC);
				subject.randomizeData();

				expect(subject.data).to.equal(subject.availableStatCombos.length - 1);
			});
		});
	});
});
