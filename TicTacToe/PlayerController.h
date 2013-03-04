//
//  PlayerController.h
//  TicTacToe
//
//  Created by PartyMan on 2/26/13.
//  Copyright (c) 2013 PartyMan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Player;

@interface PlayerController : NSObject

//Value hardcoded to 2 in constructor
@property (assign, nonatomic) int numberOfPlayers;

+(PlayerController*) getPlayerController;
-(void) addPlayer:(NSUInteger) playerIndex;
- (void) updateActivePlayerCharacterIcon:(UIImage *) characterIcon;
- (void) updateActivePlayerSymbolIcon:(UIImage *) symbolIcon;
- (Player *)getActivePlayer;
- (UIImage *) getActivePlayerSymbol;
- (int) getActivePlayerIndex;
- (void) setNextActivePlayer;
- (BOOL) areAllPlayersDefined;
- (void) resetPlayers;

@end
