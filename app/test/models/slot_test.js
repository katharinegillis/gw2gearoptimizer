'use strict';

import chai from 'chai';
import _ from 'underscore';

chai.should();

import Slot from '../../server/models/Slot';

describe('Slot', function() {
	describe('#constructor', function() {
		it('sets available stat combos to all stat combos', function() {
			let subject = new Slot(Slot.EXOTIC());

			subject.available_stat_combos.should.deep.equal([
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

			subject.type.should.equal(Slot.EXOTIC());
		});

		it('sets a random stat combo as the selected stat combo', function() {
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
});
