//
//  StatusView.h
//  TicTacToe
//
//  Created by eandrade21 on 3/5/13.
//  Copyright (c) 2013 eandrade21. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayerController.h"


@interface StatusView : UIView

@property (strong, nonatomic) PlayerController *playerController;
@property (strong, nonatomic) UIImageView *playerCharacterImage;
@property (strong, nonatomic) UIImageView *playerSymbolImage;
@property (strong, nonatomic) UILabel *playerNameLabel;
@property (strong, nonatomic) UILabel *message;

- (id) initWithFrame:(CGRect)frame;
- (void) sendMessageToActivePlayer:(NSString *) messageType;

@end
