//
//  Gameboard.h
//  TicTacToe
//
//  Created by PartyMan on 2/24/13.
//  Copyright (c) 2013 PartyMan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GameboardDelegate;

@interface Gameboard : NSObject

@property (strong, nonatomic) NSObject<GameboardDelegate> *delegate;

-(void) playerDidMove:(int) boardIndex;

@end
