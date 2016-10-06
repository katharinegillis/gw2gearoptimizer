/*
 * @file   server/models/Slot.js
 * @date   2016-10-02
 * @author gillis.katharine@gmail.com
 */

import RandomUtil from '../utils/RandomUtil';

const EXOTIC = 'exotic';
const ASCENDED = 'ascended';

class Slot {
	// Constructor
	constructor(gear_type) {
		this._availableStatCombos = [
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
		this._slotStatCombos = [
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
		this._gear_type = gear_type;
	}


	// Constants
	/**
	 * @returns {string}
	 */
	static get EXOTIC() {
		return EXOTIC;
	}

	/**
	 * @returns {string}
	 */
	static get ASCENDED() {
		return ASCENDED;
	}


	// Properties
	get availableStatCombos() {
		return this._availableStatCombos;
	}

	get slotStatCombos() {
		return this._slotStatCombos;
	}

	get gearType() {
		return this._gear_type;
	}

	get data() {
		return this._data;
	}

	get statComboName() {
		throw new Error('Not implemented yet.');
	}

	get statList() {
		throw new Error('Not implemented yet.');
	}

	get dataMaskLength() {
		throw new Error('Not implemented yet.');
		if (this.availableStatCombos.length == 0) {
			return null;
		}

		return (this.availableStatCombos.length - 1).toString(2).length;
	}

	get dataMask() {
		throw new Error('Not implemented yet.');
	}


	// Methods
	setData(value) {
		this._data = value;
	}

	randomizeData() {
		throw new Error('Not implemented yet.');
		this._data = Math.floor(RandomUtil.random() * this.availableStatCombos.length);
	}
}

module.exports = Slot;