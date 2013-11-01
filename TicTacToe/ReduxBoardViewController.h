//
//  ReduxBoardViewController.h
//  TicTacToe
//
//  Created by eandrade21 on 3/3/13.
//  Copyright (c) 2013 eandrade21. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameboardDelegate.h"
#import "ClassicViewDelegate.h"

@class ClassicView;

@interface ReduxBoardViewController : UIViewController<ClassicViewDelegate, GameboardDelegate>

@property (strong, nonatomic) ClassicView *classicView;

- (void) nextPlayerTurn:(int) boardCellSelected;

@end
