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

#import "Taco.h"
#import "CustomerLine.h"

#define PLAYER_GOTO_TORTILLA CGPointMake(-253, -15)
#define PLAYER_GOTO_BEEF CGPointMake(-90, -15)
#define PLAYER_GOTO_LETTUCE CGPointMake(45, -15)
#define PLAYER_GOTO_TOMATOE CGPointMake(185, -15)
#define PLAYER_GOTO_SAUCE CGPointMake(292, -15)
#define PLAYER_GOTO_CUSTOMER CGPointMake(-18, 15)
#define PLAYER_GOTO_GARBAGE CGPointMake(-295, 15)

#define PLAYER_LEFT M_PI_2
#define PLAYER_DOWN M_PI
#define PLAYER_RIGHT 3 * M_PI_2
#define PLAYER_UP 0

typedef enum : NSUInteger {
    CREATE_TACO,
    ADD_BEEF,
    ADD_LETTUCE,
    ADD_TOMATOE,
    ADD_SAUCE,
    SELL_TO_CUSTOMER,
    TRASH_TACO,
} PlayerAction;

@interface Player: SKSpriteNode

@property (nonatomic) CGPoint playerPosition;
@property (nonatomic) CGSize playerSize;

- (void) onCreatePlayer;

@property (nonatomic) CGFloat playerSpeed;

@property (nonatomic) BOOL moving;
- (void) goTo:(CGPoint)point looking:(CGFloat) angle withAction:(PlayerAction) playerAction;

@property (nonatomic) Taco *taco;
- (void) createNewTaco;
- (Taco *) getTaco;
- (void) dumpTaco;

- (void) addBeefToTaco;
- (void) addLettuceToTaco;
- (void) addTomatoeToTaco;
- (void) addSauceToTaco;

@property (nonatomic) CustomerLine *line;
- (void) sellTacoToCustomer;

@end

#endif /* Player_h */
