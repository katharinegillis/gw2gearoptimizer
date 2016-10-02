'use strict';

import chai from 'chai';
chai.should();

import Rectangle from './rectangle';

describe('Rectangle', () => {
	describe('#width', () => {
		it('returns the width', () => {
			let subject = new Rectangle(10, 20);
			subject.width.should.equal(10);
		});
	});
});