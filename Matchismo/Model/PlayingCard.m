//
//  PlayingCard.m
//  Matchismo
//
//  Created by Antonio081014 on 3/12/13.
//  Copyright (c) 2013 Antonio081014.com. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit;

- (int)match:(NSArray *)otherCards {
    if ([otherCards count] == 1) {
        // Introspection;
        id otherCardss = [otherCards lastObject];
        if ([otherCardss isKindOfClass:[PlayingCard class]]) {
            PlayingCard *otherCard = (PlayingCard *)otherCardss ;
            if (otherCard.rank == self.rank) {
                return 4;
            } else if ([otherCard.suit isEqualToString:self.suit])
                return 1;
        }
    }
    return 0;
}

- (NSString *)contents {
    NSArray *rankStrings = [PlayingCard ranksStrings];
    return [NSString stringWithFormat:@"%@%@", rankStrings[self.rank], self.suit];
}

+ (NSArray *)validSuit {
    return @[@"♠", @"♣", @"♥", @"♦"];
}

- (void)setSuit:(NSString *)suit {
    if ([[PlayingCard validSuit] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit {
    return _suit ? _suit : @"?";
}

+ (NSArray *)ranksStrings {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank {
    return [[PlayingCard ranksStrings] count] - 1;
}

- (void)setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

- (NSString *)description {
    return [self contents];
}

@end
