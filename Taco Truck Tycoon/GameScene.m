//
//  GameScene.m
//  Taco Truck Tycoon
//
//  Created by Nick Abate on 2/28/19.
//  Copyright © 2019 Nick Abate. All rights reserved.
//

#import "GameScene.h"
#import "Player.h"

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
	
	_player = [Player spriteNodeWithImageNamed:@"Player"];
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
    }
    
    // Calculate time since last update
    CGFloat dt = currentTime - _lastUpdateTime;
    
    // Update entities
    for (GKEntity *entity in self.entities) {
        [entity updateWithDeltaTime:dt];
    }
	
}

// Buttons

- (void)tortillaButtonClicked {
	[_player goTo:PLAYER_GOTO_TORTILLA];
}

- (void)beefButtonClicked {
	[_player goTo:PLAYER_GOTO_BEEF];
}

- (void)lettuceButtonClicked {
	[_player goTo:PLAYER_GOTO_LETTUCE];
}

- (void)tomatoeButtonClicked {
	[_player goTo:PLAYER_GOTO_TOMATOE];
}

- (void)sauceButtonClicked {
	[_player goTo:PLAYER_GOTO_SAUCE];
}

@end









