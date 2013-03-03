//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Michael Campbell on 2/19/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import "CardMatchingGame.h"

#define FLIP_COST 1
#define MISMATCH_PENALTY 2
#define MATCH_BONUS 4

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards; //of Card
@property (nonatomic, readwrite) int score;
@property (nonatomic, readwrite) NSString *actionText;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
	if (!_cards) _cards = [[NSMutableArray alloc] init];
	return _cards;
}

- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
	self = [super init];
	
	if (self) {
		for (int i = 0; i < count; i++) {
			Card *card = [deck drawRandomCard];
			if (!card) {
				self = nil;
			} else {
				self.cards[i] = card;
			}
		}
	}
	
	return self;
}

- (id)resetGame:(NSUInteger)cardCount
		usingDeck:(Deck *)deck
{
	self.score = 0;
	self.actionText = nil;
	return [self initWithCardCount:cardCount usingDeck:deck];
}

- (Card *)cardAtIndex:(NSUInteger)index
{
	return (index < [self.cards count]) ? self.cards[index] : nil;
}

- (void)flipCardAtIndex:(NSUInteger)index
			 difficulty:(BOOL)hard
{
	Card *card = [self cardAtIndex:index];
	
	if (!card.isUnplayable) {
		self.actionText = [NSString stringWithFormat:@"Flipped up %@", card.contents];

		if (!card.isFaceUp) {
			for (Card *thirdCard in self.cards) {
				for (Card *secondCard in self.cards) {
					if (secondCard.isFaceUp && !secondCard.isUnplayable) {
						int matchScore = [card match:@[secondCard]];
						if (matchScore) {
							if (!hard) {
								secondCard.unplayable = YES;
								card.unplayable = YES;
								self.score += matchScore * MATCH_BONUS;
								self.actionText = [NSString stringWithFormat:@"Matched %@ & %@ for %d points", card.contents, secondCard.contents, MATCH_BONUS];
							} else {
								self.actionText = [NSString stringWithFormat:@"Matched %@ & %@", card.contents, secondCard.contents];
								if (thirdCard.isFaceUp && !thirdCard.isUnplayable && secondCard != thirdCard && card != thirdCard && card != secondCard) {
									int hardMatchScore = [card match:@[secondCard, thirdCard]];
									if (hardMatchScore == 3 || hardMatchScore == 12) {
										thirdCard.unplayable = YES;
										secondCard.unplayable = YES;
										card.unplayable = YES;
										self.score += hardMatchScore * MATCH_BONUS;
										self.actionText = [NSString stringWithFormat:@"Matched %@ & %@ & %@ for %d points", card.contents, secondCard.contents, thirdCard.contents, hardMatchScore * MATCH_BONUS];
									} else {
										thirdCard.faceUp = NO;
										secondCard.faceUp = NO;
										self.score -=MISMATCH_PENALTY;
										self.actionText = [NSString stringWithFormat:@"%@ & %@ & %@ don’t match! %d point penalty!", card.contents, secondCard.contents, thirdCard.contents, MISMATCH_PENALTY];
									}
								}
							}
						} else {
							secondCard.faceUp = NO;
							self.score -= MISMATCH_PENALTY;
							self.actionText = [NSString stringWithFormat:@"%@ & %@ don’t match! %d point penalty!", card.contents, secondCard.contents, MISMATCH_PENALTY];
						}
						break;
					}
				}
			}
            self.score -=FLIP_COST;
		}
		card.faceUp = !card.isFaceUp;
	}
}
@end
