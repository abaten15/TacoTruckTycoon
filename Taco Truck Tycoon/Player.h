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

#define PLAYER_GOTO_TORTILLA CGPointMake(-253, -15)
#define PLAYER_GOTO_BEEF CGPointMake(-90, -15)
#define PLAYER_GOTO_LETTUCE CGPointMake(45, -15)
#define PLAYER_GOTO_TOMATOE CGPointMake(185, -15)
#define PLAYER_GOTO_SAUCE CGPointMake(292, -15)

@interface Player: SKSpriteNode

@property (nonatomic) CGPoint playerPosition;
@property (nonatomic) CGSize playerSize;

- (void) onCreatePlayer;

@property (nonatomic) CGFloat playerSpeed;

- (void) goTo:(CGPoint)point;

@end

#endif /* Player_h */
