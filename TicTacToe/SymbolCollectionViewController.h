//
//  SymbolCollectionViewController.h
//  TicTacToe
//
//  Created by PartyMan on 2/24/13.
//  Copyright (c) 2013 PartyMan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IconCollectionViewDelegate;

@interface SymbolCollectionViewController : UICollectionViewController

@property (strong, nonatomic) NSObject<IconCollectionViewDelegate> *delegate;

@end
