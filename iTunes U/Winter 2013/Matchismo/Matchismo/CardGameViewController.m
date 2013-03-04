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
@property (weak, nonatomic) IBOutlet UISlider *historySlider;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) NSMutableArray *actionHistory;
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

- (NSMutableArray *)actionHistory
{
	if (!_actionHistory) _actionHistory = [[NSMutableArray alloc] init];
		
	return _actionHistory;
}

- (IBAction)difficultyControl:(UISegmentedControl *)sender
{
	[self.difficultySegmentedControl setSelectedSegmentIndex:sender.selectedSegmentIndex];
}

- (IBAction)actionHistorySlider:(UISlider *)sender
{
	if ((int)sender.value == [self.actionHistory count] -1) {
		self.actionLabel.alpha = 1.0;
	} else
		self.actionLabel.alpha = 0.3;
	
	self.actionLabel.text = [self.actionHistory objectAtIndex:(int)sender.value];
}

- (void)setCardButtons:(NSArray *)cardButtons
{
	_cardButtons = cardButtons;
    [self updateUI];
}
- (IBAction)newDeal:(UIButton *)sender

{
	self.game = nil;
	[self.difficultySegmentedControl setEnabled:YES];
	self.actionHistory = nil;
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
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
	[self updateUISlider];
}

- (void)updateUISlider
{
	[self.actionHistory addObject:[NSString stringWithFormat:@"%@", self.game.actionText]];
	[self.historySlider setMinimumValue:1];
	[self.historySlider setMaximumValue:[self.actionHistory count] -1];
	[self.historySlider setValue:[self.actionHistory count]-1 animated:YES];
	if (self.game.score) {
		self.actionLabel.text = [self.actionHistory objectAtIndex:self.historySlider.value];
	} else {
		self.actionLabel.text = @"";
	}
	NSLog(@"value = %@", [self.actionHistory lastObject]);
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
