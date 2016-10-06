'use strict';

import { expect } from 'chai';
import sinon from 'sinon';

import Slot from '../../server/models/Slot';
import RandomUtil from '../../server/utils/RandomUtil';

describe('Slot', function() {
	describe('constructor', function() {
		describe('#constructor', function() {
			it('sets available stat combos to all stat combos', function() {
				let subject = new Slot(Slot.EXOTIC);

				expect(subject.availableStatCombos).to.deep.equal([
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
				]);
			});

			it('sets slot stat combos to all stat combos', function() {
				let subject = new Slot(Slot.EXOTIC);

				expect(subject.slotStatCombos).to.deep.equal([
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
				]);
			});

			it('sets the type to what was given', function() {
				let subject = new Slot(Slot.EXOTIC);

				expect(subject.gearType).to.equal(Slot.EXOTIC);
			});
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
				subject.setData(0);

				expect(subject.statComboName).to.equal('berserker');
			});
		});

		describe('.statList', function() {
			it('returns the list of stats for the stat combo', function() {
				let subject = new Slot(Slot.EXOTIC);
				subject.setData(0);

				expect(subject.statList).to.deep.equal({
					major: [ 'power' ],
					minor: [ 'precision', 'ferocity' ]
				});
			})
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

				subject._availableStatCombos = [
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
				];
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

				subject._availableStatCombos = [
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
				];
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
