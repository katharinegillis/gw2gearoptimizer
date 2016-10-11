/*
 * @file   server/models/Slot/TrinketSlot/BackSlot.js
 * @date   2016-10-07
 * @author gillis.katharine@gmail.com
 */

'use strict';

import Slot from '../../Slot';
import TrinketSlot from '../TrinketSlot';

export default class BackSlot extends TrinketSlot {
	get stats() {
		let stat_list = this.statList;
		let result = {};
		if (this.gearType == Slot.ASCENDED) {
			if (stat_list.major.length == 1) {
				result[stat_list.major[0]] = 63;
				result[stat_list.minor[0]] = 40;
				result[stat_list.minor[1]] = 40;
			} else if (stat_list.major.length == 2) {
				result[stat_list.major[0]] = 52;
				result[stat_list.major[1]] = 52;
				result[stat_list.minor[0]] = 27;
				result[stat_list.minor[1]] = 27;
			} else {
				for (let stat of stat_list.major) {
					result[stat] = 28;
				}
			}
		} else {
			if (stat_list.major.length == 1) {
				result[stat_list.major[0]] = 30;
				result[stat_list.minor[0]] = 21;
				result[stat_list.minor[1]] = 21;
			} else {
				for (let stat of stat_list.major) {
					result[stat] = 14;
				}
			}
		}

		return result;
	}
};