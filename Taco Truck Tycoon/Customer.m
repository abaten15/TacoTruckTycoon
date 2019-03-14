//
//  Customer.m
//  Taco Truck Tycoon
//
//  Created by Nick Abate on 3/7/19.
//  Copyright © 2019 Nick Abate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "Customer.h"

@implementation Customer {

}

- (void) setIngredients:(NSArray *)ingredients {
	_ingredients = ingredients;
}

- (void) onCreate:(CGPoint)goTo {
	_nextInLine = NULL;
	[self setPosition:CGPointMake(-17, 300)];
	[self setSize:CGSizeMake(50, 50)];
	CGFloat distanceX = self.position.x - goTo.x;
	CGFloat distanceY = self.position.y - goTo.y;
	CGFloat distance = sqrt(distanceX * distanceX + distanceY * distanceY);
	SKAction *walkTo = [SKAction moveTo:goTo duration:distance/CUSTOMER_SPEED];
	[self runAction:walkTo];
}

- (void) moveDown:(CGPoint) location {
	[self removeAllActions];
	CGFloat distanceX = self.position.x - location.x;
	CGFloat distanceY = self.position.y - location.y;
	CGFloat distance = sqrt(distanceX * distanceX + distanceY * distanceY);
	SKAction *walkTo = [SKAction moveTo:location duration:distance/CUSTOMER_SPEED];
	[self runAction:walkTo];
}

- (BOOL) ingredientsMatch:(NSArray *)ingredientsIn {
	int size = (int)[ingredientsIn count];
	if ([_ingredients count] != size) {
		return NO;
	}
	for (int i = 0; i < size; i++) {
		if (![[_ingredients objectAtIndex:i] isEqual:[ingredientsIn objectAtIndex:i]]) {
			return NO;
		}
	}
	return YES;
}

@end

