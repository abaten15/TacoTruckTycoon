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

@interface GameScene : SKScene

@property (nonatomic) NSMutableArray<GKEntity *> *entities;
@property (nonatomic) NSMutableDictionary<NSString*, GKGraph *> *graphs;
@property (nonatomic) CGFloat lastUpdateTime;

@property (nonatomic) SKSpriteNode *window;

@property (nonatomic) SKSpriteNode *background;

@property (nonatomic) Player *player;

// Buttons
@property (nonatomic) SKSpriteNode *lettuceButton;
- (void) lettuceButtonClicked;

@end
