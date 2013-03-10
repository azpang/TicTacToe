//
//  ReduxBoardViewController.h
//  TicTacToe
//
//  Created by PartyMan on 3/3/13.
//  Copyright (c) 2013 PartyMan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameboardDelegate.h"

@class ClassicView;

@interface ReduxBoardViewController : UIViewController<GameboardDelegate>

@property (strong, nonatomic) ClassicView *classicView;

- (void) nextPlayerTurn:(int) boardCellSelected;

@end
