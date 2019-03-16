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

#define NUMBER_OF_TACO_TYPES 6
#define STANDARD_TACO_ARRAY @[[NSNumber numberWithInteger:BEEF], [NSNumber numberWithInteger:LETTUCE], [NSNumber numberWithInteger:TOMATOE]]
#define EVERYTHING_TACO_ARRAY @[[NSNumber numberWithInteger:BEEF], [NSNumber numberWithInteger:LETTUCE], [NSNumber numberWithInteger:TOMATOE], [NSNumber numberWithInteger:SAUCE]]
#define MEATLOVERS_TACO_ARRAY @[[NSNumber numberWithInteger:BEEF], [NSNumber numberWithInteger:SAUCE]]
#define SAUCEY_TACO_ARRAY @[[NSNumber numberWithInteger:BEEF], [NSNumber numberWithInteger:LETTUCE], [NSNumber numberWithInteger:SAUCE]]
#define VEGGIE_TACO_ARRAY @[[NSNumber numberWithInteger:LETTUCE], [NSNumber numberWithInteger:TOMATOE], [NSNumber numberWithInteger:SAUCE]]
#define VEGAN_TACO_ARRAY @[[NSNumber numberWithInteger:LETTUCE], [NSNumber numberWithInteger:TOMATOE]]

typedef enum : NSUInteger {
    STANDARD_TACO,
    EVERYTHING_TACO,
    MEATLOVERS_TACO,
    SAUCEY_TACO,
    VEGGIE_TACO,
    VEGAN_TACO,
} TacoType;

#define ORDERING_LOCATION CGPointMake(-17, 111)
#define CUSTOMER_SPEED 40

@interface Customer : SKSpriteNode

@property (nonatomic) NSArray *ingredients;
- (void) setIngredients:(NSArray *)ingredients withText:(NSString *)text;
- (BOOL) ingredientsMatch:(NSArray *)ingredientsIn;

- (void) onCreate:(CGPoint) goTo;
- (void) moveDown:(CGPoint) location;

@property (nonatomic) Customer *nextInLine;

@end

#endif /* Customer_h */
