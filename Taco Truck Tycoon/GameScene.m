//
//  GameScene.m
//  Taco Truck Tycoon
//
//  Created by Nick Abate on 2/28/19.
//  Copyright © 2019 Nick Abate. All rights reserved.
//

#import "GameScene.h"
#import "Player.h"
#import "Customer.h"

@implementation GameScene {

}

- (void)sceneDidLoad {
    // Setup your scene here
    int width = self.size.width;
	int height = self.size.height;
	
	self.window = [SKSpriteNode spriteNodeWithTexture:NULL size:CGSizeMake(1000, 1000)];
	[self.window setPosition:CGPointMake(0, 0)];
	[self addChild:self.window];
	
	_background = [SKSpriteNode spriteNodeWithImageNamed:@"Background"];
	[_background setPosition:CGPointMake(0, 0)];
	[_background setSize:CGSizeMake(width, 425)];
	[self addChild:_background];
	
	_player = [Player spriteNodeWithImageNamed:@"TacoTruckWorker"];
	[_player onCreatePlayer];
	[self addChild:_player];
	
	_tortillaButton = [SKSpriteNode spriteNodeWithColor:[UIColor colorWithWhite:1 alpha:0.0] size:CGSizeMake(180, 80)];
	[_tortillaButton setPosition:CGPointMake(-253, -140)];
	[self addChild:_tortillaButton];
	
	_beefButton = [SKSpriteNode spriteNodeWithColor:[UIColor colorWithWhite:1 alpha:0.0] size:CGSizeMake(120, 80)];
	[_beefButton setPosition:CGPointMake(-90, -140)];
	[self addChild:_beefButton];
	
	_lettuceButton = [SKSpriteNode spriteNodeWithColor:[UIColor colorWithWhite:1 alpha:0.0] size:CGSizeMake(100, 80)];
	[_lettuceButton setPosition:CGPointMake(45, -140)];
	[self addChild:_lettuceButton];
	
	_tomatoeButton = [SKSpriteNode spriteNodeWithColor:[UIColor colorWithWhite:1 alpha:0.0] size:CGSizeMake(100, 80)];
	[_tomatoeButton setPosition:CGPointMake(185, -140)];
	[self addChild:_tomatoeButton];
	
	_sauceButton = [SKSpriteNode spriteNodeWithColor:[UIColor colorWithWhite:1 alpha:0.0] size:CGSizeMake(50, 80)];
	[_sauceButton setPosition:CGPointMake(292, -140)];
	[self addChild:_sauceButton];
	
	_customerButton = [SKSpriteNode spriteNodeWithColor:[UIColor colorWithWhite:1 alpha:0.0] size:CGSizeMake(140, 120)];
	[_customerButton setPosition:CGPointMake(-18, 124)];
	[self addChild:_customerButton];
	
	_garbageButton = [SKSpriteNode spriteNodeWithColor:[UIColor colorWithWhite:1.0 alpha:0.0] size:CGSizeMake(40, 40)];
	[_garbageButton setPosition:CGPointMake(-335, 35)];
	[self addChild:_garbageButton];
	
	// Customers
	_customerUpdateCooldown = 5.0;
	_customerLine = [[CustomerLine alloc] init];
	[_customerLine setMaxSize:3];
	[_customerLine setNumCustomers:0];
	[_customerLine setFrontOfTheLine:NULL];
	[_customerLine addTo:self];
	_player.line = _customerLine;
	
	_recipes = [Recipes labelNodeWithText:@"Recipes"];
	[_recipes onCreate];
	[self addChild:_recipes];
	
}


- (void)touchDownAtPoint:(CGPoint)pos {

}
- (void)touchMovedToPoint:(CGPoint)pos {

}

- (void)touchUpAtPoint:(CGPoint)pos {

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	CGPoint point = [touch locationInNode:self.window];
	if ([_tortillaButton containsPoint:point]) {
		[self tortillaButtonClicked];
	} else if ([_beefButton containsPoint:point]) {
		[self beefButtonClicked];
	} else if ([_lettuceButton containsPoint:point]) {
		[self lettuceButtonClicked];
	} else if ([_tomatoeButton containsPoint:point]) {
		[self tomatoeButtonClicked];
	} else if ([_sauceButton containsPoint:point]) {
		[self sauceButtonClicked];
	} else if ([_customerButton containsPoint:point]) {
		[self customerButtonClicked];
	} else if ([_garbageButton containsPoint:point]) {
		[self garbageButtonClicked];
	} else if ([_recipes containsPoint:point]) {
		[_recipes toggle];
	}
	
	NSLog(@"x: %d, y: %d\n", (int)point.x, (int)point.y);
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{

}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {

}


-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
    
    // Initialize _lastUpdateTime if it has not already been
    if (_lastUpdateTime == 0) {
        _lastUpdateTime = currentTime;
        _lastCustomerUpdate = currentTime;
    }
    
    // Calculate time since last update
    CGFloat dt = currentTime - _lastUpdateTime;
    
    // Update entities
    for (GKEntity *entity in self.entities) {
        [entity updateWithDeltaTime:dt];
    }
	
    if (currentTime - _lastCustomerUpdate >= _customerUpdateCooldown) {
    	[self addCustomer];
    	_lastCustomerUpdate = currentTime;
	}
	
}

// Buttons

- (void)tortillaButtonClicked {
	[_player goTo:PLAYER_GOTO_TORTILLA looking:PLAYER_DOWN withAction:CREATE_TACO];
}

- (void)beefButtonClicked {
	[_player goTo:PLAYER_GOTO_BEEF looking:PLAYER_DOWN withAction:ADD_BEEF];
}

- (void)lettuceButtonClicked {
	[_player goTo:PLAYER_GOTO_LETTUCE looking:PLAYER_DOWN withAction:ADD_LETTUCE];
}

- (void)tomatoeButtonClicked {
	[_player goTo:PLAYER_GOTO_TOMATOE looking:PLAYER_DOWN withAction:ADD_TOMATOE];
}

- (void)sauceButtonClicked {
	[_player goTo:PLAYER_GOTO_SAUCE looking:PLAYER_DOWN withAction:ADD_SAUCE];
}

- (void) customerButtonClicked {
	[_player goTo:PLAYER_GOTO_CUSTOMER looking:PLAYER_UP withAction:SELL_TO_CUSTOMER];
}

- (void) garbageButtonClicked {
	[_player goTo:PLAYER_GOTO_GARBAGE looking:PLAYER_LEFT withAction:TRASH_TACO];
}

// Customers
- (void) addCustomer {

	int customerImage = arc4random_uniform(3);
	Customer *newCustomer;
	if (customerImage >= 0) {
		newCustomer = [Customer spriteNodeWithImageNamed:@"Customer"];
	}
	int tacoOrder = arc4random_uniform(6);
	if (tacoOrder == 0) {
		[newCustomer setIngredients:STANDARD_TACO_ARRAY withText:@"Standard"];
	} else if (tacoOrder == 1) {
		[newCustomer setIngredients:EVERYTHING_TACO_ARRAY withText:@"Everything"];
	} else if (tacoOrder == 2) {
		[newCustomer setIngredients:MEATLOVERS_TACO_ARRAY withText:@"Meatlovers"];
	} else if (tacoOrder == 3) {
		[newCustomer setIngredients:SAUCEY_TACO_ARRAY withText:@"Saucey"];
	} else if (tacoOrder == 4) {
		[newCustomer setIngredients:VEGGIE_TACO_ARRAY withText:@"Veggie"];
	} else if (tacoOrder == 5) {
		[newCustomer setIngredients:VEGAN_TACO_ARRAY withText:@"Vegan"];
	}
	[_customerLine addToLine:newCustomer];
	
}

@end









