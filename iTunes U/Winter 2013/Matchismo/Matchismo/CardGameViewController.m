//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Michael Campbell on 2/17/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) Deck *deck;
@end

@implementation CardGameViewController

@synthesize deck = _deck;

- (Deck *)deck
{
	if (!_deck) _deck = [[PlayingCardDeck alloc] init];
	return _deck;
}

- (void)setCardButtons:(NSArray *)cardButtons
{
	_cardButtons = cardButtons;
	for (UIButton *cardButton in cardButtons) {
		Card *card = [self.deck drawRandomCard];
		[cardButton setTitle:card.contents forState:UIControlStateSelected];
	}
}

- (void)setFlipCount:(int)flipCount
{
	_flipCount = flipCount;
	self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)flipCard:(UIButton *)sender
{
	sender.selected = !sender.isSelected;
	self.flipCount++;
}

@end
