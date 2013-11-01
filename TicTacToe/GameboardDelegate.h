//
//  GameBoardDelegate.h
//  TicTacToe
//
//  Created by eandrade21 on 3/3/13.
//  Copyright (c) 2013 eandrade21. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GameboardDelegate <NSObject>

- (void) updateBoardView: (NSString* ) message;

- (void) resetGame;


@end
