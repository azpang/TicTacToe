//
//  ClassicViewCell.h
//  TicTacToe
//
//  Created by eandrade21 on 3/5/13.
//  Copyright (c) 2013 eandrade21. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassicViewCellDelegate.h"

@interface ClassicViewCell : UIView

@property (assign, nonatomic) float borderThickness;
@property (assign, nonatomic) int cellIndex;
@property (strong, nonatomic) UIColor *inkColor;
@property (assign, nonatomic) int penStrokeSize;
@property (assign, nonatomic) BOOL enable;
@property (strong, nonatomic) id<ClassicViewCellDelegate> delegate;


- (id)initWithFrame:(CGRect)frame cellIndex:(int) cellIndex;

@end
