//
//  ReduxBoardStatusView.m
//  TicTacToe
//
//  Created by eandrade21 on 3/3/13.
//  Copyright (c) 2013 eandrade21. All rights reserved.
//

#import "ReduxBoardStatusView.h"

@implementation ReduxBoardStatusView

- (id)init
{
    
    CGRect frame = CGRectMake(0,0,320,20);
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:240.0f/255.0f green:240.0f/255.0f blue:240.0f/255.0f alpha:1];
        
        self.playerController = [PlayerController getPlayerControllerInstance];
        self.playerNameLabel = [[UILabel alloc] initWithFrame:frame];
        self.playerNameLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:self.playerNameLabel];
    }

    return self;
            

}


@end
