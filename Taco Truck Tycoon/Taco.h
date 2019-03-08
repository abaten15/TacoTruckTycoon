//
//  Taco.h
//  Taco Truck Tycoon
//
//  Created by Nick Abate on 3/7/19.
//  Copyright © 2019 Nick Abate. All rights reserved.
//

#ifndef Taco_h
#define Taco_h

#import <SpriteKit/SpriteKit.h>

@interface Taco : SKSpriteNode

@property (nonatomic) BOOL tortilla;
@property (nonatomic) BOOL beef;
@property (nonatomic) SKSpriteNode *beefNode;
@property (nonatomic) BOOL lettuce;
@property (nonatomic) SKSpriteNode *lettuceNode;
@property (nonatomic) BOOL tomatoe;
@property (nonatomic) SKSpriteNode *tomatoeNode;
@property (nonatomic) BOOL sauce;
@property (nonatomic) SKSpriteNode *sauceNode;

- (void) addBeef;
- (void) addLettuce;
- (void) addTomatoe;
- (void) addSauce;

- (void) onCreate;

- (NSArray *) getIngredientsList;

@end

#endif /* Taco_h */
