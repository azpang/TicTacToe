//
//  BoardViewController.h
//  TicTacToe
//
//  Created by eandrade21 on 2/16/13.
//  Copyright (c) 2013 eandrade21. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameboardDelegate.h"

@class BoardStatusView;

@interface BoardViewController : UIViewController <GameboardDelegate>

@property (strong, nonatomic) BoardStatusView *statusBar;

@end
