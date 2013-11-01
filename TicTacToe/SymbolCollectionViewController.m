//
//  SymbolCollectionViewController.m
//  TicTacToe
//
//  Created by eandrade21 on 2/24/13.
//  Copyright (c) 2013 eandrade21. All rights reserved.
//

#import "SymbolCollectionViewController.h"
#import "IconCollectionViewCell.h"
#import "IconCollectionViewDelegate.h"

@interface SymbolCollectionViewController ()

@property (strong, nonatomic) NSArray *characterImages;
@property (strong, nonatomic) NSString *charImgPath;

@end

@implementation SymbolCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.clearsSelectionOnViewWillAppear = NO;
    
    //Get Symbol Images
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    _charImgPath = @"Images/Symbols";
    NSString *charAbsPath = [resourcePath stringByAppendingPathComponent:_charImgPath];
    
    NSError *error;
    _characterImages = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:charAbsPath error:&error];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return _characterImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    // we're going to use a custom UICollectionViewCell, which will hold an image and its label
    
    IconCollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"symbolIcon" forIndexPath:indexPath];
    
    NSString *iconName = [_charImgPath stringByAppendingPathComponent:_characterImages[indexPath.row]];
    // load the image for this cell
    cell.icon.image = [UIImage imageNamed:iconName];
    
    return cell;
}

#pragma mark - Collection View Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Icon selected %ld. Image %@", (long)indexPath.row, _characterImages[indexPath.row]);
    
    NSString *iconName = [_charImgPath stringByAppendingPathComponent:_characterImages[indexPath.row]];
    UIImage *image = [UIImage imageNamed:iconName];
    
    [_delegate collectionViewController:self iconImageSelected:image];
    
}

@end
