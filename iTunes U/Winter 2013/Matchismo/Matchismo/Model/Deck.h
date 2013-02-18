//
//  Deck.h
//  Matchismo
//
//  Created by Michael Campbell on 2/17/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;

@end
