//
//  ClassicViewDelegate.h
//  TicTacToe
//
//  Created by eandrade21 on 10/31/13.
//  Copyright (c) 2013 PartyMan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ClassicViewDelegate <NSObject>

- (void) nextPlayerTurn:(int) boardCellSelected;

@end
