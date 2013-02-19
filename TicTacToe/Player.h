//
//  Player.h
//  TicTacToe
//
//  Created by PartyMan on 2/15/13.
//  Copyright (c) 2013 PartyMan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) UIImage *character;
@property (strong, nonatomic) UIImage *symbol;
@property (strong, nonatomic) NSMutableArray *moves;

- (BOOL) isPlayerDefined;
- (void) playerDidMove:(int) boardPosition;
- (void) clearMoves;
- (BOOL) didPlayerWin;

@end
