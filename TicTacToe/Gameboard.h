//
//  Gameboard.h
//  TicTacToe
//
//  Created by eandrade21 on 2/24/13.
//  Copyright (c) 2013 eandrade21. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GameboardDelegate;

@interface Gameboard : NSObject

@property (strong, nonatomic) NSObject<GameboardDelegate> *delegate;

-(id) initRedux;
-(void) playerDidMove:(int) boardIndex;

@end
