//
//  PlayingCard.h
//  Matchismo
//
//  Created by Antonio081014 on 3/12/13.
//  Copyright (c) 2013 Antonio081014.com. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;
@property (nonatomic, strong) UIImage *faceImage;

+ (NSArray *)validSuit;
+ (NSArray *)ranksStrings;
+ (NSUInteger)maxRank;

@end
