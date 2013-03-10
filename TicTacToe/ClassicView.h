//
//  ClassicView.h
//  TicTacToe
//
//  Created by PartyMan on 3/5/13.
//  Copyright (c) 2013 PartyMan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassicViewCellDelegate.h"

@class ReduxBoardStatusView;
@class ReduxBoardViewController;

@interface ClassicView : UIView<ClassicViewCellDelegate>

@property (strong, nonatomic) ReduxBoardStatusView *reduxStatusBar;
@property (strong, nonatomic) UIButton *nextButton;
@property (strong, nonatomic) ReduxBoardViewController *delegate;

- (id)initWithFrame:(CGRect)frame;
- (int) getSelectedCell;

@end
