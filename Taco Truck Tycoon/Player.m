//
//  Player.m
//  Taco Truck Tycoon
//
//  Created by Nick Abate on 3/5/19.
//  Copyright © 2019 Nick Abate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@implementation Player {

}

- (void) onCreatePlayer {
	self.size = CGSizeMake(100, 100);
	self.position = CGPointMake(0, 0);
	[self setSize:self.size];
	[self setPosition:self.position];
	self.speed = 10;
}

- (void) goTo:(CGPoint)point {
	CGFloat distanceX = self.position.x - point.x;
	CGFloat distanceY = self.position.y - point.y;
	CGFloat distance = sqrt(distanceX * distanceX + distanceY * distanceY);
	SKAction *action = [SKAction moveTo:point duration:distance/self.speed];
	[self runAction:action];
}

@end
