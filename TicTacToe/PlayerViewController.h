//
//  PlayerViewController.h
//  TicTacToe
//
//  Created by eandrade21 on 2/24/13.
//  Copyright (c) 2013 eandrade21. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IconCollectionViewDelegate.h"

@class CharacterCollectionViewController;
@class SymbolCollectionViewController;

@interface PlayerViewController : UIViewController <IconCollectionViewDelegate>

@property (assign, nonatomic) int playerIndex;
@property (assign, nonatomic) CharacterCollectionViewController* characterIconsVC;
@property (assign, nonatomic) SymbolCollectionViewController* symbolIconsVC;

- (void) resetPlayers;
- (IBAction)updatePlayer:(UIButton*)sender;

@end
