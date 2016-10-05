'use strict';

import chai from 'chai';

chai.should();

import Slot from '../../server/models/Slot';

describe('Slot', function() {
	describe('#constructor', function() {
		it('sets available stat combos to all stat combos', function() {
			let subject = new Slot(Slot.EXOTIC());

			subject.availableStatCombos.should.deep.equal([
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
			let subject = new Slot(Slot.EXOTIC())

			subject.slotStatCombos.should.deep.equal([
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
			let subject = new Slot(Slot.EXOTIC());

			subject.gearType.should.equal(Slot.EXOTIC());
		});

		it('sets the selected stat combo to what was given', function() {
			let subject = new Slot(Slot.EXOTIC(), 1);

			subject.data.should.equal(1);
		});

		it('sets a random stat combo as the selected stat combo if not provided', function() {
			let subject = new Slot(Slot.EXOTIC());

			subject.should.have.property('selected_stat_combo').with.oneOf(subject.available_stat_combos);
		});
	});

	describe('#EXOTIC', function() {
		it('returns the string \'exotic\'', function() {
			Slot.EXOTIC().should.equal('exotic');
		});
	});

	describe('#ASCENDED', function() {
		it('returns the string \'ascended\'', function () {
			Slot.ASCENDED().should.equal('ascended');
		});
	});

	describe('#getStatComboName', function() {
		it('returns the name of the selected stat combo', function() {
			let subject = new Slot(Slot.EXOTIC(), 1);

			subject.getStatComboName().should.equal('berserker');
		});
	});

	describe('#getStatList', function() {
		it('returns the list of stats for the stat combo', function() {
			let subject = new Slot(Slot.EXOTIC(), 1);

			subject.getStat
		})
	});
});
