//
//  PlayerViewController.m
//  TicTacToe
//
//  Created by PartyMan on 2/24/13.
//  Copyright (c) 2013 PartyMan. All rights reserved.
//

#import "PlayerViewController.h"
#import "PlayerController.h"
#import "CharacterCollectionViewController.h"
#import "SymbolCollectionViewController.h"

@interface PlayerViewController ()

@property (strong, nonatomic) PlayerController *playerController;
@property (assign, nonatomic) BOOL isCharacterSelected;
@property (assign, nonatomic) BOOL isSymbolSelected;
@property (strong, nonatomic) UIViewController *nextScreen;

@end

@implementation PlayerViewController

- (id) initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Custom initialization
        _playerController = [PlayerController getPlayerController];
        _isCharacterSelected = NO;
        _isSymbolSelected = NO;
        _nextScreen = nil;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //Add Player when the view loads
    [_playerController addPlayer:_playerIndex];
    

    NSArray *childViewControllers = self.childViewControllers;
    
    
    //NOTE: May not be the safest way to do this. What happens if childViewControllers have other types p
    for(UIViewController *vc in childViewControllers){
        if([vc class] == [CharacterCollectionViewController class]){
            _characterIconsVC = vc;
            _characterIconsVC.delegate = self;
        }
        
        if([vc class] == [SymbolCollectionViewController class]){
            _symbolIconsVC = vc;
            _symbolIconsVC.delegate = self;
        }
        
    }
    
}

- (IBAction)updatePlayer:(UIButton*)sender{
    
    
    if(_nextScreen == nil){
        
        if([_playerController areAllPlayersDefined]){
            
            [self performSegueWithIdentifier:@"startGame" sender:self];
        }else{
            PlayerViewController *viewController = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:NULL] instantiateViewControllerWithIdentifier:@"PlayerViewController"];
            
            viewController.playerIndex = _playerIndex+1;
            viewController.title = [NSString stringWithFormat:@"Player %d", _playerIndex+1];
            
            _nextScreen = viewController;
            
            [[self navigationController] pushViewController:viewController animated:YES];
        }
    }else{
        [[self navigationController] pushViewController:_nextScreen animated:YES];
    }
    
}

- (void) resetPlayers{
    [_playerController resetPlayers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Delegate methods
- (void) collectionViewController:(UICollectionViewController*) collectionVC iconImageSelected:(UIImage*) icon{
    NSLog(@"Collection %@. Image %@", collectionVC.class, icon);
    
    if ([collectionVC class] == [CharacterCollectionViewController class]) {
        [_playerController updateActivePlayerCharacterIcon:icon];
    }
    
    if ([collectionVC class] == [SymbolCollectionViewController class]){
        [_playerController updateActivePlayerSymbolIcon:icon];
    }
}



@end
