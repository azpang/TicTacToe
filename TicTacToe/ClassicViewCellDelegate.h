//
//  ClassicViewCellDelegate.h
//  TicTacToe
//
//  Created by eandrade21 on 3/9/13.
//  Copyright (c) 2013 eandrade21. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ClassicViewCell;

@protocol ClassicViewCellDelegate <NSObject>

- (void) boardCellSelected:(ClassicViewCell *) boardCell;

@end
