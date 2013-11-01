//
//  PlayerController.h
//  TicTacToe
//
//  Created by eandrade21 on 2/26/13.
//  Copyright (c) 2013 eandrade21. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Player;

@interface PlayerController : NSObject

//Value hardcoded to 2 in constructor
@property (assign, nonatomic) int numberOfPlayers;

+(PlayerController*) getPlayerControllerInstance;
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
