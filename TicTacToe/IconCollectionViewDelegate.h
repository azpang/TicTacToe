//
//  IconCollectionViewDelegate.h
//  TicTacToe
//
//  Created by eandrade21 on 3/1/13.
//  Copyright (c) 2013 eandrade21. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IconCollectionViewDelegate <NSObject>

- (void) collectionViewController:(UICollectionViewController*) collectionVC iconImageSelected:(UIImage*) icon;


@end
