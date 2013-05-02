//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Antonio081014 on 3/10/13.
//  Copyright (c) 2013 Antonio081014.com. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController () 
@property (weak, nonatomic) IBOutlet UILabel *lastCardLabel;
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic) NSUInteger count;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *flipButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UISegmentedControl *in2CardMode;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game {
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.flipButtons count] usingDeck:[[PlayingCardDeck alloc] init] in2CardMode: 0 == [self.in2CardMode selectedSegmentIndex]];
        [self.in2CardMode setEnabled:YES];
    }
    return _game;
}

- (void)reset {
    self.game = [[CardMatchingGame alloc] initWithCardCount:[self.flipButtons count] usingDeck:[[PlayingCardDeck alloc] init] in2CardMode: NO];//0 == [self.in2CardMode selectedSegmentIndex]];
    self.count = 0;
    [self updateUI];
    self.lastCardLabel.text = [NSString stringWithFormat:@"No Last Fplipped Card."];
    [self.in2CardMode setEnabled:YES];
}

- (IBAction)deal {
    [self reset];
}

#define spacing 4

- (void)updateUI {
    UIImage *cardBackImage = [UIImage imageNamed:@"cardback.png"];
    for (UIButton *button in self.flipButtons) {
        Card *card = [self.game cardAtIndex:[self.flipButtons indexOfObject:button]];
//        NSLog(@"%@", card.contents);
        if (card.isFaceUp) {
            [button setImage:nil forState:UIControlStateNormal];
        } else {
            [button setImage:cardBackImage forState:UIControlStateNormal];
            button.imageEdgeInsets = UIEdgeInsetsMake(spacing, spacing, spacing, spacing);
        }
//        [button setImage:nil forState:UIControlStateSelected];
//        [button setImage:nil forState:UIControlStateSelected | UIControlStateDisabled];
        [button setTitle:card.contents forState:UIControlStateSelected];
        [button setTitle:card.contents forState:UIControlStateSelected | UIControlStateDisabled];
        button.selected = card.isFaceUp;
        button.enabled = !card.isUnplayable;
        button.alpha = button.enabled ? 1.0 : 0.5;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

- (void)setFlipButtons:(NSArray *)flipButtons {
    _flipButtons = flipButtons;
    
    [self updateUI];
}

- (void) setCount:(NSUInteger)count{
    _count = count;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flip Count: %d", self.count];
}

- (IBAction)cardFlip:(UIButton *)sender {
    [self.in2CardMode setEnabled:NO];
    self.count ++;
    [self.game flipCardAtIndex:[self.flipButtons indexOfObject:sender]];
    self.lastCardLabel.text = [NSString stringWithFormat:@"Last Flip Card: %@", [self.game cardAtIndex:[self.flipButtons indexOfObject:sender]].contents];
    [self updateUI];
}
@end
