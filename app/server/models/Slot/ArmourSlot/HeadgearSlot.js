/*
 * @file   server/models/Slot/ArmourSlot/HeadgearSlot.js
 * @date   2016-10-06
 * @author gillis.katharine@gmail.com
 */

'use strict';

import Slot from '../../Slot';
import ArmourSlot from '../ArmourSlot';

export default class HeadgearSlot extends ArmourSlot {
	get stats() {
		let stat_list = this.statList;
		let result = {};
		if (this.gearType == Slot.ASCENDED) {
			if (stat_list.major.length == 1) {
				result[stat_list.major[0]] = 63;
				result[stat_list.minor[0]] = 45;
				result[stat_list.minor[1]] = 45;
			} else if (stat_list.major.length == 2) {
				result[stat_list.major[0]] = 54;
				result[stat_list.major[1]] = 54;
				result[stat_list.minor[0]] = 30;
				result[stat_list.minor[1]] = 30;
			} else {
				for (let stat of stat_list.major) {
					result[stat] = 30;
				}
			}
		} else {
			if (stat_list.major.length == 1) {
				result[stat_list.major[0]] = 60;
				result[stat_list.minor[0]] = 43;
				result[stat_list.minor[1]] = 43;
			} else if (stat_list.major.length == 2) {
				result[stat_list.major[0]] = 51;
				result[stat_list.major[1]] = 51;
				result[stat_list.minor[0]] = 28;
				result[stat_list.minor[1]] = 28;
			} else {
				for (let stat of stat_list.major) {
					result[stat] = 28;
				}
			}
		}

		return result;
	}
};