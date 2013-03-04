//
//  IconCollectionViewCell.m
//  TicTacToe
//
//  Created by PartyMan on 2/24/13.
//  Copyright (c) 2013 PartyMan. All rights reserved.
//

#import "IconCollectionViewCell.h"

@implementation IconCollectionViewCell


- (id) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Images/SupportImages/iconPressed.png"]];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
