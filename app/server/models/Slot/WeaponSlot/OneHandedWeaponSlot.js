/*
 * @file   server/models/Slot/WeaponSlot/OneHandedWeaponSlot.js
 * @date   2016-10-06
 * @author gillis.katharine@gmail.com
 */

'use strict';

import Slot from '../../Slot';
import WeaponSlot from '../WeaponSlot';

export default class OneHandedWeaponSlot extends WeaponSlot {
	get stats() {
		let stat_list = this.statList;
		let result = {};
		if (this.gearType == Slot.ASCENDED) {
			if (stat_list.major.length == 1) {
				result[stat_list.major[0]] = 125;
				result[stat_list.minor[0]] = 90;
				result[stat_list.minor[1]] = 90;
			} else if (stat_list.major.length == 2) {
				result[stat_list.major[0]] = 108;
				result[stat_list.major[1]] = 108;
				result[stat_list.minor[0]] = 59;
				result[stat_list.minor[1]] = 59;
			} else {
				for (let stat of stat_list.major) {
					result[stat] = 59;
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