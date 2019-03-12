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

#define STANDARD_TACO_ARRAY @[[NSNumber numberWithInteger:BEEF], [NSNumber numberWithInteger:LETTUCE], [NSNumber numberWithInteger:TOMATOE]]
#define EVERYTHING_TACO_ARRAY @[[NSNumber numberWithInteger:BEEF], [NSNumber numberWithInteger:LETTUCE], [NSNumber numberWithInteger:TOMATOE], [NSNumber numberWithInteger:SAUCE]]
#define MEATLOVERS_TACO_ARRAY @[[NSNumber numberWithInteger:BEEF], [NSNumber numberWithInteger:SAUCE]]
#define SAUCEY_TACO_ARRAY @[[NSNumber numberWithInteger:BEEF], [NSNumber numberWithInteger:LETTUCE], [NSNumber numberWithInteger:SAUCE]]
#define VEGGIE_TACO_ARRAY @[[NSNumber numberWithInteger:LETTUCE], [NSNumber numberWithInteger:TOMATOE], [NSNumber numberWithInteger:SAUCE]]
#define VEGAN_TACO_ARRY @[[NSNumber numberWithInteger:LETTUCE], [NSNumber numberWithInteger:TOMATOE]]

typedef enum : NSUInteger {
    STANDARD_TACO,
    EVERYTHING_TACO,
    MEATLOVERS_TACO,
    SAUCEY_TACO,
    VEGGIE_TACO,
    VEGAN_TACO,
} TacoType;

@interface Customer : SKSpriteNode

- (void) setIngredients:(NSArray *)ingredients;

@property (nonatomic) NSArray *ingredients;

- (void) onCreate;

@end

#endif /* Customer_h */
