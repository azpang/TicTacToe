//
//  BoardViewController.m
//  TicTacToe
//
//  Created by PartyMan on 2/16/13.
//  Copyright (c) 2013 PartyMan. All rights reserved.
//

#import "BoardViewController.h"
#import "BoardStatusView.h"
#import "Gameboard.h"
#import "MessageTypes.h"
#import "GameboardDelegate.h"
#import "PlayerController.h"


@interface BoardViewController ()

@property (strong, nonatomic) BoardStatusView *boardStatusView;
@property (strong, nonatomic) Gameboard *gameBoard;
@property (strong, nonatomic) PlayerController *playerController;

@end

@implementation BoardViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.view subviews];
    
    _playerController = [PlayerController getPlayerController];
    
    _gameBoard = [[Gameboard alloc] init];
    _gameBoard.delegate = self;
    
    _boardStatusView = [[BoardStatusView alloc] init];;
    [self.view addSubview:_boardStatusView];

    [self updateBoardView:PLAYER_TURN];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)boardButtonPressed:(UIButton *) button{
    
    [button setImage:[_playerController getActivePlayerSymbol] forState:UIControlStateDisabled];
    button.enabled = NO;
    [_gameBoard playerDidMove:button.tag];
    
}


#pragma GameboardDelegate

- (void) updateBoardView: (NSString* ) message{
    
    if([message isEqualToString:PLAYER_WIN]){
        //[self disableActiveButtonsLeft];
    }
    
    [_boardStatusView sendMessageToActivePlayer:message];
    
}



@end
