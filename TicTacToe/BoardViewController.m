//
//  BoardViewController.m
//  TicTacToe
//
//  Created by eandrade21 on 2/16/13.
//  Copyright (c) 2013 eandrade21. All rights reserved.
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

@property (weak, nonatomic) IBOutlet UIButton *restartButton;

@property (weak, nonatomic) IBOutlet UIButton *button0;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button7;
@property (weak, nonatomic) IBOutlet UIButton *button8;

@property (strong, nonatomic) NSArray *buttons;

@end

@implementation BoardViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.buttons = [self storeButtonReferences];
    [self setUpView];
    
}

- (void) setUpView{
    
    self.playerController = [PlayerController getPlayerControllerInstance];
    
    self.gameBoard = [[Gameboard alloc] init];
    self.gameBoard.delegate = self;
    
    self.boardStatusView = [[BoardStatusView alloc] init];;
    [self.view addSubview:_boardStatusView];
    
    [self updateBoardView:PLAYER_TURN_MSG];
}

- (NSArray *) storeButtonReferences{
    
    NSMutableArray *buttons = [[NSMutableArray alloc] init];
    
    [buttons addObject:self.button0];
    [buttons addObject:self.button1];
    [buttons addObject:self.button2];
    [buttons addObject:self.button3];
    [buttons addObject:self.button4];
    [buttons addObject:self.button5];
    [buttons addObject:self.button6];
    [buttons addObject:self.button7];
    [buttons addObject:self.button8];
    
    return buttons;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)boardButtonPressed:(UIButton *) button{
    
    [button setImage:[_playerController getActivePlayerSymbol] forState:UIControlStateDisabled];
    button.enabled = NO;
    [self.gameBoard playerDidMove:button.tag];
    
}
- (IBAction)resetGame:(UIButton *)sender {
    [self resetGame];
}

- (void) resetGame{
    
    //Hide button
    self.restartButton.hidden = YES;
    
    //Reset Buttons
    for(UIButton *button in self.buttons){
        button.enabled = YES;
        [button setImage:[UIImage imageNamed:@"Images/SupportImages/Wall.png"] forState:UIControlStateNormal];
    }
    
    //Reset gameBoard
    self.gameBoard = nil;
    self.boardStatusView = nil;
    
    [self setUpView];
    
}

#pragma GameboardDelegate

- (void) updateBoardView: (NSString* ) message{
    
    if([message isEqualToString:PLAYER_WIN] || [message isEqualToString:GAME_DRAW]){
        //Reset Buttons
        for(UIButton *button in self.buttons){
            button.enabled = NO;
        }
        self.restartButton.hidden = NO;
    }
    
    [_boardStatusView sendMessageToActivePlayer:message];
    
}



@end
