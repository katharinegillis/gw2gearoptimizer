/*
 * @file   server/models/Slot/ArmourSlot/LeggingsSlot.js
 * @date   2016-10-06
 * @author gillis.katharine@gmail.com
 */

'use strict';

import Slot from '../../Slot';
import ArmourSlot from '../ArmourSlot';

export default class LeggingsSlot extends ArmourSlot {
	get stats() {
		let stat_list = this.statList;
		let result = {};
		if (this.gearType == Slot.ASCENDED) {
			if (stat_list.major.length == 1) {
				result[stat_list.major[0]] = 94;
				result[stat_list.minor[0]] = 67;
				result[stat_list.minor[1]] = 67;
			} else if (stat_list.major.length == 2) {
				result[stat_list.major[0]] = 81;
				result[stat_list.major[1]] = 81;
				result[stat_list.minor[0]] = 44;
				result[stat_list.minor[1]] = 44;
			} else {
				for (let stat of stat_list.major) {
					result[stat] = 44;
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