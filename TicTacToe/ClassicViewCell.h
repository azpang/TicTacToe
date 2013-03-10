//
//  ClassicViewCell.h
//  TicTacToe
//
//  Created by PartyMan on 3/5/13.
//  Copyright (c) 2013 PartyMan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassicViewCellDelegate.h"

@interface ClassicViewCell : UIView

@property (assign, nonatomic) float borderThickness;
@property (assign, nonatomic) int cellIndex;
@property (strong, nonatomic) UIColor *inkColor;
@property (assign, nonatomic) int penStrokeSize;
@property (assign, nonatomic) BOOL enable;
@property (strong, nonatomic) NSObject<ClassicViewCellDelegate> *delegate;


- (id)initWithFrame:(CGRect)frame cellIndex:(int) cellIndex;

@end
