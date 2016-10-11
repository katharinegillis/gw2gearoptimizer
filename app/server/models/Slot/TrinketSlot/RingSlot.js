/*
 * @file   server/models/Slot/TrinketSlot/RingSlot.js
 * @date   2016-10-06
 * @author gillis.katharine@gmail.com
 */

'use strict';

import Slot from '../../Slot';
import TrinketSlot from '../TrinketSlot';

export default class RingSlot extends TrinketSlot {
	get stats() {
		let stat_list = this.statList;
		let result = {};
		if (this.gearType == Slot.ASCENDED) {
			if (stat_list.major.length == 1) {
				result[stat_list.major[0]] = 126;
				result[stat_list.minor[0]] = 85;
				result[stat_list.minor[1]] = 85;
			} else if (stat_list.major.length == 2) {
				result[stat_list.major[0]] = 106;
				result[stat_list.major[1]] = 106;
				result[stat_list.minor[0]] = 56;
				result[stat_list.minor[1]] = 56;
			} else {
				for (let stat of stat_list.major) {
					result[stat] = 57;
				}
			}
		} else {
			if (stat_list.major.length == 1) {
				result[stat_list.major[0]] = 90;
				result[stat_list.minor[0]] = 64;
				result[stat_list.minor[1]] = 64;
			} else if (stat_list.major.length == 2) {
				result[stat_list.major[0]] = 77;
				result[stat_list.major[1]] = 77;
				result[stat_list.minor[0]] = 42;
				result[stat_list.minor[1]] = 42;
			} else {
				for (let stat of stat_list.major) {
					result[stat] = 42;
				}
			}
		}

		return result;
	}
};