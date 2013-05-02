//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Antonio081014 on 3/12/13.
//  Copyright (c) 2013 Antonio081014.com. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (id) init {
    self = [super init];
    
    if (self) {
        for (NSString *suit in [PlayingCard validSuit]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.suit = suit;
                card.rank = rank;
                [self addCard:card atTop:YES];
            }
        }
    }
    return self;
}

@end
