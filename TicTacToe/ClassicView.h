//
//  ClassicView.h
//  TicTacToe
//
//  Created by eandrade21 on 3/5/13.
//  Copyright (c) 2013 eandrade21. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassicViewCellDelegate.h"
#import "ClassicViewDelegate.h"

@class ReduxBoardStatusView;
@class ReduxBoardViewController;

@interface ClassicView : UIView<ClassicViewCellDelegate>

@property (strong, nonatomic) ReduxBoardStatusView *reduxStatusBar;
@property (strong, nonatomic) UIButton *nextButton;
@property (strong, nonatomic) id<ClassicViewDelegate> delegate;

- (id)initWithFrame:(CGRect)frame;

@end
