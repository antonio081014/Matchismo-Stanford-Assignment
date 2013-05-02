//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Antonio081014 on 3/13/13.
//  Copyright (c) 2013 Antonio081014.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

@property (nonatomic) BOOL in2CardMode;
@property (readonly, nonatomic) int score;

- (id)initWithCardCount:(NSUInteger)count
              usingDeck:(Deck *)deck
            in2CardMode:(BOOL) mode;

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@end
