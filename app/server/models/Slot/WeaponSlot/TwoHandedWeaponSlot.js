/*
 * @file   server/models/Slot/WeaponSlot/TwoHandedWeaponSLot.js
 * @date   2016-10-06
 * @author gillis.katharine@gmail.com
 */

'use strict';

import Slot from '../../Slot';
import WeaponSlot from '../WeaponSlot';

export default class TwoHandedWeaponSLot extends WeaponSlot {
	get stats() {
		let stat_list = this.statList;
		let result = {};
		if (this.gearType == Slot.ASCENDED) {
			if (stat_list.major.length == 1) {
				result[stat_list.major[0]] = 251;
				result[stat_list.minor[0]] = 179;
				result[stat_list.minor[1]] = 179;
			} else if (stat_list.major.length == 2) {
				result[stat_list.major[0]] = 215;
				result[stat_list.major[1]] = 215;
				result[stat_list.minor[0]] = 118;
				result[stat_list.minor[1]] = 118;
			} else {
				for (let stat of stat_list.major) {
					result[stat] = 118;
				}
			}
		} else {
			if (stat_list.major.length == 1) {
				result[stat_list.major[0]] = 239;
				result[stat_list.minor[0]] = 171;
				result[stat_list.minor[1]] = 171;
			} else if (stat_list.major.length == 2) {
				result[stat_list.major[0]] = 205;
				result[stat_list.major[1]] = 205;
				result[stat_list.minor[0]] = 113;
				result[stat_list.minor[1]] = 113;
			} else {
				for (let stat of stat_list.major) {
					result[stat] = 113;
				}
			}
		}

		return result;
	}
};