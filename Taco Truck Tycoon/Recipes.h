//
//  Recipes.h
//  Taco Truck Tycoon
//
//  Created by Nick Abate on 3/15/19.
//  Copyright © 2019 Nick Abate. All rights reserved.
//

#ifndef Recipes_h
#define Recipes_h

#include <SpriteKit/SpriteKit.h>

@interface Recipes : SKLabelNode

- (void) onCreate;

@property (nonatomic) BOOL on;
@property (nonatomic) SKSpriteNode *menu;
- (void) toggle;

@end

#endif /* Recipes_h */
