//
//  GameScene.h
//  Taco Truck Tycoon
//
//  Created by Nick Abate on 2/28/19.
//  Copyright © 2019 Nick Abate. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <GameplayKit/GameplayKit.h>

#import "Player.h"
#import "Customer.h"
#import "CustomerLine.h"

@interface GameScene : SKScene

@property (nonatomic) NSMutableArray<GKEntity *> *entities;
@property (nonatomic) NSMutableDictionary<NSString*, GKGraph *> *graphs;
@property (nonatomic) CGFloat lastUpdateTime;

@property (nonatomic) SKSpriteNode *window;

@property (nonatomic) SKSpriteNode *background;

@property (nonatomic) Player *player;

// Buttons
@property (nonatomic) SKSpriteNode *tortillaButton;
- (void) tortillaButtonClicked;
@property (nonatomic) SKSpriteNode *beefButton;
- (void) beefButtonClicked;
@property (nonatomic) SKSpriteNode *lettuceButton;
- (void) lettuceButtonClicked;
@property (nonatomic) SKSpriteNode *tomatoeButton;
- (void) tomatoeButtonClicked;
@property (nonatomic) SKSpriteNode *sauceButton;
- (void) sauceButtonClicked;
@property (nonatomic) SKSpriteNode *customerButton;
- (void) customerButtonClicked;
@property (nonatomic) SKSpriteNode *garbageButton;
- (void) garbageButtonClicked;

@property (nonatomic) CustomerLine *customerLine;
@property (nonatomic) CGFloat lastCustomerUpdate;
@property (nonatomic) CGFloat customerUpdateCooldown;
- (void) addCustomer;

@end














