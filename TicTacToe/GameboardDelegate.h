//
//  GameBoardDelegate.h
//  TicTacToe
//
//  Created by PartyMan on 3/3/13.
//  Copyright (c) 2013 PartyMan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GameboardDelegate <NSObject>

- (void) updateBoardView: (NSString* ) message;


@end
