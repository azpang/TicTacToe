//
//  ReduxBoardViewController.m
//  TicTacToe
//
//  Created by PartyMan on 3/3/13.
//  Copyright (c) 2013 PartyMan. All rights reserved.
//

#import "ReduxBoardViewController.h"
#import "ClassicView.h"
#import "Gameboard.h"
#import "ReduxBoardStatusView.h"
#import "MessageTypes.h"

@interface ReduxBoardViewController ()

@property (strong, nonatomic) Gameboard *gameboard;

@end

@implementation ReduxBoardViewController

-(id) initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    
    if(self){
        //Custom initialiation code
       
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
     NSLog(@"Redux View coordinates X: %f, Y: %f, Width: %f, Height: %f", self.view.bounds.origin.x, self.view.bounds.origin.y, self.view.bounds.size.width, self.view.bounds.size.height);
    
    _gameboard = [[Gameboard alloc] initRedux];
    _gameboard.delegate = self;
    
    CGRect viewSize = self.view.bounds;
    _classicView = [[ClassicView alloc] initWithFrame:viewSize];
    _classicView.delegate = self;
    [self.view addSubview:_classicView];
    
    [self updateBoardView:PLAYER_TURN];
    
    
}

- (void) nextPlayerTurn:(int) boardCellSelected{
    
    [_gameboard playerDidMove:boardCellSelected];
    
}

#pragma mark - Gameboard delegate

- (void) updateBoardView: (NSString* ) message{
    
    [_classicView.reduxStatusBar sendMessageToActivePlayer:message];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
