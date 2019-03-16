//
//  Player.m
//  Taco Truck Tycoon
//
//  Created by Nick Abate on 3/5/19.
//  Copyright © 2019 Nick Abate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "CustomerLine.h"

@implementation Player {

}

- (void) onCreatePlayer {
	self.size = CGSizeMake(100, 70);
	self.position = CGPointMake(0, 0);
	[self setSize:self.size];
	[self setPosition:self.position];
	self.speed = 12;
	
}

- (void) goTo:(CGPoint)point looking:(CGFloat)angle withAction:(PlayerAction)playerAction {
	CGFloat distanceX = self.position.x - point.x;
	CGFloat distanceY = self.position.y - point.y;
	CGFloat distance = sqrt(distanceX * distanceX + distanceY * distanceY);
	SKAction *action = [SKAction moveTo:point duration:distance/self.speed];
	SKAction *actionAtDestination = NULL;
	if (playerAction == CREATE_TACO) {
		actionAtDestination = [SKAction performSelector:@selector(createNewTaco) onTarget:self];
	} else if (playerAction == TRASH_TACO) {
		actionAtDestination = [SKAction performSelector:@selector(dumpTaco) onTarget:self];
	} else if (playerAction == ADD_BEEF) {
		actionAtDestination = [SKAction performSelector:@selector(addBeefToTaco) onTarget:self];
	} else if (playerAction == ADD_LETTUCE) {
		actionAtDestination = [SKAction performSelector:@selector(addLettuceToTaco) onTarget:self];
	} else if (playerAction == ADD_TOMATOE) {
		actionAtDestination = [SKAction performSelector:@selector(addTomatoeToTaco) onTarget:self];
	} else if (playerAction == ADD_SAUCE) {
		actionAtDestination = [SKAction performSelector:@selector(addSauceToTaco) onTarget:self];
	} else if (playerAction == SELL_TO_CUSTOMER) {
		actionAtDestination = [SKAction performSelector:@selector(sellTacoToCustomer) onTarget:self];
	}
	if (actionAtDestination != NULL) {
		SKAction *completePlayerAction = [SKAction sequence:@[action, actionAtDestination]];
		[self runAction:completePlayerAction];
	} else {
		[self runAction:action];
	}
	SKAction *turning = [SKAction rotateToAngle:angle duration:distance/self.speed];
	[self runAction:turning];
}

- (void) createNewTaco {
	if (_taco == NULL) {
		_taco = [Taco spriteNodeWithImageNamed:@"taco"];
		[_taco setPosition:CGPointMake(27, 3)];
		[_taco setSize:CGSizeMake(20, 20)];
		[_taco onCreate];
		[self addChild:_taco];
	}
}

- (Taco *) getTaco {
	return _taco;
}

- (void) dumpTaco {
	[self removeAllChildren];
	_taco = NULL;
}

- (void) addBeefToTaco {
	if (_taco != NULL) {
		[_taco addBeef];
	}
}

- (void) addLettuceToTaco {
	if (_taco != NULL) {
		[_taco addLettuce];
	}
}

- (void) addTomatoeToTaco {
	if (_taco != NULL) {
		[_taco addTomatoe];
	}
}

- (void) addSauceToTaco {
	if (_taco != NULL) {
		[_taco addSauce];
	}
}

- (void) sellTacoToCustomer {
	Customer *cust = _line.frontOfTheLine;
	if (_taco != NULL &&
		cust != NULL &&
		[cust ingredientsMatch:[_taco getIngredientsList]]) {
		[_line popFromLine];
		[self dumpTaco];
	}
}

@end

//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
///
//
//
//
//
//
//
////
////
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//






