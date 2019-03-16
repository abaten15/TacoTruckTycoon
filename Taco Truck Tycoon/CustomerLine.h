//
//  CustomerLine.h
//  Taco Truck Tycoon
//
//  Created by Nick Abate on 3/12/19.
//  Copyright © 2019 Nick Abate. All rights reserved.
//

#ifndef CustomerLine_h
#define CustomerLine_h

#import <Foundation/Foundation.h>
#include "Customer.h"
#include <SpriteKit/SpriteKit.h>

@interface CustomerLine : SKSpriteNode

@property (nonatomic) Customer *frontOfTheLine;
@property (nonatomic) int numCustomers;
@property (nonatomic) int maxSize;

- (void) addTo:(SKScene *)scene;
- (void) addToLine:(Customer *)customerIn;

@property (nonatomic) SKScene *myScene;
- (void) popFromLine;

@end

#endif /* CustomerLine_h */
