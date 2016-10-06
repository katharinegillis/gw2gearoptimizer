/*
 * @file   server/models/Slot.js
 * @date   2016-10-02
 * @author gillis.katharine@gmail.com
 */

'use strict';

import RandomUtil from '../utils/RandomUtil';

const EXOTIC = 'exotic';
const ASCENDED = 'ascended';

export default class Slot {
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
			'celestial',
			'captain'
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
			'celestial',
			'captain'
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
		return this.availableStatCombos[this.data];
	}

	get statList() {
		switch (this.statComboName) {
			case 'berserker':
				return {
					major: [ 'power' ],
					minor: [ 'precision', 'ferocity' ]
				};
				break;
			case 'zealot':
				return {
					major: [ 'power' ],
					minor: [ 'precision', 'healing_power' ]
				};
				break;
			case 'soldier':
				return {
					major: [ 'power' ],
					minor: [ 'toughness', 'vitality' ]
				};
				break;
			case 'valkyrie':
				return {
					major: [ 'power' ],
					minor: [ 'vitality', 'ferocity' ]
				};
				break;
			case 'rampager':
				return {
					major: [ 'precision' ],
					minor: [ 'power', 'condition_damage' ]
				};
				break;
			case 'assassin':
				return {
					major: [ 'precision' ],
					minor: [ 'power', 'ferocity' ]
				};
				break;
			case 'knight':
				return {
					major: [ 'toughness' ],
					minor: [ 'power' , 'precision' ]
				};
				break;
			case 'cavalier':
				return {
					major: [ 'toughness' ],
					minor: [ 'power', 'ferocity' ]
				};
				break;
			case 'nomad':
				return {
					major: [ 'toughness' ],
					minor: [ 'vitality', 'healing_power' ]
				};
				break;
			case 'settler':
				return {
					major: [ 'toughness' ],
					minor: [ 'condition_damage', 'healing_power' ]
				};
				break;
			case 'sentinel':
				return {
					major: [ 'vitality' ],
					minor: [ 'power', 'toughness' ]
				};
				break;
			case 'shaman':
				return {
					major: [ 'vitality' ],
					minor: [ 'condition_damage', 'healing_power' ]
				};
				break;
			case 'sinister':
				return {
					major: [ 'condition_damage' ],
					minor: [ 'power', 'precision' ]
				};
				break;
			case 'carrion':
				return {
					major: [ 'condition_damage' ],
					minor: [ 'power', 'vitality' ]
				};
				break;
			case 'rabid':
				return {
					major: [ 'condition_damage' ],
					minor: [ 'precision', 'toughness' ]
				};
				break;
			case 'dire':
				return {
					major: [ 'condition_damage' ],
					minor: [ 'toughness', 'vitality' ]
				};
				break;
			case 'cleric':
				return {
					major: [ 'healing_power' ],
					minor: [ 'power', 'toughness' ]
				};
				break;
			case 'magi':
				return {
					major: [ 'healing_power' ],
					minor: [ 'precision', 'vitality' ]
				};
				break;
			case 'apothecary':
				return {
					major: [ 'healing_power' ],
					minor: [ 'toughness', 'condition_damage' ]
				};
				break;
			case 'commander':
				return {
					major: [ 'power', 'precision' ],
					minor: [ 'toughness', 'concentration' ]
				};
				break;
			case 'marauder':
				return {
					major: [ 'power', 'precision' ],
					minor: [ 'vitality', 'ferocity' ]
				};
				break;
			case 'vigilant':
				return {
					major: [ 'power', 'toughness' ],
					minor: [ 'concentration', 'expertise' ]
				};
				break;
			case 'crusader':
				return {
					major: [ 'power', 'toughness' ],
					minor: [ 'ferocity', 'healing_power' ]
				};
				break;
			case 'wanderer':
				return {
					major: [ 'power', 'vitality' ],
					minor: [ 'toughness', 'concentration' ]
				};
				break;
			case 'viper':
				return {
					major: [ 'power', 'condition_damage' ],
					minor: [ 'precision', 'expertise' ]
				};
				break;
			case 'trailblazer':
				return {
					major: [ 'toughness', 'condition_damage' ],
					minor: [ 'vitality', 'expertise' ]
				};
				break;
			case 'minstrel':
				return {
					major: [ 'toughness', 'healing_power' ],
					minor: [ 'vitality', 'concentration' ]
				};
				break;
			case 'celestial':
				return {
					major: [
						'power',
						'precision',
						'toughness',
						'vitality',
						'condition_damage',
						'ferocity',
						'healing_power'
					]
				};
				break;
			case 'captain':
				return {
					major: [ 'precision' ],
					minor: [ 'power', 'toughness' ]
				};
				break;
			case 'apostate':
				return {
					major: [ 'condition_damage' ],
					minor: [ 'toughness', 'healing_power' ]
				};
				break;
			default:
				break;
		}

		return null;
	}

	get dataMaskLength() {
		if (this.availableStatCombos.length == 0) {
			return null;
		}

		return (this.availableStatCombos.length - 1).toString(2).length;
	}

	get dataMask() {
		if (this.availableStatCombos.length == 0) {
			return null;
		}

		return parseInt('1'.repeat(this.dataMaskLength), 2);
	}


	// Methods
	setData(value) {
		if (value >= this.availableStatCombos.length) {
			return false;
		}

		this._data = value;
		return true;
	}

	randomizeData() {
		this._data = Math.floor(RandomUtil.random() * this.availableStatCombos.length);
	}
};