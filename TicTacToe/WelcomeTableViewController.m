//
//  WelcomeViewController.m
//  TicTacToe
//
//  Created by eandrade21 on 2/24/13.
//  Copyright (c) 2013 eandrade21. All rights reserved.
//

#import "WelcomeTableViewController.h"
#import "PlayerViewController.h"

@interface WelcomeTableViewController ()

@end

@implementation WelcomeTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - prepare segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"addPlayer"]) {
        
        PlayerViewController *playerViewController = [segue destinationViewController];
        playerViewController.playerIndex = 1;
        playerViewController.title = @"Player 1";
        [playerViewController resetPlayers];
    }
}


@end
