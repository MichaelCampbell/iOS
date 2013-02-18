//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Michael Campbell on 2/17/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "Card.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@end

@implementation CardGameViewController

- (void)setFlipCount:(int)flipCount
{
	_flipCount = flipCount;
	self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
	NSLog(@"flips updated to %d", self.flipCount);
}

- (IBAction)flipCard:(UIButton *)sender
{
	Card *card = nil;
	card = [self.deck drawRandomCard];
	NSLog(@"%@", card);
	[sender setTitle:[NSString stringWithFormat:@"%@", (card.contents ? card.contents : @"fail")] forState:UIControlStateSelected];
	sender.selected = !sender.isSelected;
	self.flipCount++;
}

@end
