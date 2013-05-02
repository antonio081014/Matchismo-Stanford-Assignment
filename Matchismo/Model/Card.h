//
//  Card.h
//  Matchismo
//
//  Created by Antonio081014 on 3/10/13.
//  Copyright (c) 2013 Antonio081014.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter = isFaceUp) BOOL faceUp;
@property (nonatomic, getter = isUnplayable) BOOL unplayable;

- (int)match:(NSArray *)otherCards;

@end
