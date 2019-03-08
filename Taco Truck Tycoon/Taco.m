//
//  Taco.m
//  Taco Truck Tycoon
//
//  Created by Nick Abate on 3/7/19.
//  Copyright © 2019 Nick Abate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "Taco.h"
#import "Customer.h"

@implementation Taco {

}

- (void) onCreate {

	_tortilla = YES;
	_beef = NO;
	_lettuce = NO;
	_tomatoe = NO;
	_sauce = NO;
	_beefNode = [SKSpriteNode spriteNodeWithImageNamed:@"beef"];
	[_beefNode setSize:CGSizeMake(20, 20)];
	_lettuceNode = [SKSpriteNode spriteNodeWithImageNamed:@"lettuce"];
	[_lettuceNode setSize:CGSizeMake(20, 20)];
	_tomatoeNode = [SKSpriteNode spriteNodeWithImageNamed:@"tomatoe"];
	[_tomatoeNode setSize:CGSizeMake(20, 20)];
	_sauceNode = [SKSpriteNode spriteNodeWithImageNamed:@"sauce"];
	[_sauceNode setSize:CGSizeMake(20, 20)];
	
}

- (void) addBeef {
	if (_beef == NO) {
		_beef = YES;
		[self addChild:_beefNode];
	}
}

- (void) addLettuce {
	if (_lettuce == NO) {
		_lettuce = YES;
		[self addChild:_lettuceNode];
	}
}

- (void) addTomatoe {
	if (_tomatoe == NO) {
		_tomatoe = YES;
		[self addChild:_tomatoeNode];
	}
}

- (void) addSauce {
	if (_sauce == NO) {
		_sauce = YES;
		[self addChild:_sauceNode];
	}
}

- (NSArray *) getIngredientsList {
	NSMutableArray *ingredientsStack = [[NSMutableArray alloc] init];
	if (_beef) {
		[ingredientsStack addObject:[NSNumber numberWithInteger:BEEF]];
	}
	if (_lettuce) {
		[ingredientsStack addObject:[NSNumber numberWithInteger:LETTUCE]];
	}
	if (_tomatoe) {
		[ingredientsStack addObject:[NSNumber numberWithInteger:TOMATOE]];
	}
	if (_sauce) {
		[ingredientsStack addObject:[NSNumber numberWithInteger:SAUCE]];
	}
	NSArray *ingredients = [ingredientsStack copy];
	return ingredients;
	
}

@end




