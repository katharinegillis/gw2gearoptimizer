/*
 * @file   server/models/Slot/TrinketSlot/AccessorySlot.js
 * @date   2016-10-07
 * @author gillis.katharine@gmail.com
 */

'use strict';

import Slot from '../../Slot';
import TrinketSlot from '../TrinketSlot';

export default class AccessorySlot extends TrinketSlot {
	get stats() {
		let stat_list = this.statList;
		let result = {};
		if (this.gearType == Slot.ASCENDED) {
			if (stat_list.major.length == 1) {
				result[stat_list.major[0]] = 110;
				result[stat_list.minor[0]] = 74;
				result[stat_list.minor[1]] = 74;
			} else if (stat_list.major.length == 2) {
				result[stat_list.major[0]] = 92;
				result[stat_list.major[1]] = 92;
				result[stat_list.minor[0]] = 49;
				result[stat_list.minor[1]] = 49;
			} else {
				for (let stat of stat_list.major) {
					result[stat] = 50;
				}
			}
		} else {
			if (stat_list.major.length == 1) {
				result[stat_list.major[0]] = 75;
				result[stat_list.minor[0]] = 53;
				result[stat_list.minor[1]] = 53;
			} else if (stat_list.major.length == 2) {
				result[stat_list.major[0]] = 64;
				result[stat_list.major[1]] = 64;
				result[stat_list.minor[0]] = 35;
				result[stat_list.minor[1]] = 35;
			} else {
				for (let stat of stat_list.major) {
					result[stat] = 35;
				}
			}
		}

		return result;
	}
};