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

@interface Player: SKSpriteNode

@property (nonatomic) CGPoint position;
@property (nonatomic) CGSize size;

- (void) onCreatePlayer;

@end

#endif /* Player_h */
