/*
 * @file   server/models/Slot/ArmourSlot/ChestSlot.js
 * @date   2016-10-06
 * @author gillis.katharine@gmail.com
 */

'use strict';

import Slot from '../../Slot';
import ArmourSlot from '../ArmourSlot';

export default class ChestSlot extends ArmourSlot {
	get stats() {
		let stat_list = this.statList;
		let result = {};
		if (this.gearType == Slot.ASCENDED) {
			if (stat_list.major.length == 1) {
				result[stat_list.major[0]] = 141;
				result[stat_list.minor[0]] = 101;
				result[stat_list.minor[1]] = 101;
			} else if (stat_list.major.length == 2) {
				result[stat_list.major[0]] = 121;
				result[stat_list.major[1]] = 121;
				result[stat_list.minor[0]] = 67;
				result[stat_list.minor[1]] = 67;
			} else {
				for (let stat of stat_list.major) {
					result[stat] = 67;
				}
			}
		} else {
			if (stat_list.major.length == 1) {
				result[stat_list.major[0]] = 134;
				result[stat_list.minor[0]] = 96;
				result[stat_list.minor[1]] = 96;
			} else if (stat_list.major.length == 2) {
				result[stat_list.major[0]] = 115;
				result[stat_list.major[1]] = 115;
				result[stat_list.minor[0]] = 63;
				result[stat_list.minor[1]] = 63;
			} else {
				for (let stat of stat_list.major) {
					result[stat] = 63;
				}
			}
		}

		return result;
	}
};