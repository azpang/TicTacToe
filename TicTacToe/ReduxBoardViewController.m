//
//  ReduxBoardViewController.m
//  TicTacToe
//
//  Created by eandrade21 on 3/3/13.
//  Copyright (c) 2013 eandrade21. All rights reserved.
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
    
    _gameboard = [[Gameboard alloc] initRedux];
    _gameboard.delegate = self;
    
    CGRect viewSize = self.view.bounds;
    _classicView = [[ClassicView alloc] initWithFrame:viewSize];
    _classicView.delegate = self;
    [self.view addSubview:_classicView];
    
    [self updateBoardView:PLAYER_TURN_MSG];
    
    
}


#pragma  mark - ClassicViewDelegate methods
- (void) nextPlayerTurn:(int) boardCellSelected{
    [_gameboard playerDidMove:boardCellSelected];
}

#pragma mark - Gameboard delegate
- (void) updateBoardView: (NSString* ) message{
    [_classicView.reduxStatusBar sendMessageToActivePlayer:message];
}

- (void) resetGame{
    
}


@end
