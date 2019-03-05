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
	self.size = CGSizeMake(200, 200);
	self.position = CGPointMake(0, 0);
	[self setSize:self.size];
	[self setPosition:self.position];
}

@end
