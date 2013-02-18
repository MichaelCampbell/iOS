//
//  PlayingCard.h
//  Matchismo
//
//  Created by Michael Campbell on 2/17/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
