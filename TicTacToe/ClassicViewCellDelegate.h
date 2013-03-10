//
//  ClassicViewCellDelegate.h
//  TicTacToe
//
//  Created by PartyMan on 3/9/13.
//  Copyright (c) 2013 PartyMan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ClassicViewCell;

@protocol ClassicViewCellDelegate <NSObject>

- (void) boardCellSelected:(ClassicViewCell *) boardCell;

@end
