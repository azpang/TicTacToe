//
//  Gameboard.m
//  TicTacToe
//
//  Created by PartyMan on 2/24/13.
//  Copyright (c) 2013 PartyMan. All rights reserved.
//

#import "Gameboard.h"
#import "PlayerController.h"
#import "Player.h"
#import "MessageTypes.h"
#import "GameboardDelegate.h"

@interface Gameboard ()

@property (strong, nonatomic) NSMutableArray *winningCombinations;
@property (assign, nonatomic) int movesLeft;
@property (assign, nonatomic) int boardSpaces;
@property (strong, nonatomic) PlayerController *playerController;
@property (strong, nonatomic) NSMutableArray *playersMoves;

@end

@implementation Gameboard

- (id) init{
    
    self = [super init];
    
    
    if(self){
        
        //InitWinningCompetitions
        //Init Win combinations
        NSArray *w1 = [[NSArray alloc] initWithObjects:@1,@1,@1,@0,@0,@0,@0,@0,@0,nil];
        NSArray *w2 = [[NSArray alloc] initWithObjects:@0,@0,@0,@1,@1,@1,@0,@0,@0,nil];
        NSArray *w3 = [[NSArray alloc] initWithObjects:@0,@0,@0,@0,@0,@0,@1,@1,@1,nil];
        NSArray *w4 = [[NSArray alloc] initWithObjects:@1,@0,@0,@1,@0,@0,@1,@0,@0,nil];
        NSArray *w5 = [[NSArray alloc] initWithObjects:@0,@1,@0,@0,@1,@0,@0,@1,@0,nil];
        NSArray *w6 = [[NSArray alloc] initWithObjects:@0,@0,@1,@0,@0,@1,@0,@0,@1,nil];
        NSArray *w7 = [[NSArray alloc] initWithObjects:@1,@0,@0,@0,@1,@0,@0,@0,@1,nil];
        NSArray *w8 = [[NSArray alloc] initWithObjects:@0,@0,@1,@0,@1,@0,@1,@0,@0,nil];
        
        _winningCombinations = [[NSMutableArray alloc] initWithCapacity:8];
        [_winningCombinations addObject:w1];
        [_winningCombinations addObject:w2];
        [_winningCombinations addObject:w3];
        [_winningCombinations addObject:w4];
        [_winningCombinations addObject:w5];
        [_winningCombinations addObject:w6];
        [_winningCombinations addObject:w7];
        [_winningCombinations addObject:w8];
        
        //Total number of moves
        _movesLeft = 9;
        
        //Total number of board spaces
        _boardSpaces = 9;
        
        //Get a player controller instance
        _playerController = [PlayerController getPlayerControllerInstance];
        [_playerController setNextActivePlayer];
        
        
        NSMutableArray *emptyGameBoard = [[NSMutableArray alloc] initWithObjects:@0,@0,@0,@0,@0,@0,@0,@0,@0,nil];

        //Init an array per player for its moves
        _playersMoves = [[NSMutableArray alloc] init];
        
        for(int i=0; i < (int)_playerController.numberOfPlayers; i++){
            [_playersMoves addObject:[[NSMutableArray alloc] initWithArray:emptyGameBoard copyItems:YES]];
        }
        
        
    }
    
    return self;
}

-(id) initRedux{
    
    PlayerController *playerController = [PlayerController getPlayerControllerInstance];
    
    //Init Players
    [playerController addPlayer:1];
    [playerController addPlayer:2];
    
    self = [self init];
    
    if(self){
        
    }
    
    return self;
    
}

-(void) playerDidMove:(int) boardIndex{
    
    Player *activePlayer = _playerController.getActivePlayer;
    
    NSMutableArray *activePlayerMoves = [_playersMoves objectAtIndex:activePlayer.playerIndex-1];
    
    activePlayerMoves[boardIndex] = @1;
    
    
    
    [self didActivePlayerWin];
}

- (void) didActivePlayerWin{
 
    Player *activePlayer = _playerController.getActivePlayer;
    
    NSMutableArray *activePlayerMoves = [_playersMoves objectAtIndex:activePlayer.playerIndex-1];
    
    BOOL win = NO;
    
    for(int i=0; i<_winningCombinations.count; i++){
        
        int z = [_winningCombinations[i] count];
        NSArray *winCombination = _winningCombinations[i];
        
        for(int x=0; x<winCombination.count; x++){
            
            int a = [winCombination[x] integerValue];
            int b = [activePlayerMoves[x] integerValue];
            
            int c = a & b;
            
            if(c != a){
                break;
            }
            
            z--;
        }
        
        if(z==0){
            win = YES;
            break;
        }
    }
    
    
    if(win){
        NSLog(@"%@ won", activePlayer.name);
        [_delegate updateBoardView:PLAYER_WIN];
    }else{
        _movesLeft = --_movesLeft;
        
        if(_movesLeft == 0){
            //End of the game
            //[self.statusBar sendMessageToPlayer:self.activePlayer messageContent:GAME_DRAW];
            NSLog(@"Game Draw");
            [_delegate updateBoardView:GAME_DRAW];
            
        }else{
            //Continue Playing
            [_playerController setNextActivePlayer];
            NSLog(@"%@ your turn", _playerController.getActivePlayer);
            [_delegate updateBoardView:PLAYER_TURN];
        }
    }
    
}

@end
