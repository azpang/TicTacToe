//
//  InitViewController.m
//  TicTacToe
//
//  Created by PartyMan on 2/14/13.
//  Copyright (c) 2013 PartyMan. All rights reserved.
//

#import "InitViewController.h"
#import "BoardViewController.h"

@interface InitViewController ()

@end

@implementation InitViewController

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
    NSLog(@"View DidLoad Enter");
	// Do any additional setup after loading the view.
    
    self.playerOne = [[Player alloc] init];
    self.playerTwo = [[Player alloc] init];
    
    
    self.playerOneCharacterPressed = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60,60)];
    self.playerOneCharacterPressed.image = [UIImage imageNamed:@"buttonPressed.png"];
    self.playerOneCharacterPressed. contentMode = UIViewContentModeScaleAspectFill;
    self.playerOneCharacterPressed.hidden = YES;
    [self.view addSubview:self.playerOneCharacterPressed];
    
    self.playerTwoCharacterPressed = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60,60)];
    self.playerTwoCharacterPressed.image = [UIImage imageNamed:@"buttonPressed.png"];
    self.playerTwoCharacterPressed.contentMode = UIViewContentModeScaleAspectFill;
    self.playerTwoCharacterPressed.hidden = YES;
    [self.view addSubview:self.playerTwoCharacterPressed];
    
    self.playerOneSymbolPressed = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60,60)];
    self.playerOneSymbolPressed.image = [UIImage imageNamed:@"buttonPressed.png"];
    self.playerOneSymbolPressed.contentMode = UIViewContentModeScaleAspectFill;
    self.playerOneSymbolPressed.hidden = YES;
    [self.view addSubview:self.playerOneSymbolPressed];
    
    self.playerTwoSymbolPressed = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60,60)];
    self.playerTwoSymbolPressed.image = [UIImage imageNamed:@"buttonPressed.png"];
    self.playerTwoSymbolPressed.contentMode = UIViewContentModeScaleAspectFill;
    self.playerTwoSymbolPressed.hidden = YES;
    [self.view addSubview:self.playerTwoSymbolPressed];
    
    self.startGameButton.enabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playerDidEnterName:(UITextField *)sender{
    
    if([sender isEqual:self.playerOneName]){
        NSLog(@"%@", sender.text);
        self.playerOne.name = sender.text;
    }else{
        self.playerTwo.name = sender.text;
    }
    
    [sender resignFirstResponder];
    
    [self arePlayersDefined];
}

- (IBAction)palyerOneSelectedCharacter:(UIButton *)sender{
    NSLog(@"Player One Selected a Character");
    
    self.playerOne.character = sender.currentImage;
    
    self.playerOneCharacterPressed.frame = CGRectMake(sender.frame.origin.x, sender.frame.origin.y, 60,60);
    self.playerOneCharacterPressed.hidden = FALSE;
    [self.view sendSubviewToBack:self.playerOneCharacterPressed];
    
    [self arePlayersDefined];
}

- (IBAction)palyerTwoSelectedCharacter:(UIButton *)sender{
    NSLog(@"Player Two Selected a Character");
    
    self.playerTwo.character = sender.currentImage;
    
    self.playerTwoCharacterPressed.frame = CGRectMake(sender.frame.origin.x, sender.frame.origin.y, 60,60);
    self.playerTwoCharacterPressed.hidden = FALSE;
    [self.view sendSubviewToBack:self.playerTwoCharacterPressed];
    
    [self arePlayersDefined];
}

- (IBAction)palyerOneSelectedSymbol:(UIButton *)sender{
    NSLog(@"Player One Selected a Symbol");
    
    self.playerOne.symbol = sender.currentImage;
    
    self.playerOneSymbolPressed.frame = CGRectMake(sender.frame.origin.x, sender.frame.origin.y, 60,60);
    self.playerOneSymbolPressed.hidden = FALSE;
    [self.view sendSubviewToBack:self.playerOneSymbolPressed];
    
    [self arePlayersDefined];
}

- (IBAction)playerTwoSelectedSymbol:(UIButton *)sender{
    NSLog(@"Player Two Selected a Symbol");
    
    self.playerTwo.symbol = sender.currentImage;
    
    self.playerTwoSymbolPressed.frame = CGRectMake(sender.frame.origin.x, sender.frame.origin.y, 60,60);
    self.playerTwoSymbolPressed.hidden = FALSE;
    [self.view sendSubviewToBack:self.playerTwoSymbolPressed];
    
    [self arePlayersDefined];
}

- (IBAction)buttonStartGamePressed:(id)sender{
    NSLog(@"Player 1: %@", self.playerOne);
    NSLog(@"Player 2: %@", self.playerTwo);
    
}

- (void) arePlayersDefined{
    if([self.playerOne isPlayerDefined] && [self.playerTwo isPlayerDefined]){
        self.startGameButton.enabled = YES;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowBoard"]) {
        
        NSArray *players = [[NSArray alloc] initWithObjects:self.playerOne, self.playerTwo, nil];
        
        BoardViewController *boardViewController = [segue destinationViewController];
        boardViewController.players = players;
    }
}


@end
