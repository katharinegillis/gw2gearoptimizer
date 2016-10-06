/*
 * @file   server/models/Slot/ArmourSlot/BootsSlot.js
 * @date   2016-10-06
 * @author gillis.katharine@gmail.com
 */

'use strict';

import Slot from '../../Slot';
import ArmourSlot from '../ArmourSlot';

export default class BootsSlot extends ArmourSlot {
	get stats() {
		let stat_list = this.statList;
		let result = {};
		if (this.gearType == Slot.ASCENDED) {
			if (stat_list.major.length == 1) {
				result[stat_list.major[0]] = 47;
				result[stat_list.minor[0]] = 34;
				result[stat_list.minor[1]] = 34;
			} else if (stat_list.major.length == 2) {
				result[stat_list.major[0]] = 40;
				result[stat_list.major[1]] = 40;
				result[stat_list.minor[0]] = 22;
				result[stat_list.minor[1]] = 22;
			} else {
				for (let stat of stat_list.major) {
					result[stat] = 22;
				}
			}
		} else {
			if (stat_list.major.length == 1) {
				result[stat_list.major[0]] = 45;
				result[stat_list.minor[0]] = 32;
				result[stat_list.minor[1]] = 32;
			} else if (stat_list.major.length == 2) {
				result[stat_list.major[0]] = 38;
				result[stat_list.major[1]] = 38;
				result[stat_list.minor[0]] = 21;
				result[stat_list.minor[1]] = 21;
			} else {
				for (let stat of stat_list.major) {
					result[stat] = 21;
				}
			}
		}

		return result;
	}
};