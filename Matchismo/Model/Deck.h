//
//  Deck.h
//  Matchismo
//
//  Created by Antonio081014 on 3/10/13.
//  Copyright (c) 2013 Antonio081014.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard: (Card *)card atTop:(BOOL)atTop;
- (Card *)drawRandomCard;

@end
