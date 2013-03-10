//
//  BoardStatusView.m
//  TicTacToe
//
//  Created by PartyMan on 2/16/13.
//  Copyright (c) 2013 PartyMan. All rights reserved.
//

#import "BoardStatusView.h"
#import "PlayerController.h"


@implementation BoardStatusView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id) init{
    
    CGRect frame = CGRectMake(0,0,320,60);
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.playerController = [PlayerController getPlayerControllerInstance];
        
        self.playerCharacterImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,60,60)];
        self.playerSymbolImage = [[UIImageView alloc] initWithFrame:CGRectMake(260,0,60,60)];
        self.playerNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 0, 190, 60)];
        self.playerNameLabel.backgroundColor = [UIColor clearColor];
        
        self.backgroundColor = [UIColor colorWithRed:240.0f/255.0f green:240.0f/255.0f blue:240.0f/255.0f alpha:1];
        
        [self addSubview:self.playerCharacterImage];
        [self addSubview:self.playerSymbolImage];
        [self addSubview:self.playerNameLabel];
        
    }
    return self;
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
