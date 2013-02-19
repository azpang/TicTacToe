//
//  BoardViewController.m
//  TicTacToe
//
//  Created by PartyMan on 2/16/13.
//  Copyright (c) 2013 PartyMan. All rights reserved.
//

#import "BoardViewController.h"
#import "BoardStatusView.h"
#import "Player.h"
#import "MessageTypes.h"

@interface BoardViewController ()

@property (assign, nonatomic) int activePlayer;
@property (assign, nonatomic) int leftTurns;

@end

@implementation BoardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.statusBar = [[BoardStatusView alloc] initWithPlayer:self.players];
    [self.view addSubview:self.statusBar];
    [self initGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)boardButtonPressed:(UIButton *) button{
    
    NSLog(@"Board Button Pressed");
    
    [self.players[self.activePlayer] playerDidMove:button.tag];
    
    //Update board and deactivate the button
    [button setImage:[self.players[self.activePlayer] symbol] forState:UIControlStateNormal];
    button.enabled = NO;
    
    if([self didPlayerWin:self.activePlayer]){
    //Player Did Win
        [self.statusBar sendMessageToPlayer:self.activePlayer messageContent:PLAYER_WIN];
        
        NSArray *boardSubViews = self.view.subviews;
        
        for (int i = 0; i<boardSubViews.count; i++) {
            if([boardSubViews[i] isKindOfClass:[UIButton class]]){
                UIButton *button = (UIButton *)boardSubViews[i];
                button.enabled = NO;
            }
        }
        
    }else{
    //Player Did Not Win
    
        self.leftTurns = --self.leftTurns;
        
        if(self.leftTurns == 0){
            //End of the game
            [self.statusBar sendMessageToPlayer:self.activePlayer messageContent:GAME_DRAW];
            
        }else{
            //Continue Playing
            [self changeActivePlayer];
            [self.statusBar sendMessageToPlayer:self.activePlayer messageContent:PLAYER_TURN];
            
        }
    }
    
}

- (void)initGame{

    
    self.leftTurns = 9;
    
    //Clear player moves from previous game
    [self.players[0] clearMoves];
    [self.players[1] clearMoves];
    
    self.activePlayer = 0;
    [self.statusBar sendMessageToPlayer:self.activePlayer messageContent:PLAYER_TURN];
}

- (void) changeActivePlayer{
    if(self.activePlayer == 0){
        self.activePlayer = 1;
    }else{
        self.activePlayer = 0;
    }
}

- (BOOL)didPlayerWin:(int) playerIndex{
    
    return [self.players[playerIndex] didPlayerWin];
}

@end
