//
//  Player.h
//  TicTacToe
//
//  Created by eandrade21 on 2/15/13.
//  Copyright (c) 2013 eandrade21. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (assign, nonatomic) int playerIndex;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) UIImage *character;
@property (strong, nonatomic) UIImage *symbol;


@end
