/*
 * @file   server/models/Slot.js
 * @date   2016-10-02
 * @author gillis.katharine@gmail.com
 */

class Slot {
	constructor(gear_type, data = null) {
		throw new Error('Not implemented yet.');
		this.available_stat_combos = [
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
	}

	static EXOTIC() {
		throw new Error('Not implemented yet.');
	}

	static ASCENDED() {
		throw new Error('Not implemented yet.');
	}

	get availableStatCombos() {
		throw new Error('Not implemented yet.');
	}

	get slotStatCombos() {
		throw new Error('Not implemented yet.');
	}

	get gearType() {
		throw new Error('Not implemented yet.');
	}

	get data() {
		throw new Error('Not implemented yet.');
	}

	getStatComboName() {
		throw new Error('Not implemented yet.');
	}
}

module.exports = Slot;