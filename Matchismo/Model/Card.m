//
//  Card.m
//  Matchismo
//
//  Created by Antonio081014 on 3/10/13.
//  Copyright (c) 2013 Antonio081014.com. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards
{
    for (Card *card in otherCards) {
        if ([self.contents isEqualToString:card.contents]) {
            return 1;
        }
    }
    return 0;
}

@end
