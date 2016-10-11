/*
 * @file   server/models/Slot/TrinketSlot/AmuletSlot.js
 * @date   2016-10-06
 * @author gillis.katharine@gmail.com
 */

'use strict';

import Slot from '../../Slot';
import TrinketSlot from '../TrinketSlot';

export default class AmuletSlot extends TrinketSlot {
	get stats() {
		let stat_list = this.statList;
		let result = {};
		if (this.gearType == Slot.ASCENDED) {
			if (stat_list.major.length == 1) {
				result[stat_list.major[0]] = 157;
				result[stat_list.minor[0]] = 108;
				result[stat_list.minor[1]] = 108;
			} else if (stat_list.major.length == 2) {
				result[stat_list.major[0]] = 133;
				result[stat_list.major[1]] = 133;
				result[stat_list.minor[0]] = 71;
				result[stat_list.minor[1]] = 71;
			} else {
				for (let stat of stat_list.major) {
					result[stat] = 72;
				}
			}
		} else {
			if (stat_list.major.length == 1) {
				result[stat_list.major[0]] = 120;
				result[stat_list.minor[0]] = 85;
				result[stat_list.minor[1]] = 85;
			} else if (stat_list.major.length == 2) {
				result[stat_list.major[0]] = 102;
				result[stat_list.major[1]] = 102;
				result[stat_list.minor[0]] = 56;
				result[stat_list.minor[1]] = 56;
			} else {
				for (let stat of stat_list.major) {
					result[stat] = 56;
				}
			}
		}

		return result;
	}
};