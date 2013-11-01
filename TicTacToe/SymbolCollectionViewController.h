//
//  SymbolCollectionViewController.h
//  TicTacToe
//
//  Created by eandrade21 on 2/24/13.
//  Copyright (c) 2013 eandrade21. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IconCollectionViewDelegate;

@interface SymbolCollectionViewController : UICollectionViewController

@property (strong, nonatomic) NSObject<IconCollectionViewDelegate> *delegate;

@end
