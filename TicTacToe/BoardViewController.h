//
//  BoardViewController.h
//  TicTacToe
//
//  Created by PartyMan on 2/16/13.
//  Copyright (c) 2013 PartyMan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BoardStatusView;

@interface BoardViewController : UIViewController

@property (strong, nonatomic) NSArray* players;
@property (strong, nonatomic) BoardStatusView *statusBar;

@end
