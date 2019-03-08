//
//  Customer.h
//  Taco Truck Tycoon
//
//  Created by Nick Abate on 3/7/19.
//  Copyright © 2019 Nick Abate. All rights reserved.
//

#ifndef Customer_h
#define Customer_h

#import <SpriteKit/SpriteKit.h>

typedef enum : NSUInteger {
	BEEF,
    LETTUCE,
    TOMATOE,
    SAUCE,
} Ingredients;

#define STANDARD_TACO @[[NSNumber numberWithInteger:BEEF], [NSNumber numberWithInteger:LETTUCE], [NSNumber numberWithInteger:TOMATOE]]
#define EVERYTHING_TACO @[[NSNumber numberWithInteger:BEEF], [NSNumber numberWithInteger:LETTUCE], [NSNumber numberWithInteger:TOMATOE], [NSNumber numberWithInteger:SAUCE]]
#define MEATLOVERS_TACO @[[NSNumber numberWithInteger:BEEF], [NSNumber numberWithInteger:SAUCE]]
#define SAUCEY_TACO @[[NSNumber numberWithInteger:BEEF], [NSNumber numberWithInteger:LETTUCE], [NSNumber numberWithInteger:SAUCE]]
#define VEGGIE_TACO @[[NSNumber numberWithInteger:LETTUCE], [NSNumber numberWithInteger:TOMATOE], [NSNumber numberWithInteger:SAUCE]]
#define VEGAN_TACO @[[NSNumber numberWithInteger:LETTUCE], [NSNumber numberWithInteger:TOMATOE]]

@interface Customer : SKSpriteNode

- (void) setIngredients:(NSArray *)ingredients;

@property (nonatomic) NSArray *ingredients;

- (void) onCreate;

@end

#endif /* Customer_h */
