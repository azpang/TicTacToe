//
//  InitViewController.h
//  TicTacToe
//
//  Created by PartyMan on 2/14/13.
//  Copyright (c) 2013 PartyMan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface InitViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) Player *playerOne;
@property (strong, nonatomic) Player *playerTwo;

@property (weak, nonatomic) IBOutlet UITextField *playerOneName;
@property (weak, nonatomic) IBOutlet UITextField *playerTwoName;
@property (strong, nonatomic) UIImageView *playerOneCharacterPressed;
@property (strong, nonatomic) UIImageView *playerTwoCharacterPressed;
@property (strong, nonatomic) UIImageView *playerOneSymbolPressed;
@property (strong, nonatomic) UIImageView *playerTwoSymbolPressed;
@property (strong, nonatomic) IBOutlet UIButton *startGameButton;

- (IBAction)playerDidEnterName:(id)sender;
- (IBAction)palyerOneSelectedCharacter:(UIButton*)sender;
- (IBAction)palyerTwoSelectedCharacter:(UIButton*)sender;
- (IBAction)palyerOneSelectedSymbol:(UIButton*)sender;
- (IBAction)playerTwoSelectedSymbol:(UIButton*)sender;
- (IBAction)buttonStartGamePressed:(id)sender;

@end
