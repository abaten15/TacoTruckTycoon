//
//  CustomerLine.m
//  Taco Truck Tycoon
//
//  Created by Nick Abate on 3/12/19.
//  Copyright © 2019 Nick Abate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomerLine.h"

#import <SpriteKit/SpriteKit.h>

@implementation CustomerLine

- (void) addTo:(SKScene *)scene {
	[scene addChild:self];
}

- (void) addToLine:(Customer *)customerIn {
	if (_numCustomers >= _maxSize) {
		return;
	}
	if (_numCustomers == 0) {
		_frontOfTheLine = customerIn;
		[customerIn onCreate:ORDERING_LOCATION];
		_numCustomers++;
		[self addChild:customerIn];
		return;
	} else if (_numCustomers < 3) {
		int count = 1;
		Customer *temp = _frontOfTheLine;
		while (temp.nextInLine != NULL) {
			count++;
			temp = temp.nextInLine;
		}
		temp.nextInLine = customerIn;
		CGPoint goTo = ORDERING_LOCATION;
		goTo.y = goTo.y + (count * 50);
		[customerIn onCreate:goTo];
		_numCustomers++;
		[self addChild:customerIn];
		return;
	}
}

- (void) popFromLine {
	if (_numCustomers <= 0) {
		return;
	}
	Customer *toBePopped = _frontOfTheLine;
	_frontOfTheLine = toBePopped.nextInLine;
	_numCustomers--;
	// TODO customer leaving animation
	Customer *temp = _frontOfTheLine;
	int count = 0;
	while(temp != NULL) {
		CGPoint goTo = ORDERING_LOCATION;
		goTo.y = goTo.y + (count * 50);
		[temp moveDown:goTo];
		temp = temp.nextInLine;
		count ++;
	}
	[toBePopped removeFromParent];
}

@end
