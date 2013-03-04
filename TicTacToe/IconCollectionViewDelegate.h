//
//  IconCollectionViewDelegate.h
//  TicTacToe
//
//  Created by PartyMan on 3/1/13.
//  Copyright (c) 2013 PartyMan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IconCollectionViewDelegate <NSObject>

- (void) collectionViewController:(UICollectionViewController*) collectionVC iconImageSelected:(UIImage*) icon;


@end
