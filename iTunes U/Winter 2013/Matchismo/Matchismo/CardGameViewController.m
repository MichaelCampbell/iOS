//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Michael Campbell on 2/17/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *actionLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UISegmentedControl *difficultySegmentedControl;
@property (strong, nonatomic) CardMatchingGame *game;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                                          usingDeck:[[PlayingCardDeck alloc] init]];
    return _game;
}

- (IBAction)difficultyControl:(UISegmentedControl *)sender
{
	[self.difficultySegmentedControl setSelectedSegmentIndex:sender.selectedSegmentIndex];
}

- (void)setCardButtons:(NSArray *)cardButtons
{
	_cardButtons = cardButtons;
    [self updateUI];
}
- (IBAction)newDeal:(UIButton *)sender

{
	[self.game resetGame:self.cardButtons.count usingDeck:[[PlayingCardDeck alloc] init]];
	[self.difficultySegmentedControl setEnabled:YES];
	self.flipCount = 0;
	[self updateUI];
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected | UIControlStateDisabled];        
        cardButton.selected = card.isFaceUp;
		if (!card.isFaceUp) {
			[cardButton setTitle:nil forState:UIControlStateNormal];
			[cardButton setBackgroundImage:[UIImage imageNamed:@"PlayingCard.jpg"] forState:UIControlStateNormal];
			[cardButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
		}else {
			[cardButton setBackgroundImage:nil forState:UIControlStateNormal];
		}
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
    }
    self.actionLabel.text = self.game.actionText;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

- (void)setFlipCount:(int)flipCount
{
	_flipCount = flipCount;
	self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)flipCard:(UIButton *)sender
{
	[self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender] difficulty:[self.difficultySegmentedControl selectedSegmentIndex]];
	[self.difficultySegmentedControl setEnabled:NO];
    self.flipCount++;
    [self updateUI];
}

@end
