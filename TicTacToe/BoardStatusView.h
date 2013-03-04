//
//  BoardStatusView.h
//  TicTacToe
//
//  Created by PartyMan on 2/16/13.
//  Copyright (c) 2013 PartyMan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BoardStatusView : UIView

@property (strong, nonatomic) NSArray* players;

- (void) sendMessageToActivePlayer:(NSString *) messageType;

@end
