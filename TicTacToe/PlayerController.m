//
//  PlayerController.m
//  TicTacToe
//
//  Created by PartyMan on 2/26/13.
//  Copyright (c) 2013 PartyMan. All rights reserved.
//

#import "PlayerController.h"
#import "Player.h"


@interface PlayerController()

@property (strong, nonatomic) NSMutableArray *playerList;

@property (strong, nonatomic) Player *activePlayer;

@end

@implementation PlayerController

+ (PlayerController *)getPlayerControllerInstance{
    static dispatch_once_t pred;
    static PlayerController *shared = nil;
    
    dispatch_once(&pred, ^{
        shared = [[PlayerController alloc] init];
        shared.playerList = [[NSMutableArray alloc] init];
        shared.numberOfPlayers = 2;
    });
    return shared;
}


- (void) addPlayer:(NSUInteger) playerIndex{

    //Add a player in case it hasn't been created
    if(playerIndex > _playerList.count){
        Player *player = [[Player alloc] init];
        player.playerIndex = playerIndex;
        player.name = [NSString stringWithFormat:@"Player %d", playerIndex];
        [_playerList addObject:player];
        [self setActivePlayer:player];
    }else{
        Player *player = [_playerList objectAtIndex:playerIndex-1];
        [self setActivePlayer:player];
    }
    
}

- (void) updateActivePlayerCharacterIcon:(UIImage *) characterIcon{
    _activePlayer.character = characterIcon;
}

- (void) updateActivePlayerSymbolIcon:(UIImage *) symbolCharacter{
    _activePlayer.symbol = symbolCharacter;
}

- (Player*) getActivePlayer{
    return _activePlayer;
}

- (UIImage *) getActivePlayerSymbol{
    return _activePlayer.symbol;
}

- (int) getActivePlayerIndex{
    return _activePlayer.playerIndex;
}

- (void) setNextActivePlayer{
    
    int nextPlayerIndex = _activePlayer.playerIndex;
    
    if(nextPlayerIndex >= _playerList.count){
        _activePlayer = _playerList[0];
    }else{
        _activePlayer = _playerList[nextPlayerIndex];
    }
}

- (BOOL) areAllPlayersDefined{
    return (_playerList.count == _numberOfPlayers) ? YES : NO;
}

- (void) resetPlayers{
    _playerList = nil;
    _playerList = [[NSMutableArray alloc] init];
    
}




@end
