//
//  Recipes.m
//  Taco Truck Tycoon
//
//  Created by Nick Abate on 3/15/19.
//  Copyright © 2019 Nick Abate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "Recipes.h"

@implementation Recipes

- (void) onCreate {
	_on = NO;
	[self setText:@"Recipes"];
	[self setFontSize:20];
	[self setFontColor:[UIColor colorWithWhite:0 alpha:1]];
	[self setPosition:CGPointMake(-330, 185)];
	
	_menu = [SKSpriteNode spriteNodeWithImageNamed:@"Recipes"];
	_menu.size = CGSizeMake(300, 300);
	_menu.position = CGPointMake(150, -150);
	
	
}

- (void) toggle {
	if (_on) {
		[self removeAllChildren];
		_on = NO;
	} else {
		[self addChild:_menu];
		_on = YES;
	}
}

@end
