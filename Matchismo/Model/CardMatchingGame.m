//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Antonio081014 on 3/13/13.
//  Copyright (c) 2013 Antonio081014.com. All rights reserved.
//

#import "CardMatchingGame.h"
#import "PlayingCard.h"

@interface CardMatchingGame()

@property (readwrite, nonatomic) int score;
@property (strong, nonatomic) NSMutableArray *cards;    // of cards;

@end

@implementation CardMatchingGame

+ (id) init {
    [super init];
    return nil;
}

- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck in2CardMode:(BOOL) mode {
    self = [super init];
    if (self) {
        self.in2CardMode = mode;
        for (int i=0; i<count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                self.cards[i] = card;
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

#define MISMATCH_PENALTY -2
#define MATCH_BONUS 4
#define FLIP_COST -1

- (void)flipCardAtIndex:(NSUInteger)index {
    NSLog(@"%d", self.in2CardMode);
    Card *card = [self cardAtIndex:index];
    if (card.isUnplayable == NO) {
        if (!card.isFaceUp) {
            for (PlayingCard *otherCard in self.cards) {
                if (!otherCard.isUnplayable && otherCard.isFaceUp) {
                    int matchScore = [otherCard match:@[card]];
                    if (matchScore > 0) {
                        NSLog(@"%@ : %@", card.contents, otherCard.contents);
                        if (!self.in2CardMode) {
                            for (PlayingCard *thirdCard in self.cards) {
                                if (!thirdCard.isUnplayable && thirdCard.isFaceUp && ![otherCard.contents isEqualToString:thirdCard.contents]) {
                                    NSLog(@"%@ : %@ : %@", card.contents, otherCard.contents, thirdCard.contents);
                                    int matchScore2 = [thirdCard match:@[card]];
                                    if (matchScore == matchScore2) {
                                        thirdCard.unplayable = YES;
                                        otherCard.unplayable = YES;
                                        card.unplayable = YES;
                                        self.score += matchScore2 * MATCH_BONUS * MATCH_BONUS;
                                    } else {
                                        self.score += MISMATCH_PENALTY;
                                        thirdCard.faceUp = NO;
//                                        otherCard.faceUp = NO;
                                    }
                                    break;
                                }
                            }
                        } else {
                            otherCard.unplayable = YES;
                            card.unplayable = YES;
                            self.score += matchScore * MATCH_BONUS;
                        }
                    } else {
                        if (!self.in2CardMode) {
                            for (PlayingCard *thirdCard in self.cards) {
                                if (!thirdCard.isUnplayable && thirdCard.isFaceUp && ![otherCard.contents isEqualToString:thirdCard.contents]) {
                                    int matchScore2 = [thirdCard match:@[otherCard]];
                                    if (matchScore2 > 0) {
                                        thirdCard.unplayable = YES;
                                        otherCard.unplayable = YES;
                                        self.score += matchScore2 * MATCH_BONUS;
                                    } else {
                                        thirdCard.faceUp = NO;
                                        otherCard.faceUp = NO;
                                    }
                                    break;
                                }
                            }
                        } else {
                            otherCard.faceUp = NO;
                            self.score += MISMATCH_PENALTY;
                        }
                    }
                    break;
                }
            }
            self.score += FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
    }
}

- (Card *)cardAtIndex:(NSUInteger)index {
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

@end
