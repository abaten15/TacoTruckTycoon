//
//  Player.h
//  Taco Truck Tycoon
//
//  Created by Nick Abate on 3/5/19.
//  Copyright © 2019 Nick Abate. All rights reserved.
//

#ifndef Player_h
#define Player_h

#import <SpriteKit/SpriteKit.h>
#import <GameplayKit/GameplayKit.h>

#define PLAYER_GOTO_LETTUCE CGPointMake(45, -15)

@interface Player: SKSpriteNode

@property (nonatomic) CGPoint playerPosition;
@property (nonatomic) CGSize playerSize;

- (void) onCreatePlayer;

@property (nonatomic) CGFloat playerSpeed;

- (void) goTo:(CGPoint)point;

@end

#endif /* Player_h */
