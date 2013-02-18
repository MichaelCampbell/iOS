//
//  PlayingCard.m
//  Matchismo
//
//  Created by Michael Campbell on 2/17/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSString *)contents
{
	NSArray *rankStrings = [PlayingCard rankStrings];
	return [rankStrings[self.rank] stringByAppendingString:self.suit];
}


@synthesize suit = _suit; // because we provide setter AND getter

+ (NSArray *)validSuits
{
	static NSArray *validSuits = nil;
	if (!validSuits) validSuits = @[@"♥", @"♦", @"♠", @"♣"];
	return validSuits;
}

- (void)setSuit:(NSString *)suit
{
	if ([[PlayingCard validSuits] containsObject:suit]) {
		_suit = suit;
	}
}

- (NSString *)suit
{
	return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings
{
	static NSArray *validStrings = nil;
	if (!validStrings) validStrings = @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
	return validStrings;
}

+ (NSUInteger)maxRank
{
	return [self rankStrings].count - 1;
}

- (void)setRank:(NSUInteger)rank
{
	if (rank <= [PlayingCard maxRank]) {
		_rank = rank;
	}
}
@end