//
//  StatusView.m
//  TicTacToe
//
//  Created by eandrade21 on 3/5/13.
//  Copyright (c) 2013 eandrade21. All rights reserved.
//

#import "StatusView.h"
#import "PlayerController.h"
#import "Player.h"
#import "MessageTypes.h"

@implementation StatusView

- (id) initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if(self){
        
    }
    
    return self;
}

- (void) sendMessageToActivePlayer:(NSString *) messageType{
    
    Player *player = _playerController.getActivePlayer;
    
    self.playerCharacterImage.image = player.character;
    self.playerSymbolImage.image = player.symbol;
    
    if([messageType isEqualToString:PLAYER_TURN_MSG]){
        
        self.playerNameLabel.text = [NSString stringWithFormat:@"%@: Your turn", player.name];
        
    }else if ([messageType isEqualToString:PLAYER_WIN]){
        self.backgroundColor = [UIColor greenColor];
        self.playerNameLabel.text = [NSString stringWithFormat:@"%@: You won!!!", player.name];
    }else if ([messageType isEqualToString:GAME_DRAW]){
        self.playerNameLabel.text = [NSString stringWithFormat:@"Game Draw"];
    }
    
}

@end
